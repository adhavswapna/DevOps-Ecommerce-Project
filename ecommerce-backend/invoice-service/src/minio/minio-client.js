"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.BUCKET_NAME = exports.minioClient = void 0;
exports.initMinio = initMinio;
exports.uploadInvoicePDF = uploadInvoicePDF;
exports.getInvoiceStream = getInvoiceStream;
exports.getMinioPresignedUrl = getMinioPresignedUrl;
const minio_1 = require("minio");
exports.minioClient = new minio_1.Client({
    endPoint: process.env.MINIO_ENDPOINT ||
        "localhost",
    port: Number(process.env.MINIO_PORT) ||
        9000,
    useSSL: false,
    accessKey: process.env.MINIO_ACCESS_KEY ||
        "minio",
    secretKey: process.env.MINIO_SECRET_KEY ||
        "minio123",
});
exports.BUCKET_NAME = "invoices";
/**
 * Initialize MinIO bucket
 */
async function initMinio() {
    const exists = await exports.minioClient.bucketExists(exports.BUCKET_NAME);
    if (!exists) {
        await exports.minioClient.makeBucket(exports.BUCKET_NAME);
        console.log("🪣 MinIO bucket created:", exports.BUCKET_NAME);
    }
    else {
        console.log("🪣 MinIO bucket exists:", exports.BUCKET_NAME);
    }
}
/**
 * Upload PDF
 */
async function uploadInvoicePDF(fileName, buffer) {
    await exports.minioClient.putObject(exports.BUCKET_NAME, fileName, buffer, buffer.length, {
        "Content-Type": "application/pdf",
    });
    console.log(`✅ Invoice uploaded: ${fileName}`);
}
/**
 * Download stream
 */
async function getInvoiceStream(fileName) {
    return exports.minioClient.getObject(exports.BUCKET_NAME, fileName);
}
/**
 * Pre-signed URL
 */
async function getMinioPresignedUrl(objectName) {
    return exports.minioClient.presignedGetObject(exports.BUCKET_NAME, objectName, 60 * 60);
}
