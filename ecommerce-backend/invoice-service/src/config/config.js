"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.config = void 0;
// src/config/index.ts
const path_1 = __importDefault(require("path"));
const dotenv_1 = __importDefault(require("dotenv"));
// load .env from project root (outside src)
dotenv_1.default.config({
    path: path_1.default.resolve(process.cwd(), ".env"),
});
exports.config = {
    serviceName: process.env.SERVICE_NAME,
    port: Number(process.env.SERVICE_PORT || 3010),
    kafka: {
        enabled: process.env.ENABLE_KAFKA === "true",
        broker: process.env.KAFKA_BROKER,
        clientId: process.env.KAFKA_CLIENT_ID,
        groupId: process.env.KAFKA_GROUP_ID,
    },
    minio: {
        endPoint: process.env.MINIO_ENDPOINT || "localhost",
        port: Number(process.env.MINIO_PORT || 9000),
        accessKey: process.env.MINIO_ROOT_USER || "minio",
        secretKey: process.env.MINIO_ROOT_PASSWORD || "minio123",
        bucket: process.env.MINIO_BUCKET || "invoices",
        useSSL: process.env.MINIO_USE_SSL === "true",
    },
};
console.log("DEBUG ENABLE_KAFKA =", process.env.ENABLE_KAFKA);
