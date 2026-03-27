# Python-Basisimage verwenden
FROM mcr.microsoft.com/playwright/python:v1.42.0-jammy

# Arbeitsverzeichnis im Container festlegen
WORKDIR /app

# requirements.txt kopieren und Abhängigkeiten installieren
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN playwright install chromium

# Das Skript in den Container kopieren
COPY termin.py .

# Standard-Umgebungsvariablen setzen, um Windows-Features zu deaktivieren
ENV ENABLE_TOAST=False
ENV ENABLE_BEEP=False

# Skript beim Start des Containers ausführen
CMD ["python", "-u", "termin.py"]
