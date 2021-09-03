FROM alpine:3

ENV PATH="/home/vscode/.local/bin:$PATH"
ENV PYTHONIOENCODING=UTF-8

RUN set -x \
    && addgroup -g 1000 vscode \
    && adduser -u 1000 -D -G vscode vscode

RUN apk update --no-cache \
    && apk upgrade \
    && apk add \
    ca-certificates \
    py3-pip \
    git \
    curl \
    vim \
    wget \
    zip \
    autoconf \
    make \
    zsh \
    openssh \
    g++ \
    zlib \
    groff \
    jq \
    less \
    && chown -R vscode.vscode /home/vscode

USER vscode

RUN pip3 install --user awscli \
    && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


WORKDIR /home/vscode/environment-vscode

CMD '/bin/zsh'