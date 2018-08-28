FROM ubuntu:18.04
MAINTAINER Stephen Laws <Stephen.Laws@GetSmartSolutions.ca>
RUN apt-get update && apt-get install -y curl libfontconfig git libcap2-bin gcc g++ make python ruby bzip2
RUN gem install bundler
RUN gem install sass -v 3.4.13
RUN curl -SLO "https://nodejs.org/dist/v8.9.0/node-v8.9.0-linux-x64.tar.gz" \
&& tar -xvf "node-v8.9.0-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
&& rm "node-v8.9.0-linux-x64.tar.gz" \
&& npm install -g grunt-cli \
&& npm install -g bower \
&& useradd -m tsbc \
&& rm -rf .npm .cache .pm2 \
&& echo deb http://us.archive.ubuntu.com/ubuntu bionic multiverse >> /etc/apt/sources.list;echo deb http://us.archive.ubuntu.com/ubuntu bionic-updates multiverse >> /etc/apt/sources.list \
&& echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && apt-get update && apt-get install -y ttf-mscorefonts-installer


