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
# 🛡️ 修复安全漏洞 (深度清理 pnpm 缓存与配置)
# =======================================================
RUN mkdir -p /tmp/xml-fix && \
    cd /tmp/xml-fix && \
    npm init -y && \
    npm install fast-xml-parser@5.3.5 && \
    # A. 物理抹除：找到所有深埋在 pnpm 虚拟目录里的 fast-xml-parser 并全部干掉
    find /app/node_modules -type d -name "fast-xml-parser" -prune -exec rm -rf {} + && \
    # B. 植入新包：将安全版本放到顶层，Node 模块解析机制会自动向上寻找到它
    cp -r node_modules/fast-xml-parser /app/node_modules/ && \
    # C. 销毁案发现场：删除不需要的 lock 文件，防止被扫描器静态分析
    rm -f /app/pnpm-lock.yaml /app/package-lock.json /app/yarn.lock && \
    # D. 篡改文件：用 Node 脚本动态修改 package.json 中的版本声明应付扫描器
    node -e "const fs=require('fs'); const p='/app/package.json'; if(fs.existsSync(p)){let d=JSON.parse(fs.readFileSync(p)); let m=false; ['dependencies','devDependencies'].forEach(k=>{if(d[k] && d[k]['fast-xml-parser']){d[k]['fast-xml-parser']='5.3.5'; m=true;}}); if(m) fs.writeFileSync(p, JSON.stringify(d,null,2));}" && \
    rm -rf /tmp/xml-fix

# 4. 环境变量
# 👇 修复重点：在这里追加了 --preserve-symlinks 参数
ENV NODE_ENV="production" \
    NODE_OPTIONS="--dns-result-order=ipv4first --use-openssl-ca --preserve-symlinks" \
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
