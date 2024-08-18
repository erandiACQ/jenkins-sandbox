# Use the official Jenkins base image
FROM jenkins/jenkins:2.414.2-jdk11

# Switch to root to install plugins
USER root

# Updates the package list and installs the lsb-release package
RUN apt-get update && apt-get install -y lsb-release

# Downloads the Docker GPG key and saves it to the system's keyring.
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg

# Adds the Docker repository to the system's sources list, allowing the installation of Docker CLI from Docker's official repository.
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Updates the package list again to include the Docker repository and installs the Docker CLI.
RUN apt-get update && apt-get install -y docker-ce-cli

# Switches back to the jenkins user to continue with the Jenkins-specific setup.
USER jenkins

# Installs the specified Jenkins plugins (blueocean and docker-workflow) using the Jenkins Plugin CLI.
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"
