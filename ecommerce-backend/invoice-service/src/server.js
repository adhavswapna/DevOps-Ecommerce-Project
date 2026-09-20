"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dotenv_1 = __importDefault(require("dotenv"));
dotenv_1.default.config();
const app_1 = __importDefault(require("./app"));
const minio_client_1 = require("./minio/minio-client");
const invoice_consumer_1 = require("./kafka/invoice.consumer");
async function start() {
    try {
        console.log("🚀 Starting Invoice Service...");
        await (0, minio_client_1.initMinio)();
        if (process.env.ENABLE_KAFKA === "true") {
            await (0, invoice_consumer_1.startInvoiceConsumer)();
        }
        const port = process.env.PORT || 3010;
        app_1.default.listen(port, () => {
            console.log(`📄 Invoice service running on port ${port}`);
        });
    }
    catch (err) {
        console.error("❌ Invoice service failed to start", err);
        process.exit(1);
    }
}
start();
