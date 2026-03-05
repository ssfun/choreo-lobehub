#!/bin/sh

# ==============================
# 环境变量配置与默认值
# ==============================
KOMARI_SECRET=${KOMARI_SECRET:-""}
KOMARI_SERVER=${KOMARI_SERVER:-""}

# ==============================
# 0. 初始化运行时缓存环境
# ==============================
echo "[Init] Creating writable cache directory in /tmp..."
mkdir -p /tmp/next_cache

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
