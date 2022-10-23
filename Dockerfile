FROM golang:1.19.2-alpine3.16

RUN apk update && apk upgrade
RUN apk add --no-cache neovim neovim-doc git wl-clipboard gcc g++ wget curl bash gzip fzf fd ripgrep bat delta viu

# create user and directory for the app
arg UID=1000
arg GID=1000


RUN addgroup --gid "${GID}" app
RUN adduser \
    -S \
    -u "${UID}" \
    -g "${GID}" \
    -D app \
    -h /home/app \
    app

RUN mkdir /app
RUN chown -R app:app /app


USER app

# create directory for nvim configs
RUN mkdir ~/.config/
RUN mkdir -p ~/.local/nvim


#Install tools for golang
# Iferr snipet for iferr
RUN go install github.com/koron/iferr@latest
# Format long lines
RUN go install github.com/segmentio/golines@latest
# Format code
RUN go install mvdan.cc/gofumpt@latest
# Testsum
RUN go install gotest.tools/gotestsum@latest
# Autofill tags
RUN go install github.com/fatih/gomodifytags@latest
# Add Test Ginkgo
RUN go install github.com/onsi/ginkgo/v2/ginkgo@latest
# Add Tests
RUN go install github.com/cweill/gotests/gotests@latest
# Add a tool for answering questions about go source code
RUN go install golang.org/x/tools/cmd/guru@latest




WORKDIR /app
