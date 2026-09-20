FROM node:20

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npx prisma generate --schema=src/db/prisma/schema.prisma

RUN npm run build

EXPOSE 3015

CMD ["node", "dist/server.js"]
