"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.publishInvoiceGenerated = publishInvoiceGenerated;
// src/kafka/invoice.producer.ts
const kafka_client_1 = require("./kafka-client");
const invoice_topics_1 = require("./invoice.topics");
async function publishInvoiceGenerated(payload) {
    const producer = await (0, kafka_client_1.getKafkaProducer)();
    if (!producer)
        return;
    await producer.send({
        topic: invoice_topics_1.INVOICE_TOPICS.INVOICE_GENERATED,
        messages: [
            {
                value: JSON.stringify(payload),
            },
        ],
    });
    console.log("📤 invoice.generated event published", payload);
}
