"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getKafkaConsumer = getKafkaConsumer;
exports.getKafkaProducer = getKafkaProducer;
// src/kafka/kafka-client.ts
const kafkajs_1 = require("kafkajs");
const config_1 = require("../config/config");
const kafka = new kafkajs_1.Kafka({
    clientId: config_1.config.kafka.clientId || "invoice-service",
    brokers: [config_1.config.kafka.broker || "localhost:9092"],
});
let producer = null;
let consumer = null;
/* ================= CONSUMER ================= */
async function getKafkaConsumer() {
    if (!config_1.config.kafka.enabled)
        return null;
    if (consumer)
        return consumer;
    const groupId = config_1.config.kafka.groupId?.trim() || "invoice-service-group";
    consumer = kafka.consumer({ groupId });
    await consumer.connect();
    console.log(`✅ Invoice Kafka consumer connected (group: ${groupId})`);
    return consumer;
}
/* ================= PRODUCER ================= */
async function getKafkaProducer() {
    if (!config_1.config.kafka.enabled)
        return null;
    if (producer)
        return producer;
    producer = kafka.producer({
        createPartitioner: kafkajs_1.Partitioners.LegacyPartitioner,
    });
    await producer.connect();
    console.log("✅ Invoice Kafka producer connected");
    return producer;
}
