import { Request, Response } from "express";
import pool from "../db/index.js";
import { jobsMapping } from "../jobs_mapping.js";

// Controlleur pour afficher toutes les whitelists
export const getAllWhitelists = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const [rows] = await pool.query(
      "SELECT * FROM srv1_gas_jobwhitelist_enabled_lists;"
    );
    const whitelistsWithNames = (rows as any[]).map((row) => ({
      ...row,
      job_name:
        jobsMapping[row.job_id as keyof typeof jobsMapping] || row.job_id,
    }));

    res.json(whitelistsWithNames);
  } catch (error) {
    console.error("Impossible de fetch les données", error);
    res.status(500).json({ error: "Erreur interne du serveur" });
  }
};

// Controlleur pour afficher une whitelist par son ID
export const getWhitelistById = async (
  req: Request,
  res: Response
): Promise<void> => {
  const whitelistId = parseInt(req.params.id, 10);

  if (Number.isNaN(whitelistId)) {
    res.status(400).json({ error: "Paramètre id invalide" });
    return;
  }

  try {
    const [rows] = await pool.query(
      "SELECT * FROM srv1_gas_jobwhitelist_enabled_lists WHERE job_id = ?;",
      [whitelistId]
    );

    const typedRows = rows as any[];

    if (typedRows.length === 0) {
      res.status(404).json({ error: "Whitelist non trouvée" });
      return;
    }

    const whitelist = {
      ...typedRows[0],
      job_name:
        jobsMapping[typedRows[0].job_id as keyof typeof jobsMapping] ||
        typedRows[0].job_id,
    };

    res.json(whitelist);
  } catch (error) {
    console.error("Impossible de fetch les données", error);
    res.status(500).json({ error: "Erreur interne du serveur" });
  }
};

// Controlleur pour ajouter un job à la whitelist
export const addJobToWhitelist = async (
  req: Request,
  res: Response
): Promise<void> => {
  const { job_id, blacklist = 0 } = req.body;

  if (!job_id) {
    res.status(400).json({ error: "job_id requis" });
    return;
  }

  try {
    const [rows] = await pool.query(
      `SELECT * FROM srv1_gas_jobwhitelist_enabled_lists WHERE job_id = ?`,
      [job_id]
    );
    if ((rows as any[]).length > 0) {
      res.status(409).json({ error: "Ce job est déjà en whitelist" });
      return;
    }

    await pool.query(
      `INSERT INTO srv1_gas_jobwhitelist_enabled_lists (job_id, blacklist) VALUES (?, ?)`,
      [job_id, blacklist]
    );

    res.json({ success: true, job_id, blacklist });
  } catch (error) {
    console.error("Impossible d'ajouter le job à la whitelist", error);
    res.status(500).json({ error: "Erreur interne du serveur" });
  }
};

// Controlleur pour supprimer un job de la whitelist
export const removeJobFromWhitelist = async (
  req: Request,
  res: Response
): Promise<void> => {
  const { job_id } = req.params;

  if (!job_id) {
    res.status(400).json({ error: "job_id requis" });
    return;
  }

  try {
    const [result] = await pool.query(
      `DELETE FROM srv1_gas_jobwhitelist_enabled_lists WHERE job_id = ?`,
      [job_id]
    );

    if ((result as any).affectedRows === 0) {
      res.status(404).json({ error: "Job non trouvé dans la whitelist" });
      return;
    }

    res.json({ success: true, job_id: Number(job_id) });
  } catch (error) {
    console.error("Impossible de supprimer le job de la whitelist", error);
    res.status(500).json({ error: "Erreur interne du serveur" });
  }
};
