# 使用官方的 Go 语言镜像，指定版本为 1.23.2
FROM golang:1.23.2

# 设置工作目录
WORKDIR /app

# 将 go.mod 和 go.sum 复制到工作目录
COPY go.mod go.sum ./

# 下载依赖
RUN go mod download

# 将当前目录的代码复制到工作目录
COPY . .

# 编译应用程序
RUN go build -o mirrors .

# 暴露端口
EXPOSE 4444

# 指定容器启动时运行的命令
CMD ["./mirrors"]