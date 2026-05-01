from fastapi import APIRouter, Depends
from app.core.dependencies import get_current_user

router = APIRouter()

@router.get("/health")
def health():
    return {"status": "ok"}

@router.get("/protected")
def protected(user=Depends(get_current_user)):
    return {"user": user}
