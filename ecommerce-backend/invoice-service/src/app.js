"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const invoice_routes_1 = __importDefault(require("./routes/invoice.routes"));
const app = (0, express_1.default)();
app.use((0, cors_1.default)({
    origin: [
        "http://localhost:3000",
        "http://127.0.0.1:3000"
    ],
    credentials: true,
    methods: [
        "GET",
        "POST",
        "PUT",
        "DELETE",
        "OPTIONS"
    ],
    allowedHeaders: [
        "Content-Type",
        "Authorization"
    ]
}));
app.use(express_1.default.json());
// ==========================
// HEALTH CHECK
// ==========================
app.get("/health", (_req, res) => {
    return res.status(200).json({
        status: "UP",
        service: "Invoice Service"
    });
});
// ==========================
// ROUTES
// ==========================
app.use("/invoices", invoice_routes_1.default);
// ==========================
// 404
// ==========================
app.use((_req, res) => {
    return res.status(404).json({
        message: "Invoice route not found"
    });
});
exports.default = app;
