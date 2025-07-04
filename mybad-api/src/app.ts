import express from "express";
import cors from "cors";
import whitelistRoutes from "./routes/whitelist.js";
import playerRoutes from "./routes/players.js";

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.send("Welcome to MyBad API!");
});

app.use("/whitelist", whitelistRoutes);
app.use("/players", playerRoutes);

export default app;
