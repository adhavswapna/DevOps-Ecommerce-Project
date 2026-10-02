#!/bin/bash

set -e

SERVICES=(
  admin-service
  analytics-service
  email-service
  inventory-service
  invoice-service
  notification-service
  order-service
  payment-service
  product-service
  rating-service
  refund-service
  search-service
  shipping-service
  vendor-service
)

for SERVICE in "${SERVICES[@]}"; do
  echo "Creating Dockerfile for $SERVICE..."

  cat > "$SERVICE/Dockerfile" <<EOF
FROM node:20

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npx prisma generate --schema=src/db/prisma/schema.prisma

RUN npm run build

EXPOSE 3000

CMD ["node", "dist/server.js"]
EOF

done

echo
echo "Dockerfiles created successfully."
echo
echo "Created Dockerfiles:"
for SERVICE in "${SERVICES[@]}"; do
  echo "$SERVICE/Dockerfile"
done
