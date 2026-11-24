import { Kafka } from 'kafkajs';

const kafka = new Kafka({
  clientId: process.env.KAFKA_CLIENT_ID || 'rating-service',
  brokers: [
    process.env.KAFKA_BROKER || 'kafka:9092',
  ],
});

export const producer = kafka.producer();

export async function connectKafka() {
  await producer.connect();
  console.log('✅ Kafka connected (rating-service)');
}
