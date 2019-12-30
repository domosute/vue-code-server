# vue-code-server
- Vue.js3 + Code-server (https://coder.com) developement environement in Docker.
- Used [Coder](https://coder.com) as a base image.

How to Run the Image
------------
1. Clone this repository.
```
git clone https://github.com/domosute/vue-code-server.git
```
2. Build the image.
```
docker-compose build
```
3. Start the server.
```
docker-compose up -d
```
4. Access to code-server via web browser. Port 8081 is assigned for it.
```
http://<hostname>:8081
```
5. Open the terminal from code-server, and from the `/opt/html/` directory, create the project.
```
# Using Nuxt
root@xxxxxxxxxxxx:/opt/html/# yarn create nuxt-app <project>
# Using Quasar
root@xxxxxxxxxxxx:/opt/html/# quasar create <project>
```

6. Go into created project folder and perform `yarn upgrade` followed by activating Hot-Module-Replacement of vue-cli-service.
```
root@xxxxxxxxxxxx:/opt/html/project# yarn upgrade
root@xxxxxxxxxxxx:/opt/html/project# yarn dev
```
6. Start coding. Result can be dynamically checked via web browser with port 8080.
```
http://<hostname>:8080
```

_[Note]: Make sure to add vue.config.js file with below content for http://localhost:8080 to work_

```
module.exports = {
  devServer: {
    disableHostCheck: true
  }
}
```
