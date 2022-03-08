FROM golang:1.17.8
WORKDIR /app
EXPOSE 8080

# Install the Go tools for the Go extension
RUN go get -u -v github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest \
    && go get -u -v github.com/ramya-rao-a/go-outline@latest \ 
    && go get -u -v github.com/go-delve/delve/cmd/dlv@latest \
    && go get -u -v github.com/cweill/gotests/gotests@latest \
    && go get -u -v github.com/fatih/gomodifytags@latest \ 
    && go get -u -v github.com/josharian/impl@latest \
    && go get -u -v github.com/haya14busa/goplay/cmd/goplay@latest \
    && go get -u -v github.com/go-delve/delve/cmd/dlv@latest \
    && go get -u -v honnef.co/go/tools/cmd/staticcheck@latest \ 
    && go get -u -v golang.org/x/tools/gopls@latest \
    && GO111MODULE=on go install golang.org/x/tools/gopls@latest



