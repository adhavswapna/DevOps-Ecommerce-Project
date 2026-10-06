import express from "express";
import adminRoutes from "./routes/admin.routes";

const app = express();
app.use(express.json());

app.get("/health", (_req, res) => {
  res.status(200).json({ status: "ok" });
});

app.use("/admin", adminRoutes);

const PORT = process.env.SERVICE_PORT || 3002;

app.listen(PORT, () => {
  console.log(`🚀 Admin service running on port ${PORT}`);
});
