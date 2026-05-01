from pydantic_settings import BaseSettings
from pydantic import ConfigDict

class Settings(BaseSettings):
    database_url: str
    secret_key: str

    # Ajoute les variables manquantes détectées par l'erreur :
    postgres_user: str
    postgres_password: str
    postgres_db: str
    algorithm: str
    access_token_expire_minutes: int # Pydantic convertira le "30" du .env en entier

    model_config = ConfigDict(
        env_file=".env",
        extra="ignore" # Important : ignore les variables d'env système inutiles
    )

settings = Settings()
