FROM alpine:latest

# install dependencies
RUN apk update && apk add --no-cache \
    gcompat \
    build-base \
    lua \
    curl \
    wget \
    git \
    gcc \
    py3-pip \
    ruby \ 
    ruby-dev \
    nodejs \
    npm \
    neovim \
    neovim-doc

# install packer.nvim
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install python3 provider
RUN pip3 install neovim

# install ruby provider
RUN gem install neovim

# install nodejs provider
RUN npm install -g neovim

# TODO: sync nvim config with packer.nvim with CMD, runs but doesn't sync...
RUN nvim +PackerSync +qa

CMD ["/bin/sh"]

WORKDIR /root
