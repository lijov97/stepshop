FROM amazonlinux:2023

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PATH="/stepora/.local/bin:${PATH}"

WORKDIR /stepora

# Install system dependencies
RUN yum update -y && \
    yum install -y \
        python3 \
        python3-pip \
        gcc \
        gcc-c++ \
        make \
        postgresql-devel \
        shadow-utils && \
    yum clean all && \
    rm -rf /var/cache/yum

# Create application user
RUN useradd -m -d /stepora stepora

# Copy requirements first (better Docker layer caching)
COPY requirements.txt .

# Upgrade pip and install Python packages
RUN python3.11 -m pip install --upgrade pip && \
    python3.11 -m pip install --no-cache-dir -r requirements.txt

# Copy application
COPY . .

# Create logs directory
RUN mkdir -p /stepora/logs && \
    chown -R stepora:stepora /stepora

USER stepora

EXPOSE 8000

CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]