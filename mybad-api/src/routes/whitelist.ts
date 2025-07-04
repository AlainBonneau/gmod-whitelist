import { Router } from "express";
import { getAllWhitelists, getWhitelistById, addJobToWhitelist, removeJobFromWhitelist } from "../controllers/whitelist.controller.js";

const router = Router();

// Route whitelist
router.get("/whitelist", getAllWhitelists);
router.get("/whitelist/:id", getWhitelistById);
router.post("/whitelist/add", addJobToWhitelist);
router.delete("/whitelist/remove/:job_id", removeJobFromWhitelist);

export default router;
