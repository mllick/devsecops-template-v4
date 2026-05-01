🛡️ DevSecOps Python Template V4
Ce projet est un template de démarrage robuste pour construire des APIs sécurisées avec FastAPI et PostgreSQL. Il intègre nativement des outils de sécurité (SAST), de qualité de code et une structure prête pour la production.

🚀 Fonctionnalités Clés
Backend: FastAPI (Python 3.12+).

Sécurité: Authentification JWT avec bcrypt, analyse statique avec Bandit.

Qualité: Linting et formatage ultra-rapide avec Ruff.

Base de données: PostgreSQL avec support des migrations via Alembic.

DevOps: Docker ready, Makefile pour l'automatisation, et hooks de pre-commit.

Tests: Suite de tests avec Pytest et Httpx.

📂 Structure du Projet
Plaintext
.
├── backend
│   ├── app
│   │   ├── api          # Routes (Endpoints)
│   │   ├── core         # Config (Pydantic V2), Sécurité, Dépendances
│   │   ├── models       # Modèles SQLAlchemy / SQLModel
│   │   ├── services     # Logique métier (Auth, etc.)
│   │   └── main.py      # Point d'entrée de l'application
│   ├── tests            # Tests unitaires et d'intégration
│   ├── Dockerfile       # Containerisation backend
│   └── requirements.txt # Dépendances Python
├── Makefile             # Automatisation des tâches
├── pyproject.toml       # Configuration des outils (Pytest, Ruff)
└── docker-compose.yml   # Orchestration (App + DB)
🛠️ Installation & Démarrage Rapide
1. Pré-requis
Python 3.12+

Docker & Docker Compose

Un environnement virtuel (venv) activé

2. Configuration
Créez un fichier .env à la racine ou dans le dossier backend/ :

Extrait de code
DATABASE_URL=postgresql://user:password@localhost:5432/dbname
SECRET_KEY=votre_cle_secrete_tres_longue
3. Utilisation du Makefile
Le projet utilise un Makefile pour simplifier les commandes récurrentes :

Installer les dépendances et les hooks de sécurité :

Bash
make install
Lancer l'application en mode développement :

Bash
make run
Exécuter la suite de tests :

Bash
make test
🔐 Sécurité & Qualité (DevSecOps)
Le template force le respect des bonnes pratiques avant chaque commit :

Ruff: Remplace Flake8, Black et Isort pour un code propre.

Bandit: Analyse le code à la recherche de vulnérabilités de sécurité courantes.

Bcrypt: Hachage sécurisé des mots de passe.

Pre-commit: Empêche les commits si les tests ou les scans de sécurité échouent.

🐳 Déploiement Docker
Pour lancer l'ensemble de la stack (API + PostgreSQL) :

Bash
docker-compose up --build
🛣️ API Endpoints principaux
GET  /health : Vérification de l'état de l'API.

POST /login : Authentification et récupération du token JWT.

GET  /docs   : Documentation Swagger interactive.

📝 Licence
Ce projet est sous licence MIT. Libre à vous de l'utiliser et de le modifier.
