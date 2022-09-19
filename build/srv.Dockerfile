FROM golang

WORKDIR /app

COPY bin/srv /app 

ENTRYPOINT ["/app/srv"]