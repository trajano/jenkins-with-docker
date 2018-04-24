Jenkins with Docker
===================

This is the Jenkins image with Docker CLI and Docker slaves plugin preinstalled.

## Usage secure

    docker run -p 8080:8080 -v jenkins:/var/jenkins_home trajano/jenkins-with-docker

In Docker Slaves create the credentials for the configuration use a securely configured Docker daemon.

## Insecure usage

*DO NOT USE* unless it's for demostration or you don't really care about the system this is running on.  This is primarily here to show how to quickly set up a demo Jenkins with Docker slave builds.

    docker run -p 8080:8080 -v jenkins:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --name jenkins trajano/jenkins-with-docker
    docker exec -u root jenkins chmod o+rw /var/run/docker.sock

In Docker Slaves configuration use

    unix:///var/run/docker.sock

