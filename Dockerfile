FROM alpine:3

ENV PATH="/home/vscode/.local/bin:$PATH"
ENV PYTHONIOENCODING=UTF-8

RUN set -x \
    && addgroup -g 1000 vscode \
    && adduser -u 1000 -D -G vscode vscode

RUN apk update \
    && apk upgrade \
    && apk add \
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
    argon2-libs \
    libedit \
    libxml2 \
    musl \
    pcre2 \
    zlib

RUN apk add --update --no-cache \
    ca-certificates \
    php8-bcmath \
    php8-bz2 \
    php8-calendar \
    php8-cgi \
    php8-common \
    php8-ctype \
    php8-curl \
    php8-dba \
    php8-dbg \
    php8-dev \
    php8-doc \
    php8-dom \
    php8-embed \
    php8-enchant \
    php8-exif \
    php8-ffi \
    php8-fileinfo \
    php8-fpm \
    php8-ftp \
    php8-gd \
    php8-gettext \
    php8-gmp \
    php8-iconv \
    php8-imap \
    php8-intl \
    php8-ldap \
    php8-mbstring \
    php8-mysqli \
    php8-mysqlnd \
    php8-odbc \
    php8-opcache \
    php8-openssl \
    php8-pcntl \
    php8-pdo \
    php8-pdo_dblib \
    php8-pdo_mysql \
    php8-pdo_odbc \
    php8-pdo_pgsql \
    php8-pdo_sqlite \
    php8-pear \
    php8-pgsql \
    php8-phar \
    php8-phpdbg \
    php8-posix \
    php8-pspell \
    php8-session \
    php8-shmop \
    php8-simplexml \
    php8-snmp \
    php8-soap \
    php8-sockets \
    php8-sodium \
    php8-sqlite3 \
    php8-sysvmsg \
    php8-sysvsem \
    php8-sysvshm \
    php8-tidy \
    php8-tokenizer \
    php8-xml \
    php8-xmlreader \
    php8-xmlwriter \
    php8-xsl \
    php8-zip \
    php8-zlib \
    php8-json \
    groff \
    jq \
    less \
    && chown -R vscode.vscode /home/vscode \
    && ln -sf /usr/bin/php8 /usr/bin/php \
    && pecl8 install xdebug

# RUN wget https://github.com/FriendsOfPHP/pickle/releases/latest/download/pickle.phar \
#     && mv pickle.phar /usr/local/bin/pickle \
#     && chmod +x /usr/local/bin/pickle \
#     && pickle install xdebug

ADD php.ini /etc/php7/php.ini

# USER vscode

RUN pip3 install --user awscli

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

WORKDIR /home/vscode/environment-vscode

CMD '/bin/zsh'