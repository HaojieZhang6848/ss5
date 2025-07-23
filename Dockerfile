# 第一阶段：构建阶段
FROM golang:1.22.12-alpine3.21 AS builder

# 设置工作目录
WORKDIR /app

# 安装 git（可能需要用于获取依赖）
RUN apk add --no-cache git

# 复制 go mod 和 sum 文件
COPY go.mod go.sum ./

# 下载依赖
RUN go mod download

# 复制源代码
COPY . .

# 构建应用程序
# 使用静态链接，禁用 CGO 以确保二进制文件可以在最小镜像中运行
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o gosocks5proxy .

# 第二阶段：运行阶段
FROM alpine:3.21

# 安装 ca-certificates 用于 HTTPS 连接
RUN apk --no-cache add ca-certificates

# 创建非 root 用户
RUN adduser -D -s /bin/sh gosocks5

# 设置工作目录
WORKDIR /root/

# 从构建阶段复制二进制文件
COPY --from=builder /app/gosocks5proxy .

# 更改文件所有者
RUN chown gosocks5:gosocks5 gosocks5proxy

# 切换到非 root 用户
USER gosocks5

# 暴露端口（SOCKS5 默认端口 1080）
EXPOSE 1080

# 运行应用程序
CMD ["./gosocks5proxy"]