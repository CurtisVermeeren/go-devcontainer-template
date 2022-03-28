FROM golang:1.17.8
WORKDIR /app
EXPOSE 8080

# Non root user arguments
ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create a non root user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install the Go tools for the Go extension
RUN go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest \
    && go install github.com/ramya-rao-a/go-outline@latest \ 
    && go install github.com/go-delve/delve/cmd/dlv@latest \
    && go install github.com/cweill/gotests/gotests@latest \
    && go install github.com/fatih/gomodifytags@latest \ 
    && go install github.com/josharian/impl@latest \
    && go install github.com/haya14busa/goplay/cmd/goplay@latest \
    && go install github.com/go-delve/delve/cmd/dlv@latest \
    && go install honnef.co/go/tools/cmd/staticcheck@latest \ 
    && go install golang.org/x/tools/gopls@latest \
    && GO111MODULE=on go install golang.org/x/tools/gopls@latest
    
# Set the default user. Omit if wanting to keep root as defualt
USER $USERNAME