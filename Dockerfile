FROM golang:1.19.2-alpine3.16

RUN apk update && apk upgrade
RUN apk add --no-cache neovim neovim-doc git wl-clipboard gcc g++ wget curl \
         bash gzip fzf fd ripgrep bat delta viu

# create user and directory for the app
arg UID=1000
arg GID=1000
arg HOME=/home/app


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

COPY ./config/nvim ${HOME}/.config/nvim
RUN chown -R app:app ${HOME}/.config

USER app


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

################### Install Plugins ######################

# Sand Thema
RUN git clone --depth=1 https://github.com/held-m/neovim-sand.git \
        /home/app/.local/share/nvim/site/pack/neovim-sand/start/neovim-sand

# LSP and autocompletion
RUN git clone --depth=1 https://github.com/neovim/nvim-lspconfig.git \
        /home/app/.local/share/nvim/site/pack/nvim-lspconfig/start/nvim-lspconfig && \
    git clone --depth=1 https://github.com/hrsh7th/nvim-cmp.git \
        /home/app/.local/share/nvim/site/pack/nvim-cmp/start/nvim-cmp && \
    git clone --depth=1 https://github.com/hrsh7th/cmp-buffer.git \
        /home/app/.local/share/nvim/site/pack/cmp-buffer/start/cmp-buffer && \
    git clone --depth=1 https://github.com/hrsh7th/cmp-path.git \
        /home/app/.local/share/nvim/site/pack/cmp-path/start/cmp-path && \
    git clone --depth=1 https://github.com/saadparwaiz1/cmp_luasnip.git \
        /home/app/.local/share/nvim/site/pack/cmp_luasnip/start/cmp_luasnip && \
    git clone --depth=1 https://github.com/hrsh7th/cmp-nvim-lsp.git \
        /home/app/.local/share/nvim/site/pack/cmp-nvim-lsp/start/cmp-nvim-lsp && \
    git clone --depth=1 https://github.com/hrsh7th/cmp-nvim-lua.git \
        /home/app/.local/share/nvim/site/pack/cmp-nvim-lua/start/cmp-nvim-lua

# git clone --depth=1 https://github.com/VonHeikemen/lsp-zero.nvim.git \
    #     /home/app/.local/share/nvim/site/pack/lsp-zero.nvim/start/lsp-zero.nvim

# Snippets
RUN git clone --depth=1 https://github.com/L3MON4D3/LuaSnip.git \
        /home/app/.local/share/nvim/site/pack/LuaSnip/start/LuaSnip && \
    git clone --depth=1 https://github.com/rafamadriz/friendly-snippets.git \
        /home/app/.local/share/nvim/site/pack/friendly-snippets/start/friendly-snippets

# Hightlights
RUN git clone --depth=1 https://github.com/nvim-treesitter/nvim-treesitter.git \
        /home/app/.local/share/nvim/site/pack/nvim-treesitter/start/nvim-treesitter

# Lui Gui
RUN git clone --depth=1 https://github.com/ray-x/guihua.lua.git \
        /home/app/.local/share/nvim/site/pack/guihua.lua/start/guihua.lua

# Comments
RUN git clone --depth=1 https://github.com/terrortylor/nvim-comment.git \
        /home/app/.local/share/nvim/site/pack/nvim-comment/start/nvim-comment

# Notify
RUN git clone --depth=1 https://github.com/rcarriga/nvim-notify.git \
        /home/app/.local/share/nvim/site/pack/nvim-notify/start/nvim-notify

# Status line
RUN git clone --depth=1 https://github.com/nvim-lualine/lualine.nvim.git \
        /home/app/.local/share/nvim/site/pack/lualine.nvim/start/lualine.nvim

# Tree files
RUN git clone --depth=1 https://github.com/nvim-tree/nvim-web-devicons.git \
    /home/app/.local/share/nvim/site/pack/nvim-web-devicons/start/nvim-web-devicons && \
    git clone --depth=1 https://github.com/nvim-tree/nvim-tree.lua.git \
        /home/app/.local/share/nvim/site/pack/nvim-tree.lua/start/nvim-tree.lua

# FZF
RUN git clone --depth=1 https://github.com/ibhagwan/fzf-lua.git \
        /home/app/.local/share/nvim/site/pack/fzf-lua/start/fzf-lua

# Keymap
RUN git clone --depth=1 https://github.com/folke/which-key.nvim.git \
        /home/app/.local/share/nvim/site/pack/which-key.nvim/start/which-key.nvim

# Golang
RUN git clone --depth=1 https://github.com/ray-x/go.nvim.git \
        /home/app/.local/share/nvim/site/pack/go.nvim/start/go.nvim && \
    git clone --depth=1 https://github.com/mfussenegger/nvim-dap.git \
        /home/app/.local/share/nvim/site/pack/nvim-dap/start/nvim-dap && \
    git clone --depth=1 https://github.com/rcarriga/nvim-dap-ui.git \
        /home/app/.local/share/nvim/site/pack/nvim-dap-ui/start/nvim-dap-ui && \
    git clone --depth=1 https://github.com/buoto/gotests-vim.git \
        /home/app/.local/share/nvim/site/pack/gotests-vim/start/gotests-vim

################## --------------- #######################

WORKDIR /app
