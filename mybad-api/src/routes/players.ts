import { Router } from "express";
import {
  getAllPlayersInWhitelist,
  addPlayerToWhitelist,
  removePlayerFromWhitelist,
} from "../controllers/player.controller.js";

const router = Router();

// Route pour récupérer tous les joueurs dans la whitelist d'un job spécifique
router.get("/whitelist/players/:job_id", getAllPlayersInWhitelist);
router.post("/whitelist/players", addPlayerToWhitelist);
router.delete(
  "/whitelist/players/:job_id/:account_id",
  removePlayerFromWhitelist
);

export default router;
