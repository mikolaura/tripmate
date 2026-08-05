FROM ghcr.io/astral-sh/uv:python3.12-trixie-slim

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

EXPOSE 8000

CMD ["uv", "run" "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]