import { WebSocketServer, WebSocket } from "ws";

let wss: WebSocketServer;

// Store user connections
const userSockets = new Map<string, WebSocket>();

export const initWebSocket = (port: number) => {
  wss = new WebSocketServer({ port });

  wss.on("connection", (ws, req) => {
    const url = new URL(
      req.url || "",
      `http://${req.headers.host || "localhost"}`
    );

    const userId =
      url.searchParams.get("userId");

    if (userId) {
      userSockets.set(userId, ws);

      console.log(
        `✅ User connected: ${userId}`
      );
    }

    ws.on("close", () => {
      if (userId) {
        userSockets.delete(userId);

        console.log(
          `❌ User disconnected: ${userId}`
        );
      }
    });
  });

  console.log(
    `🔔 WebSocket running on ws://localhost:${port}`
  );
};

/* =======================================================
   SEND NOTIFICATION TO SPECIFIC USER
======================================================= */

export const sendToUser = (
  userId: string,
  payload: any
) => {
  const socket =
    userSockets.get(userId);

  if (
    !socket ||
    socket.readyState !== WebSocket.OPEN
  ) {
    console.log(
      `⚠️ User ${userId} not connected`
    );

    return;
  }

  socket.send(
    JSON.stringify(payload)
  );
};

/* =======================================================
   BROADCAST NOTIFICATION
======================================================= */

export const broadcast = (
  payload: any
) => {
  const message =
    JSON.stringify(payload);

  userSockets.forEach(
    (socket, userId) => {
      if (
        socket.readyState ===
        WebSocket.OPEN
      ) {
        socket.send(message);
      } else {
        console.log(
          `⚠️ User ${userId} socket is not open`
        );
      }
    }
  );
};

