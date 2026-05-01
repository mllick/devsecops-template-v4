from fastapi import FastAPI
from app.api.routes import router

app = FastAPI(title="DevSecOps Template V4")

app.include_router(router)
