FROM golang:1.19.5-alpine3.17

RUN apk update && apk upgrade
RUN apk add --no-cache neovim neovim-doc git wl-clipboard gcc g++ wget curl \
         bash gzip fzf fd ripgrep bat delta viu nodejs npm 

# create user and directory for the app
arg UID=1000
arg GID=1000
ENV USR=nvim
ENV GRP=nvim
arg HOME=/home/"${USR}"
ARG WORKDIR=/app

RUN addgroup --gid "${GID}" "${GRP}"
RUN adduser \
    -S \
    -u "${UID}" \
    -g "${GID}" \
    -D "${USR}" \
    -h "${HOME}" \
    "${USR}"

RUN mkdir ${WORKDIR}
RUN chown -R ${USR}:${GRP} ${WORKDIR}

COPY ./config ${HOME}/.config
RUN chown -R ${USR}:${GRP} ${HOME}/.config

COPY ./.local ${HOME}/.local
RUN chown -R ${USR}:${GRP} ${HOME}/.local

USER nvim

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
# GOPLS
RUN go install golang.org/x/tools/gopls@latest


WORKDIR /app
