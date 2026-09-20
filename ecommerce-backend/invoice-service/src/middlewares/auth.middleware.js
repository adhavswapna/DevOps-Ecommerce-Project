"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.authMiddleware = authMiddleware;
exports.requireRole = requireRole;
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
/**
 * 🔐 AUTH MIDDLEWARE
 * - Verifies JWT
 * - Supports both `id` and `userId`
 * - Attaches user to req.user
 */
function authMiddleware(req, res, next) {
    try {
        const authHeader = req.headers.authorization;
        // ❌ No header
        if (!authHeader) {
            return res.status(401).json({
                success: false,
                message: "Unauthorized - Missing Authorization header",
            });
        }
        // ❌ Invalid format
        if (!authHeader.startsWith("Bearer ")) {
            return res.status(401).json({
                success: false,
                message: "Unauthorized - Invalid token format",
            });
        }
        // Extract token
        const token = authHeader.split(" ")[1];
        // ❌ Missing secret
        if (!process.env.JWT_SECRET) {
            console.error("❌ JWT_SECRET missing in .env");
            return res.status(500).json({
                success: false,
                message: "Server configuration error",
            });
        }
        // ✅ Verify token
        const decoded = jsonwebtoken_1.default.verify(token, process.env.JWT_SECRET);
        // ✅ Support BOTH id & userId
        const userId = decoded.id || decoded.userId;
        if (!userId) {
            return res.status(401).json({
                success: false,
                message: "Invalid token payload (missing user id)",
            });
        }
        // ✅ Attach user
        req.user = {
            id: userId,
            email: decoded.email,
            role: decoded.role,
        };
        next();
    }
    catch (err) {
        console.error("❌ Auth error:", err?.message || err);
        return res.status(401).json({
            success: false,
            message: "Unauthorized - Invalid or expired token",
        });
    }
}
/**
 * 🔐 ROLE GUARD
 * Example: requireRole("admin")
 */
function requireRole(role) {
    return (req, res, next) => {
        try {
            if (!req.user) {
                return res.status(401).json({
                    success: false,
                    message: "Unauthorized",
                });
            }
            if (req.user.role !== role) {
                return res.status(403).json({
                    success: false,
                    message: "Forbidden - Insufficient role",
                });
            }
            next();
        }
        catch (err) {
            console.error("❌ Role guard error:", err);
            return res.status(500).json({
                success: false,
                message: "Role check failed",
            });
        }
    };
}
