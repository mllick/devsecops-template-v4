# ── Stage 1 : builder ─────────────────────────────────────────
FROM python:3.12-slim AS builder

WORKDIR /build

# Installation des dépendances système pour la compilation (ex: psycopg2 pour PostgreSQL)
RUN apt-get update && apt-get install -y --no-install-recommends \
  gcc libpq-dev libffi-dev build-essential \
  && rm -rf /var/lib/apt/lists/*

# On copie le requirements depuis le dossier backend
COPY backend/requirements.txt .

RUN pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir --prefix=/install -r requirements.txt


# ── Stage 2 : runtime ─────────────────────────────────────────
FROM python:3.12-slim

# Installation des dépendances de runtime uniquement
RUN apt-get update && apt-get install -y --no-install-recommends \
  libpq5 libffi8 curl \
  && rm -rf /var/lib/apt/lists/*

# Création d'un utilisateur non-root pour la sécurité
RUN groupadd -r map && useradd -r -g map -d /app map

WORKDIR /app

# Récupération des bibliothèques Python compilées
COPY --from=builder /install /usr/local

# Copie du contenu du dossier backend vers /app avec les bons droits
COPY --chown=map:map backend/ .

# Création des dossiers nécessaires
RUN mkdir -p /app/static /app/data /app/logs \
  && chown -R map:map /app

# Si tu as un script de démarrage, assure-toi qu'il est dans backend/scripts/start.sh
# Sinon, on utilise uvicorn directement
# RUN chmod +x /app/scripts/start.sh

USER map

# Configuration Python & Environnement
ENV PYTHONDONTWRITEBYTECODE=1 \
  PYTHONUNBUFFERED=1 \
  APP_ENV=production \
  PORT=8000

EXPOSE 8000

# Vérification de l'état de l'API (Healthcheck)
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:${PORT:-8000}/health || exit 1

# Commande de lancement (adapter si tu utilises un script start.sh)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
