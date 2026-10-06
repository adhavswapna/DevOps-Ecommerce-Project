
#!/bin/bash

set -e

# ==========================================================
# ShopSphere - Create Dockerfiles
# ==========================================================

BASE_DIR="$HOME/Desktop/DevOps-Ecommerce-Project/ecommerce-backend"

# ==========================================================
# SERVICE -> PORT MAPPING
# ==========================================================

declare -A SERVICE_PORTS=(
  [admin-service]=3002
  [analytics-service]=3011
  [email-service]=3004
  [inventory-service]=3009
  [invoice-service]=3010
  [notification-service]=3018
  [order-service]=3006
  [payment-service]=3007
  [product-service]=3003
  [rating-service]=3008
  [refund-service]=3016
  [search-service]=3013
  [shipping-service]=3014
  [vendor-service]=3012
)

# ==========================================================
# CREATE DOCKERFILES
# ==========================================================

for SERVICE in "${!SERVICE_PORTS[@]}"; do

  PORT="${SERVICE_PORTS[$SERVICE]}"
  SERVICE_DIR="$BASE_DIR/$SERVICE"

  echo "=============================================="
  echo "Creating Dockerfile for $SERVICE"
  echo "Port: $PORT"
  echo "=============================================="

  # Make sure service directory exists
  if [ ! -d "$SERVICE_DIR" ]; then
    echo "⚠️ Directory does not exist: $SERVICE_DIR"
    echo "Skipping $SERVICE..."
    echo ""
    continue
  fi

  cat > "$SERVICE_DIR/Dockerfile" <<EOF
FROM node:20

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npx prisma generate --schema=src/db/prisma/schema.prisma

RUN npm run build

EXPOSE $PORT

CMD ["node", "dist/server.js"]
EOF

  echo "✅ Created: $SERVICE/Dockerfile"
  echo "   EXPOSE $PORT"
  echo ""

done

# ==========================================================
# FINISHED
# ==========================================================

echo "=============================================="
echo "Dockerfiles created successfully."
echo "=============================================="
echo ""

echo "Created Dockerfiles:"

for SERVICE in "${!SERVICE_PORTS[@]}"; do
  PORT="${SERVICE_PORTS[$SERVICE]}"
  echo "  $SERVICE/Dockerfile -> EXPOSE $PORT"
done

echo ""

