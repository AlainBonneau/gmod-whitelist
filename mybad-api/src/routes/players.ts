import { Router } from "express";
import { getAllPlayersInWhitelist } from "../controllers/player.controller.js";

const router = Router();

// Route pour récupérer tous les joueurs dans la whitelist d'un job spécifique
router.get("/:id", getAllPlayersInWhitelist);

export default router;
