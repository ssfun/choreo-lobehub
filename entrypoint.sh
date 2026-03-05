#!/bin/sh

# ==============================
# 环境变量配置与默认值
# ==============================
KOMARI_SECRET=${KOMARI_SECRET:-""}
KOMARI_SERVER=${KOMARI_SERVER:-""}

# ==============================
# 0. 【核心】初始化可写环境
# ==============================
echo "[Init] Initializing runtime environment..."

# 1. 清理并创建环境
rm -rf /tmp/next
mkdir -p /tmp/next
mkdir -p /tmp/next/cache

# 2. 复制构建产物 (移花接木)
# 使用 tar 管道复制，保留所有属性
echo "[Init] Copying build assets to /tmp/next..."
cd /app/.next_source && tar cf - . | (cd /tmp/next && tar xf -)

# ==============================
# 🔍 启动前自检
# ==============================
if [ -f "/tmp/next/BUILD_ID" ]; then
    echo "[Check] ✅ Build assets ready in /tmp/next"
else
    echo "[Check] ❌ FATAL: Build assets failed to copy!"
    ls -la /tmp/next
fi

# 返回 app 目录
cd /app

# ==============================
# 1. 启动 Komari Agent
# ==============================
if [ -n "$KOMARI_SERVER" ] && [ -n "$KOMARI_SECRET" ]; then
    echo "[Komari] Starting agent..."
    /app/komari-agent -e "$KOMARI_SERVER" -t "$KOMARI_SECRET" --disable-auto-update >/dev/null 2>&1 &
fi

# ==============================
# 2. 启动主应用
# ==============================
echo "[LobeHub] Starting server on port $PORT..."
exec node /app/startServer.js
