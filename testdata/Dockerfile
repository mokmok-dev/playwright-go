FROM golang:1.20 as builder

WORKDIR /go/src/app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -mod=readonly -v -o pw ./main.go

FROM ghcr.io/mokmok-dev/playwright-go:latest as runner

WORKDIR /

COPY --from=builder /go/src/app/pw /pw

ENTRYPOINT ["/pw"]
