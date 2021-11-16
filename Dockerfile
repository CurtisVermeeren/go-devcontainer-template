FROM golang:1.16
WORKDIR /app
EXPOSE 8080

# Install the Go tools for the Go extention
RUN go get -u -v github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest \
    && go get -u -v github.com/ramya-rao-a/go-outline@latest \ 
    && go get -u -v github.com/go-delve/delve/cmd/dlv@latest \
    && GOBIN=/tmp/ go install github.com/go-delve/delve/cmd/dlv@master \
    && mv /tmp/dlv $GOPATH/bin/dlv-dap \
    && go get -u -v honnef.co/go/tools/cmd/staticcheck@latest \ 
    && go get -u -v golang.org/x/tools/gopls@latest