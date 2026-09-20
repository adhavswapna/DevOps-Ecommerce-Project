"use strict";
// src/kafka/invoice.topics.ts
Object.defineProperty(exports, "__esModule", { value: true });
exports.INVOICE_TOPICS = void 0;
exports.INVOICE_TOPICS = {
    // Incoming event (from order-service / payment-service)
    INVOICE_REQUESTED: "invoice.requested",
    // Outgoing event
    INVOICE_GENERATED: "invoice.generated",
};
