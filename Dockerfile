# syntax=docker/dockerfile:1
FROM golang:1.17 AS builder
WORKDIR /go/src/github.com/michaelanckaert/go-hello-world-webapp
COPY main.go ./
COPY go.mod ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
EXPOSE 8080
WORKDIR /root/
COPY --from=builder /go/src/github.com/michaelanckaert/go-hello-world-webapp ./
CMD ["./app"]  
