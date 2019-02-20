FROM golang:onbuild AS build
WORKDIR /app
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o slack-notify ./main.go

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build /app/slack-notify /bin/

CMD /bin/slack-notify
