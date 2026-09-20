"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.startInvoiceConsumer = startInvoiceConsumer;
// src/kafka/invoice.consumer.ts
const kafka_client_1 = require("./kafka-client");
const invoice_topics_1 = require("./invoice.topics");
const invoice_producer_1 = require("./invoice.producer");
const invoice_pdf_1 = require("../pdf/invoice.pdf");
const minio_client_1 = require("../minio/minio-client");
async function startInvoiceConsumer() {
    const consumer = await (0, kafka_client_1.getKafkaConsumer)();
    if (!consumer)
        return;
    await consumer.subscribe({
        topic: invoice_topics_1.INVOICE_TOPICS.INVOICE_REQUESTED,
        fromBeginning: false,
    });
    console.log("🧾 Invoice consumer started (invoice.requested)");
    await consumer.run({
        eachMessage: async ({ message }) => {
            if (!message.value)
                return;
            let data;
            try {
                data = JSON.parse(message.value.toString());
            }
            catch (err) {
                console.error("❌ Invalid invoice.requested JSON", err);
                return;
            }
            console.log("📥 invoice.requested received:", data.orderId);
            try {
                const invoiceData = {
                    orderId: data.orderId,
                    customerName: data.customerName || "Customer",
                    customerEmail: data.customerEmail || data.userEmail || "N/A",
                    billingAddress: data.billingAddress || "N/A",
                    shippingAddress: data.shippingAddress || "N/A",
                    vendorName: data.vendorName || "Store",
                    vendorAddress: "Online Store",
                    items: data.items || [],
                    date: new Date().toISOString(),
                };
                // 1. Generate PDF
                const pdfBuffer = await (0, invoice_pdf_1.generateInvoicePDF)(invoiceData);
                const fileName = `${data.orderId}.pdf`;
                // 2. Upload to MinIO
                await (0, minio_client_1.uploadInvoicePDF)(fileName, pdfBuffer);
                // 3. Signed URL
                const presignedUrl = await (0, minio_client_1.getMinioPresignedUrl)(fileName);
                // 4. Publish event
                await (0, invoice_producer_1.publishInvoiceGenerated)({
                    invoiceId: `inv_${Date.now()}`,
                    orderId: data.orderId,
                    amount: data.amount,
                    userEmail: data.userEmail || data.customerEmail || "N/A",
                    vendorEmail: data.vendorEmail || "N/A",
                    invoiceUrl: presignedUrl,
                    createdAt: new Date().toISOString(),
                });
                console.log("✅ invoice.generated published");
            }
            catch (err) {
                console.error("🔥 Invoice processing failed:", err);
            }
        },
    });
}
