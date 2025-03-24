FROM golang:1.24.1 as builder

WORKDIR /app
COPY . .
RUN go mod tidy && go build -o parcel-tracker

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/parcel-tracker .
CMD ["./parcel-tracker"]