FROM codercom/code-server:latest

USER root

# Update, upgrade
RUN apt-get update && \
apt-get upgrade -y && \
apt-get dist-upgrade -y && \
apt-get install -y sudo curl git gnupg2 gcc g++ make && \
# Update Nodejs
curl -sS https://deb.nodesource.com/setup_10.x | bash - && \
apt-get install -y nodejs && \
# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn && \
# Install vue-cli
yarn global add @vue/cli && \
yarn global add @vue/cli-service-global && \
# Install Quasar cli
yarn global add @quasar/cli && \
# Install JSON server
yarn global add json-server && \
# Package upgrade
yarn global upgrade

#Increase the amount of inotify watchers
RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf | sysctl -p

COPY entrypoint.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/entrypoint.sh

WORKDIR /opt/html/
# Opening Ports
# - 3000: json-server
# - 8080: Hot-Module-Replacement (vue-cli-service)
# - 8081: code-server
EXPOSE 3000 8080 8081 

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
