# Docker Compose

## Overview

Compose is a tool for defining and running multi-container Docker applications.
With Compose, you use a YAML file to configure your application's services.
Then, with a single command, you create and start all the services from your configuration.

Compose works in all environments: production, staging, development, testing, as well as CI workflows.

Using Compose is basically a three-step process.

1. Define your app's environment with a `Dockerfile` so it can be reproduced anywhere.
1. Define the services that make up your app in `docker-compose.yml` so they can be run together in an isolated environment.
1. Lastly, run `docker-compose up` and Compose starts and runs your entire app.

Compose has commands for managing the whole lifecycle of your application:

* Start, stop and rebuild services
* View the status of running services
* Stream the log output of running services
* Run a one-off command on a service
