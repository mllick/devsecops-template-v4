# 🛡️ DevSecOps Python Template V4

Ce projet est un template de démarrage robuste pour construire des APIs sécurisées avec **FastAPI** et **PostgreSQL**. Il intègre nativement des outils de sécurité (SAST), de qualité de code et une structure prête pour la production.

## 🚀 Fonctionnalités Clés

*   **Backend**: FastAPI (Python 3.12+).
*   **Sécurité**: Authentification JWT avec `bcrypt`, analyse statique avec `Bandit`.
*   **Qualité**: Linting et formatage ultra-rapide avec `Ruff`.
*   **Base de données**: PostgreSQL avec support des migrations via `Alembic`.
*   **DevOps**: Docker ready, Makefile pour l'automatisation, et hooks de `pre-commit`.
*   **Tests**: Suite de tests avec `Pytest` et `Httpx`.

---

## 📂 Structure du Projet

```text
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
