# syntax=docker/dockerfile:1
FROM golang:1.17
WORKDIR /go/src/github.com/michaelanckaert/go-hello-world-webapp
COPY main.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /go/src/github.com/michaelanckaert/go-hello-world-webapp ./
CMD ["./app"]  
