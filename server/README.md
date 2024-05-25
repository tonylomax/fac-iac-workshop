# hello-docker

This is the code for our "hello world" server.

It has 2 endpoints:

```
GET /
```

Which logs out a simple message and returns a `200` status with a "hello world" string.

```
GET /health-check
```

Which is reserved purely for allowing our target group to periodically check the health of our service.

## Health Checks

- All the health check endpoint has to do is return a `200` status code whenever the target group sends a request
- If that doesn't happen then our ECS task will get deleted and a new one created because as far as our target group is concerned, the previous task doesn't work.
- In this case we could just use the root endpoint here for the target group as it returns a `200` status code as well. I've included a dedicated health check endpoint here to illustrate some of the above nuances

## Docker

- I've already turned the server into a Docker image and uploaded it to Docker Hub - https://hub.docker.com/r/tonylomax/fac
- From there you can download it and push it to your ECR repository (once you've created it)
- You're welcome to adust this code and create your own Docker images, instructions on how to do this will be available on your ECR repository
