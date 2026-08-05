FROM python:3.12-slim-trixie 
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*



COPY . .

RUN uv sync

RUN .venv\Scripts\Activate.ps1

EXPOSE 8000

CMD ["uv", "run" "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]