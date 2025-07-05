import { Request, Response } from "express";
import pool from "../db/index.js";

// Fonction pour récupérer tous les joueurs dans la whitelist d'un job spécifique
export const getAllPlayersInWhitelist = async (req: Request, res: Response) => {
  const job_id = Number(req.params.job_id) - 1;
  if (isNaN(job_id)) {
    res.status(400).json({ error: "job_id invalide" });
    return;
  }

  try {
    const [rows] = await pool.query(
      `SELECT 
        l.account_id,
        d.nick,
        l.usergroup,
        l.blacklist,
        l.job_id
      FROM srv1_gas_jobwhitelist_listing l
      LEFT JOIN gas_offline_player_data d ON l.account_id = d.account_id
      WHERE l.job_id = ?;`,
      [job_id]
    );

    res.json(
      (rows as any[]).map((row) => ({
        ...row,
        job_id: row.job_id + 1,
      }))
    );
  } catch (error) {
    console.error("Impossible de récupérer les joueurs", error);
    res.status(500).json({ error: "Erreur interne du serveur" });
  }
};

// Fonction pour ajouter un joueur à la whitelist d'un job spécifique
export const addPlayerToWhitelist = async (
  req: Request,
  res: Response
): Promise<void> => {
  let { job_id, account_id, added_by } = req.body;
  if (!job_id || !account_id) {
    res.status(400).json({ error: "job_id et account_id requis" });
    return;
  }
  job_id = Number(job_id) - 1;

  try {
    const [result] = await pool.query(
      `INSERT INTO srv1_gas_jobwhitelist_listing 
         (blacklist, job_id, account_id, usergroup, lua_function, added_by)
       VALUES (0, ?, ?, NULL, NULL, ?);`,
      [job_id, account_id, added_by || null]
    );

    res.status(201).json({ success: true, insertId: (result as any).insertId });
  } catch (error) {
    if ((error as any).code === "ER_DUP_ENTRY") {
      res.status(409).json({ error: "Joueur déjà whitelisté sur ce job" });
      return;
    }
    console.error("Impossible d'ajouter à la whitelist", error);
    res.status(500).json({ error: "Erreur interne du serveur" });
  }
};

// Fonction pour supprimer un joueur de la whitelist d'un job spécifique
export const removePlayerFromWhitelist = async (
  req: Request,
  res: Response
): Promise<void> => {
  let { job_id, account_id } = req.body;
  if (!job_id || !account_id) {
    res.status(400).json({ error: "job_id et account_id requis" });
    return;
  }
  job_id = Number(job_id) - 1;

  try {
    const [result] = await pool.query(
      `DELETE FROM srv1_gas_jobwhitelist_listing WHERE job_id = ? AND account_id = ?`,
      [job_id, account_id]
    );

    if ((result as any).affectedRows === 0) {
      res.status(404).json({ error: "Aucune entrée trouvée à supprimer" });
      return;
    }

    res.json({ success: true, deleted: (result as any).affectedRows });
  } catch (error) {
    console.error("Impossible de supprimer de la whitelist", error);
    res.status(500).json({ error: "Erreur interne du serveur" });
  }
};
