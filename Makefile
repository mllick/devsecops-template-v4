install:
	pip install -r backend/requirements.txt
	pre-commit install

run:
	uvicorn backend.app.main:app --reload

test:
	pytest -v backend/tests
