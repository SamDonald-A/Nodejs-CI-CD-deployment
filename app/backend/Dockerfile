FROM node:20

WORKDIR /app

COPY package*.json ./

RUN apt-get update && \
    apt-get install -y curl && \
    npm install && \
    rm -rf /var/lib/apt/lists/*

COPY . .

EXPOSE 5000

CMD ["node", "server.js"]