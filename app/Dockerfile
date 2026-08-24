FROM python:3.13-slim

WORKDIR /app

# Update Debian packages to the latest security-patched versions
RUN apt-get update \
    && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt \
    && rm -rf /usr/local/lib/python3.13/site-packages/pip \
              /usr/local/lib/python3.13/site-packages/pip-*.dist-info \
              /usr/local/lib/python3.13/site-packages/setuptools \
              /usr/local/lib/python3.13/site-packages/setuptools-*.dist-info

COPY src/ .

EXPOSE 5000

ENV APP_ENV=development

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
