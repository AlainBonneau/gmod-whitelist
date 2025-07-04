import { Router } from "express";
import { getAllPlayersInWhitelist, addPlayerToWhitelist } from "../controllers/player.controller.js";

const router = Router();

// Route pour récupérer tous les joueurs dans la whitelist d'un job spécifique
router.get("/whitelist/players/:id", getAllPlayersInWhitelist);
router.post("/whitelist/players", addPlayerToWhitelist);

export default router;
