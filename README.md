# GMod Job Whitelist API
**Attention : l’API est encore en bêta, elle ne dispose pas encore d’une gestion sécurisée des données et comporte encore quelques bugs mineurs à corriger.**

Gestion centralisée de whitelist pour les jobs sur un serveur Garry's Mod via une API Express & MySQL/MariaDB.

## 🚀 Présentation

Ce projet fournit une API REST permettant de gérer dynamiquement les whitelists et blacklists de jobs sur un serveur DarkRP Garry's Mod, en interaction directe avec la base de données du serveur.

L’objectif :  
- Synchroniser la gestion des whitelists entre Garry's Mod et un panel web/admin.
- Permettre l’ajout, la suppression et la consultation des jobs accessibles à une whitelist.
- Offrir une intégration simple avec tout front-end admin (React, Vue, etc.)

## ⚙️ Stack technique

- **Backend :** Node.js, Express
- **Base de données :** MariaDB / MySQL
- **Langage** : TypeScript (compatibilité JavaScript)
- **Gmod Script:** Lua (GAS Module JobWhitelist)

## 🗂 Structure principale

- `/controllers/` — endpoints Express (get/add/remove)
- `/routes/` — routes Express (get/add/remove)
- `/db/index.js` — connexion à la base MariaDB
- `/lua/` — scripts serveur GMod création de table (JobWhitelist)

## ✨ Fonctionnalités

- 🔍 Lister tous les jobs whitelisted
- ➕ Ajouter un job à la whitelist
- ➖ Supprimer un job de la whitelist
- 📋 Lier automatiquement les changements à la base via un script lua
- 🔒 Gestion centralisée et sécurisée par API: À venir !

## 📝 Pré-requis et installation

### Installation des dépendances

L’API utilise Node.js. Assurez-vous d’avoir la version 18 (ou supérieure) pour pouvoir installer les dépendances avec la commande **npm i**

### 1. Création de la table `gas_job_registry`

Pour que l’API fonctionne correctement, il est indispensable que la table `gas_job_registry` soit présente dans votre base de données.  
Vous devez placer le script de création de cette table, disponible dans le dossier `lua` de ce projet, à l’emplacement suivant sur votre serveur Garry's Mod : "garrysmod/lua/autorun/server/gas_job_registry.lua"

**Après avoir placé ce fichier, redémarrez votre serveur Garry's Mod.**  
La table sera automatiquement créée si elle n’existe pas encore.  
**Veillez à bien lire les instructions dans le fichier** pour adapter la création selon votre configuration ou votre système de permissions.

---

### 2. Configuration de l’environnement (`.env`)

Un fichier d’exemple de configuration de l’environnement (`.env.example`) est fourni à la racine du projet.  
Copiez-le et renommez-le en `.env` : Ouvrez le fichier .env et renseignez les informations demandées (connexion à la base de données, ports, etc.) selon votre configuration.



