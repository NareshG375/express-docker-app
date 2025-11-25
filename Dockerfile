FROM ubuntu:latest

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_25.x | bash -
RUN apt-get update -y
RUN apt-get install -y nodejs npm
RUN apt-get clean

# Create app directory

WORKDIR /app


# Copy package files first (better layer caching)
COPY package.json package-lock.json ./

RUN npm install

COPY main.js index.js

# Start the app
ENTRYPOINT ["node","index.js"]