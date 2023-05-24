# Laboratory # 2 - Using google cloud to deploy the application

## Description

Whit this laboratory we are going to use Google Cloud Platform (GCP) to create the image of an application, for it you should have created a Dockerfile on [Laboratory #1](/docs/laboratory_1.md), at the end you can see the image in a repository on GCP called Container Registry.

You will need to create a file cloudbuild.yaml with the necessary information to create the image. Dockerfile allow us to define what information the image will have, cloudbuil.yaml allow us to define repository destination.

Cloud Run is serverless. Allow us to run containers that are invocable via requests or events. In this lab we are going to run the image manually.

## Create cloudbuild.yaml file on project root
Choose a name to your image a assign it on `substitutions/_IMG_NAME` section.

```yaml
steps:
  - name: gcr.io/cloud-builders/docker
    args:
      - build
      - -t=gcr.io/ucaldas-cloud-computing/${_IMG_NAME}:v${_IMG_VERS}
      - .
  - name: gcr.io/cloud-builders/docker
    args:
      - build
      - -t=gcr.io/ucaldas-cloud-computing/${_IMG_NAME}:latest
      - .
substitutions:
  _IMG_NAME: **** name-your-image ****
  _IMG_VERS: "0.1"
images:
  # image tag is defined here since GCR appends `:latest` to your image tag by
  # default and pushes the tag with latest
  - gcr.io/ucaldas-cloud-computing/${_IMG_NAME}:v${_IMG_VERS}
  - gcr.io/ucaldas-cloud-computing/${_IMG_NAME}:latest

```


## Create image
- List images created on container Registry 
  - Go to CI/CD / Container Registry

With the next command you can push the image on Container Registry.

```bash
# Create image on container registry
$ gcloud builds submit --project ucaldas-cloud-computing
```

- List images created on container Registry

## Deploy application on Google Cloud Platform

- List services created
  - Go to SERVERLESS / Cloud Run

### Create service on Cloud Run
- Section: Deploy one revision from an existing container image
```
Choose image previously created on Container Registry
```
- Section: Autoscaling
```
Assign 0 to 3 instances
```
- Section: Authentication
```
Choose Allow unauthenticated invocations
```
- Section: Container port
```
Use port exposed on Dockerfile
```

You can keep other values by default and choose create button

## Test service created on Cloud Run

- Go to SERVERLESS / Cloud Run 
- Go to service previously created
- Copy the url and use on a browser web or curl command
