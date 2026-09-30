#!/bin/bash

set -e

# ==========================================================
# ShopSphere - Create Local Development .env Files
# ==========================================================

BASE_DIR="$HOME/Desktop/DevOps-Ecommerce-Project/ecommerce-backend"

echo "=============================================="
echo " Creating .env files for ShopSphere"
echo "=============================================="
echo "BASE_DIR: $BASE_DIR"
echo ""

# ==========================================================
# COMMON VALUES
# ==========================================================

JWT_SECRET="supersecret123"
JWT_EXPIRES_IN="7d"

KAFKA_BROKER="localhost:9092"

REDIS_HOST="localhost"
REDIS_PORT="6379"

# ==========================================================
# FUNCTION
# ==========================================================

create_env() {
    SERVICE="$1"
    CONTENT="$2"

    mkdir -p "$BASE_DIR/$SERVICE"

    cat > "$BASE_DIR/$SERVICE/.env" <<EOF
$CONTENT
EOF

    echo "✅ Created: $SERVICE/.env"
}

# ==========================================================
# AUTH SERVICE - 3001
# ==========================================================

create_env "auth-service" "
PORT=3001
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/auth_db

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=auth-service
ENABLE_KAFKA=true

GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_secret
GOOGLE_REDIRECT_URI=http://localhost:3001/auth/google/callback

FRONTEND_URL=http://localhost:3000
"

# ==========================================================
# ADMIN SERVICE - 3002
# ==========================================================

create_env "admin-service" "
PORT=3002
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/admin_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=admin-service
ENABLE_KAFKA=true

REDIS_HOST=$REDIS_HOST
REDIS_PORT=$REDIS_PORT

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN
"

# ==========================================================
# PRODUCT SERVICE - 3003
# ==========================================================

create_env "product-service" "
PORT=3003
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/product_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=product-service
ENABLE_KAFKA=true

REDIS_HOST=$REDIS_HOST
REDIS_PORT=$REDIS_PORT

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN
"

# ==========================================================
# EMAIL SERVICE - 3004
# ==========================================================

create_env "email-service" "
PORT=3004
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/email_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=email-service
ENABLE_KAFKA=true

SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your_email@gmail.com
SMTP_PASS=your_gmail_app_password
"

# ==========================================================
# CART SERVICE - 3005
# ==========================================================

create_env "cart-service" "
PORT=3005
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/cart_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=cart-service
ENABLE_KAFKA=true

REDIS_HOST=$REDIS_HOST
REDIS_PORT=$REDIS_PORT

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN
"

# ==========================================================
# ORDER SERVICE - 3006
# ==========================================================

create_env "order-service" "
PORT=3006
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/order_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=order-service
ENABLE_KAFKA=true

REDIS_HOST=$REDIS_HOST
REDIS_PORT=$REDIS_PORT

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN
"

# ==========================================================
# PAYMENT SERVICE - 3007
# ==========================================================

create_env "payment-service" "
PORT=3007
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/payment_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=payment-service
ENABLE_KAFKA=true

RAZORPAY_KEY_ID=your_razorpay_key
RAZORPAY_SECRET=your_razorpay_secret

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN
"

# ==========================================================
# RATING SERVICE - 3008
# ==========================================================

create_env "rating-service" "
PORT=3008
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/rating_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=rating-service
ENABLE_KAFKA=true

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN
"

# ==========================================================
# INVENTORY SERVICE - 3009
# ==========================================================

create_env "inventory-service" "
PORT=3009
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/inventory_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=inventory-service
ENABLE_KAFKA=true

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN
"

# ==========================================================
# INVOICE SERVICE - 3010
# ==========================================================

create_env "invoice-service" "
PORT=3010
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/invoice_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=invoice-service
ENABLE_KAFKA=true

MINIO_ENDPOINT=localhost
MINIO_PORT=9000
MINIO_ROOT_USER=minio
MINIO_ROOT_PASSWORD=minio123

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN

ORDER_SERVICE_URL=http://localhost:3006
USER_SERVICE_URL=http://localhost:3015
"

# ==========================================================
# ANALYTICS SERVICE - 3011
# ==========================================================

create_env "analytics-service" "
PORT=3011
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/analytics_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=analytics-service
ENABLE_KAFKA=true
"

# ==========================================================
# VENDOR SERVICE - 3012
# ==========================================================

create_env "vendor-service" "
PORT=3012
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/vendor_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=vendor-service
ENABLE_KAFKA=true

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN
"

# ==========================================================
# SEARCH SERVICE - 3013
# ==========================================================

create_env "search-service" "
PORT=3013
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/search_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=search-service
ENABLE_KAFKA=true
"

# ==========================================================
# SHIPPING SERVICE - 3014
# ==========================================================

create_env "shipping-service" "
PORT=3014
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/shipping_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=shipping-service
KAFKA_GROUP_ID=shipping-group
ENABLE_KAFKA=true

ORDER_SERVICE_URL=http://localhost:3006
USER_SERVICE_URL=http://localhost:3015

FRONTEND_URL=http://localhost:3000

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN
"

# ==========================================================
# USER SERVICE - 3015
# ==========================================================

create_env "user-service" "
PORT=3015
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/user_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=user-service
ENABLE_KAFKA=true

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN

REDIS_HOST=$REDIS_HOST
REDIS_PORT=$REDIS_PORT
"

# ==========================================================
# REFUND SERVICE - 3016
# ==========================================================

create_env "refund-service" "
PORT=3016
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/refund_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=refund-service
ENABLE_KAFKA=true

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN
"

# ==========================================================
# NOTIFICATION SERVICE - 3018
# ==========================================================

create_env "notification-service" "
PORT=3018
NODE_ENV=development

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/notification_db

KAFKA_BROKER=$KAFKA_BROKER
KAFKA_CLIENT_ID=notification-service
ENABLE_KAFKA=true

JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=$JWT_EXPIRES_IN
"

# ==========================================================
# FINISHED
# ==========================================================

echo ""
echo "=============================================="
echo "🎉 All .env files created successfully!"
echo "=============================================="
echo ""

echo "Created services:"
echo "  auth-service         -> 3001"
echo "  admin-service        -> 3002"
echo "  product-service      -> 3003"
echo "  email-service        -> 3004"
echo "  cart-service         -> 3005"
echo "  order-service        -> 3006"
echo "  payment-service      -> 3007"
echo "  rating-service       -> 3008"
echo "  inventory-service    -> 3009"
echo "  invoice-service      -> 3010"
echo "  analytics-service    -> 3011"
echo "  vendor-service       -> 3012"
echo "  search-service       -> 3013"
echo "  shipping-service     -> 3014"
echo "  user-service         -> 3015"
echo "  refund-service       -> 3016"
echo "  notification-service -> 3018"
echo ""
