#!/bin/bash

# Start the web server with hot reloading.
$(go env GOPATH)/bin/air \
    --build.cmd "go build" \
    --build.bin "./server"
