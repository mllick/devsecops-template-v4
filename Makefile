# Variables
PYTHON = .venv/bin/python
PIP = .venv/bin/pip
UVICORN = .venv/bin/uvicorn
PYTEST = .venv/bin/pytest

install:
	@# 1. Gestion pyenv (optionnel si pyenv est installé)
	@if command -v pyenv >/dev/null; then \
		echo "Vérification de la version Python via pyenv..."; \
		pyenv install -s $$(cat .python-version); \
	fi
	@# 2. Création de l'environnement virtuel
	python3 -m venv .venv
	@# 3. Installation des dépendances
	$(PIP) install --upgrade pip
	$(PIP) install -r backend/requirements.txt
	@# 4. Installation des hooks pre-commit
	.venv/bin/pre-commit install
	@echo "✅ Installation terminée. Activez l'environnement avec 'source .venv/bin/activate'"

run:
	$(UVICORN) backend.app.main:app --reload

test:
	$(PYTEST) -v backend/tests
