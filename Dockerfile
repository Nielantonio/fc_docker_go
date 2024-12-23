FROM golang:alpine AS builder

WORKDIR /usr/src/app

COPY src /usr/src/app

RUN go build -ldflags="-s -w" -o build/fullcycle fullcycle.go

FROM scratch

COPY --from=builder /usr/src/app/build/fullcycle /app/fullcycle

ENTRYPOINT ["/app/fullcycle"]