FROM python:3.10-slim-bookworm

# Environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    DEBIAN_FRONTEND=noninteractive

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        gcc \
        libpq-dev \
        curl && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Copy only requirements first (better Docker layer caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy application source
COPY . .

# Collect static files (will be done in Kubernetes init container)
# Commenting out for production - handled by init container
# RUN python manage.py collectstatic --noinput

# Expose Django/Gunicorn port
EXPOSE 8000

# Create entrypoint script
RUN echo '#!/bin/bash\nset -e\nif [ "$1" = "gunicorn" ]; then\n  exec gunicorn --bind 0.0.0.0:8000 --workers 4 --worker-class sync --timeout 120 stepshop.wsgi:application\nelif [ "$1" = "celery" ]; then\n  exec celery -A stepshop worker -l info --concurrency=4\nelif [ "$1" = "beat" ]; then\n  exec celery -A stepshop beat -l info\nelse\n  exec "$@"\nfi' > /app/entrypoint.sh && chmod +x /app/entrypoint.sh

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD python -c "import requests; requests.get('http://localhost:8000/health/', timeout=5)" || exit 1

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["gunicorn"]
