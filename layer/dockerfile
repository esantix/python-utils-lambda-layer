FROM python:3.8-slim-buster

WORKDIR /app

RUN apt-get update && \
    apt-get install -y zip && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install -r requirements.txt -t /opt/python/

CMD cd /opt && zip -r9 /app/requests-layer.zip .
