import { Router } from "express";
import { getAllWhitelists } from "../controllers/whitelist.controller.js";

const router = Router();

// Route whitelist
router.get("/whitelist", getAllWhitelists);

export default router;
