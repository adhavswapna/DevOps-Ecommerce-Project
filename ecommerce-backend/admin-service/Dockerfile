
FROM node:20

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --include=dev

COPY . .

RUN npx prisma generate --schema=src/db/prisma/schema.prisma

RUN npm run build

EXPOSE 3000

CMD ["node", "dist/server.js"]

