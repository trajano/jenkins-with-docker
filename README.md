Jenkins with Docker
===================

This is the Jenkins image with Docker CLI and Docker slaves plugin preinstalled.  It includes a few other plugins that are part of the "suggested" group, not all are loaded as some of them would not make sense when Docker slaves are present as it is expected that the Docker slaves themselves would provide images containing the respective build tools.

## Usage secure

    docker run -p 8080:8080 -v jenkins:/var/jenkins_home trajano/jenkins-with-docker

In Docker Slaves create the credentials for the configuration use a securely configured Docker daemon.

## Insecure usage

*DO NOT USE* unless it's for demostration or you don't really care about the system this is running on.  [DO NOT EXPOSE `/var/run/docker.sock`](https://www.lvh.io/posts/dont-expose-the-docker-socket-not-even-to-a-container.html).  This is primarily here to show how to quickly set up a demo Jenkins with Docker slave builds.  If you still want to go on...

    docker run -p 8080:8080 -v jenkins:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --name jenkins trajano/jenkins-with-docker
    # allow "other" to access the /var/run/docker.sock since jenkins is not running in the same group
    docker exec -u root jenkins chmod o+rw /var/run/docker.sock

In Docker Slaves configuration use

    unix:///var/run/docker.sock
