FROM codercom/code-server:latest

USER root

# Update, upgrade
RUN apt-get update && \
apt-get upgrade -y && \
apt-get dist-upgrade -y && \
apt-get install -y sudo curl git gnupg2 && \
# Update Nodejs
curl -sS https://deb.nodesource.com/setup_10.x | bash - && \
# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn && \
apt-get autoclean && \
# Install vue-cli
yarn global add @vue/cli && \
yarn global add @vue/cli-service-global

COPY entrypoint.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/entrypoint.sh

WORKDIR /opt/html/
EXPOSE 8080 8081 

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
