FROM golang:alpine as builder

WORKDIR /internal

COPY ./internal .

RUN go build -o hello

FROM scratch

COPY --from=builder /internal .

CMD ["./hello"]