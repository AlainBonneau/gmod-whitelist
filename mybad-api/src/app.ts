import express from "express";
import cors from "cors";
import whitelistRoutes from "./routes/whitelist.js";

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.send("Welcome to MyBad API!");
});

app.use(whitelistRoutes);

export default app;
