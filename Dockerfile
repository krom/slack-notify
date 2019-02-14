FROM golang:onbuild
WORKDIR /app
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o slack-notify ./main.go

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=0 /app/slack-notify /bin/

CMD /bin/slack-notify
