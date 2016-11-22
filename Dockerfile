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

FROM gcr.io/stacksmith-images/minideb:jessie-r3

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="0l8rrow" \
    STACKSMITH_STACK_NAME="PHP for gbere/bitnami-docker-symfony" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install php-7.0.13-0 --checksum 9067aa50cb5d6870a5c59bfc66eb026dd45fb2ce76ebd206beef145c0f5dd2b1

ENV PATH=/opt/bitnami/php/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Symfony 3 template
COPY . /app
WORKDIR /app

RUN composer install

EXPOSE 9000
CMD ["php", "app/console", "server:run", "0.0.0.0:9000"]
