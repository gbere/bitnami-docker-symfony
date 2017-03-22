## BUILDING
##   (from project root directory)
##   $ docker build -t php-for-gbere-bitnami-docker-symfony .
##
## RUNNING
##   $ docker run -p 9000:9000 php-for-gbere-bitnami-docker-symfony
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:9000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/bitnami-containers/minideb-extras:jessie-r12

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="ecygn5w" \
    STACKSMITH_STACK_NAME="PHP for gbere/bitnami-docker-symfony" \
    STACKSMITH_STACK_PRIVATE="1"

# Install required system packages
RUN install_packages libc6 zlib1g libxslt1.1 libtidy-0.99-0 libreadline6 libncurses5 libtinfo5 libmcrypt4 libldap-2.4-2 libstdc++6 libgmp10 libpng12-0 libjpeg62-turbo libbz2-1.0 libxml2 libssl1.0.0 libcurl3 libfreetype6 libicu52 libgcc1 libgcrypt20 libsasl2-2 libgnutls-deb0-28 liblzma5 libidn11 librtmp1 libssh2-1 libgssapi-krb5-2 libkrb5-3 libk5crypto3 libcomerr2 libgpg-error0 libp11-kit0 libtasn1-6 libnettle4 libhogweed2 libkrb5support0 libkeyutils1 libffi6 libsybdb5 libpq5

RUN bitnami-pkg install php-7.1.3-0 --checksum 0b1270ac702523a9f2f448a71f953c5212db41e59a586b86c1b9422b28b6d5b8

ENV PATH=/opt/bitnami/php/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Symfony 3 template
COPY . /app
WORKDIR /app

RUN composer install

EXPOSE 9000
CMD ["php", "app/console", "server:run", "0.0.0.0:9000"]
