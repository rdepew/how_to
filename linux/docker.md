# Docker commands

Most people use 'docker' but you can also use 'podman'.
'podman' is a plug-in replacement for 'docker', and its
syntax is identical.


## Docker stuff for the local machine

### List all the  containers running on the device

docker container ls
-or-
docker ps

### List all the container images installed on the device

docker image ls

### Run a container in interactive mode

docker run -it localhost/the-container-name:debian-10 bash

### Run a script or program inside a container

docker run localhost/the-container-name:debian-10 echo hello world
-or-
docker run localhost/the-container-name:debian-10 do-some-things


## Creating a Docker image and pushing it to a repository

(I got these instructions from John Laird, but I don't 
remember the reference. No, maybe they're from JFrog.)

1. Create a Docker registry on Artifactory. JFrog has
  good documentation on how to do this.

2. Click on the Docker registry link on your Artifactory
  account. For example: https://autosoln.jfrog.io/artifactory/acm-docker-dev-local/

3. Click on "Set Me Up" in the upper right corner, then click on Client and 
  select Podman. This is a Docker lookalike. (You can use Docker 
  if you prefer.)

4. The JFrog webpage now gives you a step-by-step list of the commands you 
  will need. The first thing you will need to do is create the 
  ~/.docker/config.json file on your local (Linux) machine.

5. With the config.json file created, login to the container registry:
```
podman login autosoln.jfrog.io
```

6. Do a quick `podman images` command to list all of the container images
  on your machine. You will need the "IMAGE ID" for the image you're going
  to push to the registry, also the "REPOSITORY" and "NAME". Here's a 
  sample:
```
$ podman images
REPOSITORY                TAG         IMAGE ID      CREATED        SIZE
localhost/cmakebuild      debian-10   cdbc36ca2b20  2 weeks ago    1.17 GB
docker.io/library/debian  10.8        463adba1ec3f  18 months ago  119 MB
```

7. Use the `tag` command to tag the container image you will be pushing to
  the registry.  The format is 
```
podman tag <IMAGE ID number> <registry-name>/<REPOSITORY name>:<TAG>
# For example:
podman tag cdbc36ca2b20 autosoln.jfrog.io/acm-docker-dev-local/cmakebuild:debian-10
```

8. Finally, `push` the container image to the registry:
```
podman push <registry-name>/<REPOSITORY name>:<tag>
# For example:
podman push autosoln.jfrog.io/acm-docker-dev-local/cmakebuild:debian-10
```

## Loading a Docker image onto another machine.

To pull the image onto another machine:
```
podman pull autosoln.jfrog.io/acm-docker-dev-local/cmakebuild:debian-10
```

After `podman pull`, you can use `podman run ...` or `docker run ...` to 
do something with the container.

## About sudo

Docker containers are configured to always run as root. This means, so the
experts say, that you don't need `sudo` any more.

The experts are wrong.

You need `sudo`. 

For one thing, you need it to run as a different user, 
as in `sudo -u the_other_username /bin/do-something` . For another thing
only `sudo apt-get` can access the /var/lib/dpkg lockfile.

So in the Dockerfile that you use to create the Docker container, include 
this line:
```
RUN apt-get install -y sudo
```

## Docker containers in Azure Pipelines

You can add a script step that executes the `podman pull` command, but then
you still have to use `podman exec` to execute stuff inside the container.

Or you can specify the container in the header of your pipeline.  When you 
do this, then the entire pipeline runs inside the container. Example:
```
container: 
  image: autosoln.jfrog.io/acm-docker-dev-local/cmakebuildv2:debian-10
  # options: --privileged
  endpoint: AzureToDockerArtifactory
```

The endpoint is a service connection that you create in your Azure account.

Or you can specify that specific steps are to run inside containers that you
have defined in the resources in the header of your pipeline. Like this:
```
resources:
  containers:
  - container: u14
    image: ubuntu:14.04
  - container: u22
    image: ubuntu:22.04

steps:
- script: Do this one thing
  container: u14
- script: Do this other thing
  container: u22
```

