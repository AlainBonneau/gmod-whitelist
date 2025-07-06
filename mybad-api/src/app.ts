import express from "express";
import cors from "cors";
import whitelistRoutes from "./routes/whitelist.js";
import playerRoutes from "./routes/players.js";

// N'oubliez pas de créer un fichier .env à la racine de votre projet avec les variables d'environnement nécessaires. (Vous trouverez un exemple dans le fichier .env.example)

// Don't forget to create a .env file at the root of your project with the necessary environment variables. (You will find an example in the .env.example file)

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.send("Welcome to MyBad API!");
});

app.use(whitelistRoutes);
app.use(playerRoutes);

export default app;
