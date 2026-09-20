
FROM node:20

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --include=dev

COPY . .

RUN npm run build

EXPOSE 3012

CMD ["node", "dist/server.js"]

