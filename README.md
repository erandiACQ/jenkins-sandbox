# jenkins-sandbox

## Installation

### Build the Jenkins BlueOcean Docker Image

```
cd jenkins-sandbox
docker build -t myjenkins-blueocean:2.414.2 .
```

### Create the network 'jenkins'
```
docker network create jenkins
```

### Run the Container (MacOS / Linux)
```
docker run --name jenkins-blueocean --restart=on-failure --detach --network jenkins --env DOCKER_HOST=tcp://docker:2376 --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 --publish 8080:8080 --publish 50000:50000 --volume jenkins-data:/var/jenkins_home --volume jenkins-docker-certs:/certs/client:ro myjenkins-blueocean:2.414.2
```

### Get the Password
```
docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
```

### Connect to the Jenkins
http://localhost:8080/

### Other Important commands you might need
```
sudo lsof -i :8080
kill -9 <PID>
docker network ls
docker ps
docker ps | grep :8080
docker stop <name>
docker rm <name>
```

### Installation Reference:
https://www.jenkins.io/doc/book/installing/docker/