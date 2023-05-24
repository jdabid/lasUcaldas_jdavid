# Laboratory # 1 - Run application in a local way - manually local

## Description

With this lab we are going to clone an application and test its behaviour in our local environment, we are going to create an image using docker, after it we will run the image.  

## Clone repository - lab-ucaldas

```bash
# Clone repository
$ git clone git@github.com:ucaldas-cloud-computing/lab-ucaldas.git
# list files or folders
$ ls
```
## Go to folder lab-ucaldas
```bash
$ cd lab-ucaldas
```
## Check branch
```bash
$ git status
```
## Installation

```bash
$ npm install
```

## Running the app

```bash
# development
$ npm run start
```

## Test
Check port on `lab-ucaldas/src/main.ts` and use it to next command in a new terminal
```bash
$ curl localhost:3000
```

## Create new branch called your lab-ucaldas-yourname
```bash
# make sure you are on lab-ucaldas folder
$ git branch lab-ucaldas-yourname
# switch branch
$ git checkout lab-ucaldas-yourname
# check if you are on the new branch created
$ git status
```
## Run application in a container - manually local

## Implement docker on the application
Create Dockerfile file on project root
```yaml
FROM node:19

# Copy source code
COPY . /app

# Change working directory
WORKDIR /app

# Install dependencies
RUN npm install

# Expose API port to the outside
EXPOSE 3000

# Launch application
CMD ["npm","start"]

```

## Add some more information to the view.
Go to `lab-ucaldas/views/index.hbs` and add your name on body section
```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>App Hello</title>
  </head>
  <body>
    # your name
    {{ message }}
  </body>
</html>
```


## Create image 
```bash
# list images created
$ docker images
# grep lab-ucaldas helps you to find an image with that name 
$ docker images | grep lab-ucaldas
# build docker
$ docker build . -t lab-ucaldas-yourname
# list images created
$ docker images | grep lab-ucaldas
```
## Run container
```bash
# list containers running
$ docker ps
# run docker
# 3000 port is the port expose on docker file, 
# 8081 port is the port to test the application
$ docker run --rm -d -p 8081:3000 lab-ucaldas-yourname
# list containers run
$ docker ps
```

## Test container
```bash
$ curl localhost:8081
```
## Stop container
```bash
# list containers running
$ docker ps
# stop container
$ docker stop name-container
# list containers run
$ docker ps
```
## Remove image
```bash
# list images created
$ docker images
# remove images
$ docker image rm name-image
# list images created
$ docker images
```
