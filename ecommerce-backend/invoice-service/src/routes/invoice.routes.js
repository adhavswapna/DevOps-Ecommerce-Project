"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const invoice_controller_1 = require("../controllers/invoice.controller");
const auth_middleware_1 = require("../middlewares/auth.middleware");
const router = (0, express_1.Router)();
/**
 * ============================
 * Health check
 * MUST be before /:id
 * ============================
 */
router.get("/health", (_req, res) => {
    return res.status(200).json({
        status: "UP",
        service: "Invoice Service",
    });
});
/**
 * ============================
 * Protected routes
 * ============================
 */
router.use(auth_middleware_1.authMiddleware);
/**
 * Get all invoices
 * GET /invoices
 */
router.get("/", invoice_controller_1.getAllInvoices);
/**
 * Create invoice
 * POST /invoices
 */
router.post("/", invoice_controller_1.createInvoiceController);
/**
 * Download invoice
 * GET /invoices/:id/download
 *
 * MUST BE BEFORE /:id
 */
router.get("/:id/download", invoice_controller_1.downloadInvoiceController);
/**
 * Get invoice by id
 * GET /invoices/:id
 *
 * ALWAYS LAST
 */
router.get("/:id", invoice_controller_1.getInvoice);
exports.default = router;
