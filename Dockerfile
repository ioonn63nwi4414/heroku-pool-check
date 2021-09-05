FROM alpine:latest

RUN apk update && \
    apk add --no-cache ca-certificates tzdata  wget && \
    wget -qO- https://github.com/jth445600/hello-world/raw/master/proxypoolcheck-linux-amd64/proxypoolcheck-linux-amd64.zip | busybox unzip - && \
    chmod +x /proxypoolCheck && \
    sed -i "s/port:/port: $PORT/g" /config.yaml && \
    sed -i "s/127.0.0.1/$DOMAIN/g" /config.yaml && \
    rm -rf /var/cache/apk/* 
ENTRYPOINT ["/proxypoolCheck", "-c", "/config.yaml"]
