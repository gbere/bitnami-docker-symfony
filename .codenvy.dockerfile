FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r8

MAINTAINER Bitnami <containers@bitnami.com>

# Install java dependency
RUN bitnami-pkg install java-1.8.0_91-0 --checksum 64cf20b77dc7cce3a28e9fe1daa149785c9c8c13ad1249071bc778fa40ae8773
ENV PATH=/opt/bitnami/java/bin:$PATH

RUN bitnami-pkg install php-7.0.10-0 --checksum 5f2ec47fcfb2fec5197af6760c5053dd5dee8084d70a488fd5ea77bd4245c6b9
ENV PATH=/opt/bitnami/php/bin:$PATH
RUN bitnami-pkg install mysql-client-10.1.13-4 --checksum 14b45c91dd78b37f0f2366712cbe9bfdf2cb674769435611955191a65dbf4976
ENV PATH=/opt/bitnami/mysql/bin:$PATH
RUN bitnami-pkg install mariadb-10.1.14-4 --checksum 4a75f4f52587853d69860662626c64a4540126962cd9ee9722af58a3e7cfa01b
RUN bitnami-pkg install symfony-2.8.9-0 --checksum e14979a9ed1a332bdd709ecc997ccc1ba7be0c680818e69ad5671ef0776df84e
ENV PATH=/opt/bitnami/symfony:$PATH

# Java/Play template
ENV BITNAMI_APP_NAME=symfony

EXPOSE 8000

USER bitnami

WORKDIR /projects

# Interact with Eclipse che
LABEL che:server:8000:ref=symfony che:server:8000:protocol=http

ENV TERM=xterm

CMD ["tail", "-f", "/dev/null"]