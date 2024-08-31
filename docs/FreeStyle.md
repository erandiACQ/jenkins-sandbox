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
