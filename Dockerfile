FROM python:3.8-slim-buster
WORKDIR /app

# Install git and other dependencies
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD gunicorn app:app & python3 main.py
