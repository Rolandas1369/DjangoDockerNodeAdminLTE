FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY /webp /code/
RUN python manage.py makemigrations
RUN python manage.py migrate

FROM node:12

COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production



