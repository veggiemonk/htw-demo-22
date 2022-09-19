FROM golang:alpine as builder

ADD ./go.mod /go/src/github.com/veggiemonk/htw-demo-22/go.mod
ADD ./main.go /go/src/github.com/veggiemonk/htw-demo-22/main.go

RUN set -ex && \
    cd /go/src/github.com/veggiemonk/htw-demo-22 && \
    CGO_ENBABLED=0 go build \
        -tags netgo \
        -v -a \
        -ldflags '-extldflags "-static"' && \
    mv ./htw-demo-22 /usr/bin/htw-demo-22

## ----------------------------------------------------------

FROM busybox

COPY --from=builder /usr/bin/htw-demo-22 /usr/local/bin/htw-demo-22

ENTRYPOINT ["htw-demo-22"]