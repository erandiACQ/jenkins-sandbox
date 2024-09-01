### Jenkins Filesystem and Workspace
```
docker exec -it jenkins-blueocean bash
pwd
cd /var/jenkins_home/
ls -ltra
cd workspace/
ls -ltra
cd first_job/
ls -tlra
```

### First FreeStyle Jenkins Job
http://localhost:8080/job/first_job/
```
echo "Hello! Welcome to first jenkins job"
echo "BUild Id of this job :  ${BUILD_ID}"
echo "BUild URL of this job : ${BUILD_URL}"

ls -ltr
echo "Test file content" > Test.txt
ls -ltr
```

### Freestyle job - Running Java HelloWorld with Jenkins
http://localhost:8080/job/java_job/
```
Git - https://github.com/erandiACQ/jenkins-sandbox
Branch - */main
Build Steps - Execute shell
    javac HelloWorld.java
    java HelloWorld
```
```
docker exec -it jenkins-blueocean bash
java --version
```

### Setting up Docker Cloud Agents 

Jenkins Docker Plugin Configuration when running Jenkins as container

- Install Docker Plugin
- Manage Jenkins -> System Configuration -> Clouds -> Add Cloud Docker
- Since running Jenkins as container, in Docker Host URI fields give tcp address of the docker host
```
Docker Host URI - tcp://<IPAddress>:2375 (IPAddress from below commands)
Enabled - true
```
```
docker run -d --restart=always -p 127.0.0.1:2376:2375 --network jenkins -v /var/run/docker.sock:/var/run/docker.sock alpine/socat tcp-listen:2375,fork,reuseaddr unix-connect:/var/run/docker.sock
docker ps
docker inspect hardcore_kirch (get IPAddress)
```
- Test Connection

Docker Agent Template Setup
```
Labels - docker-agent-alpine
Enabled - true
Name - docker-agent-alpine
Docker Image - jenkins/agent:jdk11
Instance Capacity - 2
Remote File System Root - /home/jenkins
```
```
docker pull --platform linux/arm64 jenkins/agent:alpine-jdk11
```
first_job -> configure
```
Restrict where this project can be run - true
Label Expression - docker-agent-alpine
```

### Setting Builds to be automatically triggered on commits 
Build Triggers -> Poll SCM
```
Schedule - H/5 * * * *
```
