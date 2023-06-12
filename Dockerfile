FROM alpine:latest

# install gcompat, lua, curl, wget, git, gcc neovim and dependencies
RUN apk update
RUN apk add --no-cache \
    gcompat \
    lua \
    curl \
    wget \
    git \
    gcc \
    neovim

# install packer.nvim
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# TODO: sync nvim config with packer.nvim with CMD

CMD ["/bin/sh"]

WORKDIR /root
