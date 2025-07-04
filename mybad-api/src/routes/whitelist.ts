import { Router } from "express";
import { getAllWhitelists, getWhitelistById, addJobToWhitelist } from "../controllers/whitelist.controller.js";

const router = Router();

// Route whitelist
router.get("/whitelist", getAllWhitelists);
router.get("/whitelist/:id", getWhitelistById);
router.post("/whitelist/add", addJobToWhitelist);

export default router;
