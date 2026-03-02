# ==========================================
# 阶段 1: 构建阶段 (Builder)
# ==========================================
FROM golang:alpine AS builder

WORKDIR /src

# 安装 git
RUN apk add --no-cache git

# 1. 拉取源码
RUN git clone https://github.com/komari-monitor/komari-agent.git .

# 2. 检出最新的 Tag
RUN git fetch --tags && \
    LATEST_TAG=$(git describe --tags --abbrev=0) && \
    git checkout $LATEST_TAG

# 3. 编译并注入版本号
RUN VERSION=$(git describe --tags --always) && \
    echo "--------------------------------------" && \
    echo "正在构建版本: $VERSION" && \
    echo "--------------------------------------" && \
    go mod download && \
    CGO_ENABLED=0 go build \
    -trimpath \
    -ldflags="-s -w -X github.com/komari-monitor/komari-agent/update.CurrentVersion=${VERSION}" \
    -o komari-agent .
    
# ==========================================
# 第二阶段：运行环境 (Final Image)
# 基于 node:24-slim
# ==========================================
FROM node:24-slim

ENV DEBIAN_FRONTEND="noninteractive"

# 1. 安装系统依赖
RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    proxychains-ng \
    libcairo2 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libgif7 \
    librsvg2-2 \
    libjpeg62-turbo \
    && rm -rf /var/lib/apt/lists/*

# 2. 修复 Node 路径
RUN ln -sf /usr/local/bin/node /bin/node

# 3. 复制应用文件
COPY --from=lobehub/lobehub:latest /app /app
COPY --from=builder /src/komari-agent /app/komari-agent

# =======================================================
# 🛡️ 修复安全漏洞
# =======================================================
WORKDIR /app
# 强制升级 fast-xml-parser 修复 CVE-2026-25896
RUN npm install fast-xml-parser@5.3.5

# 4. 环境变量
ENV NODE_ENV="production" \
    NODE_OPTIONS="--dns-result-order=ipv4first --use-openssl-ca" \
    HOSTNAME="0.0.0.0" \
    PORT="3210" \
    DATABASE_DRIVER="node" \
    DATABASE_URL=""

# 5. 安装 Canvas (已修复 cp 错误)
RUN mkdir -p /tmp/canvas-build && \
    cd /tmp/canvas-build && \
    npm install @napi-rs/canvas && \
    # 先删除目标位置的软链接，防止 "cannot overwrite non-directory" 错误
    rm -rf /app/node_modules/@napi-rs && \
    # 只复制需要的包
    cp -r node_modules/@napi-rs /app/node_modules/ && \
    rm -rf /tmp/canvas-build

# =======================================================
# 🔧 结构调整
# =======================================================

# A. 移动 .next 到备份目录
RUN mv /app/.next /app/.next_source

# B. 创建软链接 (指向尚未存在的 /tmp/next)
RUN ln -s /tmp/next /app/.next

COPY entrypoint.sh /app/entrypoint.sh

# 6. 权限设置
# 确保 10014 拥有所有权
RUN chmod +x /app/entrypoint.sh && \
    chmod +x /app/komari-agent && \
    chown -R 10014:10014 /app

WORKDIR /app
USER 10014
EXPOSE 3210

CMD ["/app/entrypoint.sh"]
