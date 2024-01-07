FROM node:16-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci
COPY . .

EXPOSE 3001

CMD ["node", "index.js"]