import { Router } from "express";
import { getAllWhitelists, getWhitelistById } from "../controllers/whitelist.controller.js";

const router = Router();

// Route whitelist
router.get("/whitelist", getAllWhitelists);
router.get("/whitelist/:id", getWhitelistById);

export default router;
