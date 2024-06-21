FROM golang:alpine AS build
# In China
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache build-base git

WORKDIR /src
# In China
# RUN git clone https://mirror.ghproxy.com/https://github.com/nkanaev/yarr.git .
RUN git clone https://github.com/nkanaev/yarr.git .
ENV CGO_CFLAGS="-D_LARGEFILE64_SOURCE"
RUN make build_linux

FROM alpine:latest
COPY --from=build /src/_output/linux/yarr /usr/local/bin/yarr
# In China
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk --no-cache add tzdata ca-certificates && mkdir /data
ENV TZ=Asia/Shanghai
ENV YARR_ADDR=0.0.0.0:7070
ENV YARR_DB=/data/yarr.db
ENV YARR_AUTHFILE=/data/yarr.auth

CMD ["/usr/local/bin/yarr"]

EXPOSE 7070
