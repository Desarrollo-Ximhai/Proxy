# 1. Traemos un Linux con Python súper ligero (pesa muy poco)
FROM python:3.11-slim

# 2. Nos movemos a la carpeta /app dentro del contenedor
WORKDIR /app

# 3. Instalamos LiteLLM básico y la librería de Gemini
RUN pip install --no-cache-dir 'litellm[proxy]==1.93.0' google-generativeai

# 4. Copiamos tu archivo config.yaml de tu GitHub al contenedor
COPY config.yaml /app/config.yaml

# 5. La orden final para encenderlo usando solo 1 worker para no saturar la RAM
CMD ["sh", "-c", "litellm --config /app/config.yaml --port $PORT"]
