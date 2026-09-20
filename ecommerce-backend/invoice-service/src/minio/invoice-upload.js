"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.uploadInvoicePDF = uploadInvoicePDF;
const minio_client_1 = require("./minio-client");
async function uploadInvoicePDF(fileName, buffer) {
    await minio_client_1.minioClient.putObject(minio_client_1.BUCKET_NAME, fileName, buffer, buffer.length, {
        "Content-Type": "application/pdf",
    });
    console.log(`✅ Invoice uploaded to MinIO: ${fileName}`);
}
