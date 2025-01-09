FROM python:3.12.7-alpine

RUN apk update && apk add --no-cache \
    mysql-client \
    mariadb-dev \
    gcc \
    musl-dev \
    pkgconfig \
    python3-dev \
    libffi-dev \
    openssl-dev \
    build-base

WORKDIR /app

COPY . .

RUN python -m pip install --upgrade pip \
  && python -m pip install -r requirements.txt

EXPOSE 8000

CMD ["/bin/sh", "-c", "python manage.py runserver 0.0.0.0:8000"]
