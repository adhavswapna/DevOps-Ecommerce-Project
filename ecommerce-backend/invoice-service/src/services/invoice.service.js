"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.createInvoice = createInvoice;
exports.generateAndStoreInvoice = generateAndStoreInvoice;
exports.getInvoiceById = getInvoiceById;
exports.listInvoices = listInvoices;
const prisma_1 = __importDefault(require("../db/prisma/prisma"));
const uuid_1 = require("uuid");
const invoice_pdf_1 = require("../pdf/invoice.pdf");
const invoice_producer_1 = require("../kafka/invoice.producer");
/* =====================================================
   SERVICE URLS
===================================================== */
const ORDER_SERVICE_URL = process.env.ORDER_SERVICE_URL ||
    "http://localhost:3006";
const USER_SERVICE_URL = process.env.USER_SERVICE_URL ||
    "http://localhost:3015";
/* =====================================================
   CREATE INVOICE DB RECORD
===================================================== */
async function createInvoice(data) {
    return prisma_1.default.invoice.create({
        data,
    });
}
/* =====================================================
   FETCH ORDER
===================================================== */
async function fetchOrder(orderId, authorization) {
    const headers = {
        Accept: "application/json",
    };
    if (authorization) {
        headers.Authorization =
            authorization;
    }
    console.log("➡️ Fetching order:", `${ORDER_SERVICE_URL}/orders/${orderId}`);
    const response = await fetch(`${ORDER_SERVICE_URL}/orders/${orderId}`, {
        method: "GET",
        headers,
    });
    if (!response.ok) {
        const text = await response.text();
        console.error("❌ Order Service error:", response.status, text);
        throw new Error(`Unable to fetch order ${orderId}`);
    }
    const data = await response.json();
    /*
     * Order service currently returns
     * the order object directly.
     */
    return data;
}
/* =====================================================
   FETCH USER
===================================================== */
async function fetchUser(userId) {
    console.log("➡️ Fetching user:", `${USER_SERVICE_URL}/users/${userId}`);
    const response = await fetch(`${USER_SERVICE_URL}/users/${userId}`, {
        method: "GET",
        headers: {
            Accept: "application/json",
        },
    });
    if (!response.ok) {
        const text = await response.text();
        console.error("❌ User Service error:", response.status, text);
        throw new Error(`Unable to fetch user ${userId}`);
    }
    const data = await response.json();
    return data;
}
/* =====================================================
   FORMAT ADDRESS
===================================================== */
function buildAddress(order) {
    const parts = [];
    if (order.addressLine1) {
        parts.push(order.addressLine1);
    }
    if (order.addressLine2) {
        parts.push(order.addressLine2);
    }
    if (order.city) {
        parts.push(order.city);
    }
    if (order.state) {
        parts.push(order.state);
    }
    if (order.country) {
        parts.push(order.country);
    }
    if (order.pincode) {
        parts.push(order.pincode);
    }
    return parts.join("\n");
}
/* =====================================================
   MAIN GENERATOR
===================================================== */
async function generateAndStoreInvoice(input) {
    const { orderId, userId, amount, authorization, regenerate = false, } = input;
    if (!userId) {
        throw new Error("userId is required");
    }
    if (!orderId) {
        throw new Error("orderId is required");
    }
    try {
        /* =================================================
           1. CHECK EXISTING INVOICE
        ================================================= */
        const existingInvoice = await prisma_1.default.invoice.findUnique({
            where: {
                orderId,
            },
        });
        /*
         * Normal production behavior:
         * return existing invoice.
         */
        if (existingInvoice &&
            !regenerate) {
            console.log("⚠️ Invoice already exists, returning existing invoice");
            return existingInvoice;
        }
        /* =================================================
           2. FETCH ORDER
        ================================================= */
        let order;
        try {
            order =
                await fetchOrder(orderId, authorization);
        }
        catch (error) {
            console.error("❌ Failed to fetch order:", error);
            throw error;
        }
        /* =================================================
           3. SECURITY CHECK
        ================================================= */
        if (order.userId &&
            order.userId !== userId) {
            throw new Error("Order does not belong to authenticated user");
        }
        /* =================================================
           4. FETCH USER
        ================================================= */
        let user;
        try {
            user =
                await fetchUser(userId);
        }
        catch (error) {
            console.error("❌ Failed to fetch user:", error);
            throw error;
        }
        /* =================================================
           5. USE ORDER AMOUNT
        ================================================= */
        const invoiceAmount = Number(order.totalAmount) ||
            Number(amount);
        if (!invoiceAmount ||
            invoiceAmount <= 0) {
            throw new Error("Invalid invoice amount");
        }
        /* =================================================
           6. BUILD CUSTOMER ADDRESS
        ================================================= */
        const address = buildAddress(order);
        /*
         * Billing and shipping currently
         * use the same checkout address.
         *
         * This is correct because your Order
         * schema currently contains one address.
         */
        const billingAddress = address;
        const shippingAddress = address;
        /* =================================================
           7. BUILD ITEMS
        ================================================= */
        const items = (order.items || []).map((item) => ({
            description: `Product ${item.productId}`,
            unitPrice: Number(item.price),
            quantity: Number(item.quantity),
            taxRate: 18,
        }));
        /*
         * Fallback for an order that has no
         * item records.
         */
        if (items.length === 0) {
            items.push({
                description: "Order Payment",
                unitPrice: invoiceAmount,
                quantity: 1,
                taxRate: 18,
            });
        }
        /* =================================================
           8. CREATE / REUSE INVOICE ID
        ================================================= */
        const invoiceId = existingInvoice?.id ||
            (0, uuid_1.v4)();
        /* =================================================
           9. PREPARE PDF DATA
        ================================================= */
        const invoiceData = {
            orderId,
            invoiceNumber: `INV-${new Date()
                .getFullYear()}-${invoiceId
                .slice(0, 8)
                .toUpperCase()}`,
            customerName: user.name ||
                "Customer",
            customerEmail: user.email,
            billingAddress,
            shippingAddress,
            phone: order.phone ||
                undefined,
            vendorName: "ShopSphere Marketplace Pvt. Ltd.",
            vendorAddress: "ShopSphere Marketplace, Navi Mumbai, Maharashtra, India",
            paymentMethod: order.paymentMethod ||
                "Online Payment",
            paymentStatus: order.paymentStatus ||
                "PAID",
            currency: order.currency ||
                "INR",
            date: order.createdAt ||
                new Date().toISOString(),
            items,
        };
        console.log("🧾 Invoice customer:", invoiceData.customerName);
        console.log("📍 Invoice address:", invoiceData.billingAddress);
        /* =================================================
           10. GENERATE PDF
        ================================================= */
        const pdfBuffer = await (0, invoice_pdf_1.generateInvoicePDF)(invoiceData);
        console.log("✅ Invoice PDF generated:", pdfBuffer.length, "bytes");
        /* =================================================
           11. UPLOAD TO MINIO
        ================================================= */
        const fileKey = await (0, invoice_pdf_1.storeInvoicePDF)(invoiceId, pdfBuffer);
        console.log("✅ PDF uploaded:", fileKey);
        /* =================================================
           12. SAVE / UPDATE DB
        ================================================= */
        let invoice;
        if (existingInvoice) {
            invoice =
                await prisma_1.default.invoice.update({
                    where: {
                        id: existingInvoice.id,
                    },
                    data: {
                        userId,
                        fileUrl: fileKey,
                    },
                });
        }
        else {
            invoice =
                await prisma_1.default.invoice.create({
                    data: {
                        id: invoiceId,
                        orderId,
                        userId,
                        fileUrl: fileKey,
                    },
                });
        }
        console.log("✅ Invoice saved in DB");
        /* =================================================
           13. KAFKA
        ================================================= */
        try {
            await (0, invoice_producer_1.publishInvoiceGenerated)({
                invoiceId: invoice.id,
                orderId,
                amount: invoiceAmount,
                userEmail: user.email,
                invoiceUrl: fileKey,
                createdAt: new Date().toISOString(),
            });
            console.log("📤 Kafka invoice event published");
        }
        catch (kafkaError) {
            console.error("⚠️ Kafka failed (ignored):", kafkaError);
        }
        return invoice;
    }
    catch (error) {
        /*
         * Handle Prisma race condition.
         */
        if (error?.code === "P2002") {
            console.warn("⚠️ Race condition detected, fetching existing invoice");
            const existingInvoice = await prisma_1.default.invoice.findUnique({
                where: {
                    orderId,
                },
            });
            if (existingInvoice) {
                return existingInvoice;
            }
        }
        console.error("❌ Invoice generation failed:", error);
        throw error;
    }
}
/* =====================================================
   GET INVOICE BY ID
===================================================== */
async function getInvoiceById(id) {
    return prisma_1.default.invoice.findUnique({
        where: {
            id,
        },
    });
}
/* =====================================================
   LIST INVOICES
===================================================== */
async function listInvoices() {
    return prisma_1.default.invoice.findMany({
        orderBy: {
            createdAt: "desc",
        },
    });
}
