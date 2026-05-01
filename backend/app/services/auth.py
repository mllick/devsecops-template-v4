from app.core.security import create_token

def login(email: str):
    return {"access_token": create_token({"sub": email})}
