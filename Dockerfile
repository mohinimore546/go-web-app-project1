FROM golang:1.22.5 as base

WORKDIR /app

copy go.mod .

run go mod download

copy . .

run go build -o main .

from gcr.io/distroless/base 
copy --from=base /app/main .
copy --from=base /app/static ./static
expose 8080
CMD ["./main"]