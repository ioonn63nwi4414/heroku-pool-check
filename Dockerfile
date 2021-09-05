FROM alpine:latest

RUN apk update && \
    apk add --no-cache ca-certificates tzdata  wget && \
    wget -qO- https://github.com/jth445600/hello-world/raw/master/proxypool-linux-amd64/proxypool-linux-amd64.zip | busybox unzip - && \
    chmod +x /proxypoolv0.7.3 && \
    sed -i "s/port:/port: $PORT/g" /config.yaml && \
    sed -i "s/127.0.0.1/$DOMAIN/g" /config.yaml && \
    rm -rf /var/cache/apk/* 
ENTRYPOINT ["/proxypoolv0.7.3", "-c", "/config.yaml"]
