FROM python:3.13-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt \
    && pip uninstall -y pip

COPY src/ .

EXPOSE 5000

ENV APP_ENV=development

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]