# Utilisation de l'image Python officielle comme image de base
FROM python:3.9-slim

# Définition du répertoire de travail dans le conteneur
WORKDIR /app

# Copie des fichiers requis dans le conteneur
COPY weather_wrapper.py .
COPY requirements.txt .

# Installation des dépendances à partir du fichier requirements.txt
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Commande par défaut pour exécuter le script Python
CMD ["python", "weather_wrapper.py"]
