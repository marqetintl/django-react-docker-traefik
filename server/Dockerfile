
# pull the official docker image
FROM python:3.11.2-slim

# set work directory
WORKDIR /app

# prevent Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1

# prevent Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED 1

# install dependencies
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# copy project
COPY . .