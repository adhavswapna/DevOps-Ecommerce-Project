"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getAllInvoices = getAllInvoices;
exports.getInvoice = getInvoice;
exports.createInvoiceController = createInvoiceController;
exports.downloadInvoiceController = downloadInvoiceController;
const invoice_service_1 = require("../services/invoice.service");
const minio_client_1 = require("../minio/minio-client");
/* =====================================================
   GET /invoices
===================================================== */
async function getAllInvoices(req, res) {
    try {
        const userId = req.user?.id;
        if (!userId) {
            return res.status(401).json({
                success: false,
                message: "Unauthorized",
            });
        }
        const invoices = await (0, invoice_service_1.listInvoices)();
        const userInvoices = invoices.filter((invoice) => invoice.userId === userId);
        return res.status(200).json({
            success: true,
            data: userInvoices,
        });
    }
    catch (error) {
        console.error("❌ getAllInvoices error:", error);
        return res.status(500).json({
            success: false,
            message: "Failed to fetch invoices",
        });
    }
}
/* =====================================================
   GET /invoices/:id
===================================================== */
async function getInvoice(req, res) {
    try {
        const { id } = req.params;
        const userId = req.user?.id;
        if (!userId) {
            return res.status(401).json({
                success: false,
                message: "Unauthorized",
            });
        }
        const invoice = await (0, invoice_service_1.getInvoiceById)(String(id));
        if (!invoice) {
            return res.status(404).json({
                success: false,
                message: "Invoice not found",
            });
        }
        if (invoice.userId !== userId) {
            return res.status(403).json({
                success: false,
                message: "Forbidden",
            });
        }
        return res.status(200).json({
            success: true,
            data: invoice,
        });
    }
    catch (error) {
        console.error("❌ getInvoice error:", error);
        return res.status(500).json({
            success: false,
            message: "Failed to fetch invoice",
        });
    }
}
/* =====================================================
   POST /invoices

   Manual invoice generation
===================================================== */
async function createInvoiceController(req, res) {
    try {
        const { orderId, amount, regenerate, } = req.body;
        const userId = req.user?.id;
        const authorization = req.headers.authorization;
        /* =================================================
           AUTH
        ================================================= */
        if (!userId) {
            return res.status(401).json({
                success: false,
                message: "Unauthorized",
            });
        }
        if (!authorization) {
            return res.status(401).json({
                success: false,
                message: "Authorization token required",
            });
        }
        /* =================================================
           VALIDATE ORDER
        ================================================= */
        if (!orderId ||
            typeof orderId !== "string") {
            return res.status(400).json({
                success: false,
                message: "Valid orderId is required",
            });
        }
        /* =================================================
           VALIDATE AMOUNT
        ================================================= */
        if (typeof amount !== "number" ||
            amount <= 0) {
            return res.status(400).json({
                success: false,
                message: "Valid amount is required",
            });
        }
        /* =================================================
           GENERATE
        ================================================= */
        console.log("🧾 Creating invoice for order:", orderId);
        console.log("👤 User:", userId);
        const invoice = await (0, invoice_service_1.generateAndStoreInvoice)({
            orderId,
            userId,
            amount,
            authorization,
            regenerate: regenerate === true,
        });
        return res.status(201).json({
            success: true,
            data: invoice,
        });
    }
    catch (error) {
        console.error("❌ Invoice creation failed:", error);
        return res.status(500).json({
            success: false,
            message: error?.message ||
                "Invoice creation failed",
        });
    }
}
/* =====================================================
   GET /invoices/:id/download
===================================================== */
async function downloadInvoiceController(req, res) {
    try {
        const { id } = req.params;
        const userId = req.user?.id;
        if (!userId) {
            return res.status(401).json({
                success: false,
                message: "Unauthorized",
            });
        }
        const invoice = await (0, invoice_service_1.getInvoiceById)(String(id));
        if (!invoice) {
            return res.status(404).json({
                success: false,
                message: "Invoice not found",
            });
        }
        if (invoice.userId !== userId) {
            return res.status(403).json({
                success: false,
                message: "Forbidden",
            });
        }
        const downloadUrl = await (0, minio_client_1.getMinioPresignedUrl)(invoice.fileUrl);
        return res.status(200).json({
            success: true,
            downloadUrl,
        });
    }
    catch (error) {
        console.error("❌ Download error:", error);
        return res.status(500).json({
            success: false,
            message: "Download failed",
        });
    }
}
