# ==========================================
# 阶段 1: 构建 Komari Agent
# ==========================================
FROM golang:alpine AS builder
WORKDIR /src
RUN apk add --no-cache git
RUN git clone https://github.com/komari-monitor/komari-agent.git .
RUN git fetch --tags && \
    LATEST_TAG=$(git describe --tags --abbrev=0) && \
    git checkout $LATEST_TAG
RUN VERSION=$(git describe --tags --always) && \
    go mod download && \
    CGO_ENABLED=0 go build -trimpath -ldflags="-s -w -X github.com/komari-monitor/komari-agent/update.CurrentVersion=${VERSION}" -o komari-agent .
    
# ==========================================
# 阶段 2: 最终运行环境
# ==========================================
FROM node:24-slim
ENV DEBIAN_FRONTEND="noninteractive"

# 1. 安装核心系统依赖
RUN apt-get update && \
    apt-get install -y ca-certificates proxychains-ng && \
    rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/local/bin/node /bin/node

# 2. 移入核心资产
COPY --from=lobehub/lobehub:latest /app /app
COPY --from=builder /src/komari-agent /app/komari-agent

# 3. 环境变量
ENV NODE_ENV="production" \
    NODE_OPTIONS="--dns-result-order=ipv4first --use-openssl-ca" \
    NODE_PATH="/app/node_modules" \
    HOSTNAME="0.0.0.0" \
    PORT="3210" \
    DATABASE_DRIVER="node" \
    DATABASE_URL=""

# 4. 修复缺失的动态依赖 (数据库与 Canvas)
RUN mkdir -p /tmp/fix-deps && cd /tmp/fix-deps && \
    npm init -y && \
    npm install pg drizzle-orm @napi-rs/canvas && \
    rm -rf /app/node_modules/pg /app/node_modules/drizzle-orm /app/node_modules/@napi-rs && \
    cp -r node_modules/* /app/node_modules/ && \
    cd / && rm -rf /tmp/fix-deps

# 5. 应对只读文件系统的缓存重定向
RUN mkdir -p /app/.next && \
    rm -rf /app/.next/cache && \
    ln -s /tmp/next_cache /app/.next/cache

COPY entrypoint.sh /app/entrypoint.sh

# 6. 权限赋予
RUN chmod +x /app/entrypoint.sh /app/komari-agent && \
    chown -R 10014:10014 /app

WORKDIR /app
USER 10014
EXPOSE 3210

CMD ["/app/entrypoint.sh"]
