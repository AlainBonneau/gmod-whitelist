import { Router } from "express";
import { getAllWhitelists, getWhitelistById } from "../controllers/whitelist.controller.js";

const router = Router();

// Route whitelist
router.get("/", getAllWhitelists);
router.get("/:id", getWhitelistById);

export default router;
