FROM python:3.12.7 AS base

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Developement

FROM base AS development

EXPOSE 8000

CMD ["/bin/sh", "-c", "python manage.py runserver 0.0.0.0:8000"]

# Production

FROM base AS production

COPY . .

RUN pip install gunicorn

EXPOSE 8000

CMD ["gunicorn", "ExamHub.wsgi:application", "--bind", "0.0.0.0:8000"]
