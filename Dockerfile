
# pull the official docker image
FROM node:19-alpine3.16

# set work directory
WORKDIR /app

# install dependencies
COPY ./client/package.json ./client/package.json

COPY ./client/yarn.lock ./client/yarn.lock
COPY ./client/.yarnrc.yml ./client/.yarnrc.yml
COPY ./client/.yarn/ ./client/.yarn/

RUN yarn 

COPY ./client/tsconfig.node.json ./client/tsconfig.node.json
COPY ./client/tsconfig.json ./client/tsconfig.json

COPY ./client/vite.config.ts ./client/vite.config.ts

# copy project
COPY ./client/ ./client

RUN apk add --no-cache python3 py3-pip python3-dev build-base libffi-dev openssl-dev

RUN pip3 install --upgrade pip

# prevent Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1

# prevent Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED 1

# install dependencies
COPY ./server/requirements.txt .
RUN pip3 install -r requirements.txt
RUN pip3 install tzdata

# copy project
COPY ./server ./server