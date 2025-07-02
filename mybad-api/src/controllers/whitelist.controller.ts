import { Request, Response } from "express";
import pool from "../db/index.js";

export const getAllWhitelists = async (req: Request, res: Response) => {
  try {
    const [rows] = await pool.query("SELECT * FROM whitelist");
    res.json(rows);
  } catch (error) {
    console.error("Impossible de fetch les données", error);
    res.status(500).json({ error: "Erreur interne du serveur" });
  }
};
