#############
### BUILD ###
#############
FROM golang:1.18.4-alpine3.15 AS build
WORKDIR /app
# Install dependencies.
COPY go.mod ./
COPY go.sum ./
RUN go mod download
# Build source.
COPY *.go ./
RUN go build

##############
### DEPLOY ###
##############
FROM alpine:3.15
WORKDIR /
COPY --from=build /app/server /server
EXPOSE 8080
ENTRYPOINT ["/server"]