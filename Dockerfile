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
# COPY ./config/nvim /home/app/.config/nvim
# VOLUME ./config/nvim /home/app/.config/nvim
# VOLUME /home/app/.local
#install pugin manager paq-nvim
# RUN git clone --depth=1 https://github.com/savq/paq-nvim.git \
    # "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

WORKDIR /app
