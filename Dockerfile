FROM alpine:3

RUN set -x \
    && addgroup -g 1000 vscode \
    && adduser -u 1000 -D -G vscode vscode

RUN apk update \
    && apk upgrade \
    && apk add py3-pip git curl vim wget zip autoconf make zsh openssh g++

RUN apk add \
    php7 \
    php7-dev \
    php7-pear \
    php7-mysqlnd \
    php7-opcache \
    php7-tokenizer \
    php7-dom \
    php7-simplexml \
    php7-xmlwriter \
    php7-xml \
    composer

RUN pecl install xdebug

ADD php.ini /etc/php7/php.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

RUN chown -R vscode.vscode /home/vscode

USER vscode

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

WORKDIR /home/vscode/app

CMD '/bin/zsh'

