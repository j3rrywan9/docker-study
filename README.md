# Docker

The `docker images` command lists all the images on your local system.

## Containers

### Define a container with a `Dockerfile`

### Build the app

Now run the build command.
This creates a Docker image, which we're going to tag using `-t` so it has a friendly name.
```bash
docker build --help

docker build -t friendlyhello .

docker images
```

### Run the app

Run the app, mapping your machine's port 4000 to the container's `EXPOSE`d port 80 using `-p`:
```bash
docker run --help

docker run -p 4000:80 friendlyhello
```

Hit `Ctrl+C` in your terminal to quit.

Now let's run the app in the background, in detached mode:
```bash
docker run -d -p 4000:80 friendlyhello
```
You get the long container ID for your app and then are kicked back to your terminal.
Your container is running in the background.
You can also see the abbreviated container ID with `docker ps`:
```bash
docker ps
```
Now use `docker stop` to end the process, using the `CONTAINER ID`

### Share your image

#### Log in with your Docker ID

#### Tag the image

The notation for associating a local image with a repository is `username/repository:tag`.
The tag is optional, but recommended, since it is the mechanism that registries give Docker images a version.

Run `docker tag image` with your username, repository, and tag names so that the image will upload to your desired destination.
The syntax of the command is:
```bash
docker tag image username/repository:tag
```

#### Publish the image

Upload your tagged image to the repository:
```bash
docker push username/repository:tag
```
Once complete, the results of this upload are publicly available.
If you log in to Docker Hub, you will see the new image there, with its pull command.

#### Pull and run the image from the remote repository

From now on, you can use `docker run` and run your app on any machine with this command:
```bash
```

## Services

### Understanding services

In a distributed application, different pieces of the app are called "services".

### Your first `docker-compose.yml` file

A `docker-compose.yml` file is a YAML file that defines how Docker containers should behave in production.

