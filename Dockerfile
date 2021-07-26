FROM golang:alpine

WORKDIR /hw1

COPY go.mod .

COPY go.sum .

RUN go mod download

COPY . .

RUN go build -o api

##

FROM alpine:latest

WORKDIR /hw1

COPY config/app/.env .

COPY config/app/app.conf .

COPY --from=0 /hw1/api .

CMD ["./api"]