# Utilisation de l'image Python officielle comme image de base
FROM python:3.9-slim

# Définition du répertoire de travail dans le conteneur
WORKDIR /app

# Copie des fichiers requis dans le conteneur
COPY weather_wrapper.py .

# Installation des dépendances
RUN pip install --upgrade pip setuptools requests

# Commande par défaut pour exécuter le script Python
CMD ["python", "weather_wrapper.py"]
