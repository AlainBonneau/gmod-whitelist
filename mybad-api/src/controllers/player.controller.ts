// player.controller.ts
import { Request, Response } from "express";
import pool from "../db/index.js";
import { jobsMapping } from "../jobs_mapping.js";

export const getAllPlayersInWhitelist = async (req: Request, res: Response) => {
  const { job_id } = req.params;

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
    WHERE l.job_id = 4;
    `,
      [job_id]
    );

    res.json(rows);
  } catch (error) {
    console.error("Impossible de récupérer les joueurs", error);
    res.status(500).json({ error: "Erreur interne du serveur" });
  }
};
