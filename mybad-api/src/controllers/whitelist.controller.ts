import { Request, Response } from "express";
import pool from "../db/index.js";
import { ResultSetHeader } from "mysql2/promise";

// Afficher toutes les whitelists
export const getAllWhitelists = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const [rows] = await pool.query(
      `SELECT 
         wl.job_id,
         wl.blacklist,
         jr.name AS job_name
       FROM srv1_gas_jobwhitelist_enabled_lists wl
       LEFT JOIN gas_job_registry jr ON (wl.job_id + 1) = jr.job_id
       ORDER BY wl.job_id ASC`
    );
    res.json(
      (rows as any[]).map((row) => ({
        job_id: row.job_id + 1,
        blacklist: row.blacklist,
        job_name: row.job_name,
      }))
    );
  } catch (error) {
    console.error("Impossible de fetch les données", error);
    res.status(500).json({ error: "Erreur interne du serveur" });
  }
};

// Afficher une whitelist par son ID (+1 affiché)
export const getWhitelistById = async (
  req: Request,
  res: Response
): Promise<void> => {
  const jobId = parseInt(req.params.id, 10) - 1;
  if (isNaN(jobId)) {
    res.status(400).json({ error: "Paramètre id invalide" });
    return;
  }
  try {
    const [rows] = await pool.query(
      `SELECT 
         wl.job_id,
         wl.blacklist,
         jr.name AS job_name
       FROM srv1_gas_jobwhitelist_enabled_lists wl
       LEFT JOIN gas_job_registry jr ON (wl.job_id + 1) = jr.job_id
       WHERE wl.job_id = ?`,
      [jobId]
    );
    if ((rows as any[]).length === 0) {
      res.status(404).json({ error: "Whitelist non trouvée" });
      return;
    }
    const row = (rows as any)[0];
    res.json({
      job_id: row.job_id + 1,
      blacklist: row.blacklist,
      job_name: row.job_name,
    });
  } catch (error) {
    console.error("Impossible de fetch la donnée", error);
    res.status(500).json({ error: "Erreur interne du serveur" });
  }
};

// Ajouter un job à la whitelist
export const addJobToWhitelist = async (
  req: Request,
  res: Response
): Promise<void> => {
  let { job_id, blacklist = 0 } = req.body;

  if (!job_id) {
    res.status(400).json({ error: "job_id requis" });
    return;
  }

  job_id = Number(job_id) - 1;

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

    res.json({ success: true, job_id: job_id + 1, blacklist });
  } catch (error) {
    console.error("Impossible d'ajouter le job à la whitelist", error);
    res.status(500).json({ error: "Erreur interne du serveur" });
  }
};

// Supprimer un job de la whitelist
export const removeJobFromWhitelist = async (
  req: Request,
  res: Response
): Promise<void> => {
  const { job_id: jobIdParam } = req.params;

  if (!jobIdParam) {
    res.status(400).json({ error: "job_id requis" });
    return;
  }

  const jobId = Number(jobIdParam) - 1;

  if (isNaN(jobId)) {
    res.status(400).json({ error: "job_id doit être un nombre valide" });
    return;
  }

  try {
    const [result] = await pool.query<ResultSetHeader>(
      `DELETE FROM srv1_gas_jobwhitelist_enabled_lists WHERE job_id = ?`,
      [jobId]
    );

    if (result.affectedRows === 0) {
      res.status(404).json({ error: "Job non trouvé dans la whitelist" });
      return;
    }

    res.json({
      success: true,
      message: "Job supprimé de la whitelist",
      job_id: jobId + 1,
    });
  } catch (error) {
    console.error("Impossible de supprimer le job", error);
    res.status(500).json({ error: "Erreur interne du serveur" });
  }
};
