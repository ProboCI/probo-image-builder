# Basic apache php 7.2 appserver for Lando
#
# docker build -t proboci/php:7.2-apache .

FROM devwithlando/php:7.2-apache

# Install dependencies we need
RUN apt-get update && apt-get install -y sudo gnupg \
	&& curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \
	&& apt-get install -y nodejs \
	&& npm config set user 0 \
	&& npm config set unsafe-perm true \
	&& npm install -g probo-proboscis -y \
	&& ln -s /usr/bin/proboscis /usr/bin/penelope \
	&& ln -s /usr/bin/proboscis-control /usr/bin/penelope-control \
	&& ln -s /usr/bin/proboscis-format /usr/bin/penelope-format
