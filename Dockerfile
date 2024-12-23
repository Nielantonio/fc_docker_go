FROM golang:alpine AS builder

WORKDIR /usr/src/app

# COPY src /usr/src/app
RUN printf 'package main\n\nimport "fmt"\n\nfunc main() {\n    fmt.Println("Full Cycle Rocks!!")\n}\n' > fullcycle.go

RUN go build -ldflags="-s -w" -o build/fullcycle fullcycle.go

FROM scratch

COPY --from=builder /usr/src/app/build/fullcycle /app/fullcycle

ENTRYPOINT ["/app/fullcycle"]