# Laboratory # 4 - Implement the application on Google Kubernetes Engine

## Description

With this lab we are going to generete the image on Artifact Registry, after it, we are going to use the image to implement it on Google Kubernetes Engine (GKE). We already have a kubernetes cluster configured in google cloud.

## Access to the cluster

Before to start, it is necessary to get access to the cluster, run the below command on your [cloud shell](https://console.cloud.google.com/welcome?pli=1&project=ucaldas-cloud-computing&cloudshell=true)

```bash
gcloud container clusters get-credentials helloworld-gke --region us-central1 --project ucaldas-cloud-computing
```

## Generate image on repo ucaldas-repo

Alredy exists a repo on artifact registry called [ucaldas-repo](https://console.cloud.google.com/artifacts/docker/ucaldas-cloud-computing/us-central1/ucaldas-repo?cloudshell=true&project=ucaldas-cloud-computing), the next command will generate an image with ___`YOUR-NAME-gke`___ name, please change the name. Make sure you are on lab-ucaldas folder
```sh
# Change directory to the lab-ucaldas folder
cd lab-ucaldas
```
Generate the Docker Image called `YOUR-NAME-gke`
```sh
gcloud builds submit \
  --tag us-central1-docker.pkg.dev/ucaldas-cloud-computing/ucaldas-repo/YOUR-NAME-gke .
```

## Create a deployment file

Kubernetes will allow you to create a Deployment object, it is important to change the name ___`your-name-dep-gke`___ also the url by the image, change the url for the image us-central1-docker.pkg.dev/ucaldas-cloud-computing/ucaldas-repo/___`your-name-gke`___:latest

Replace `YOUR-NAME` and `your-name`

Name file: `deployment.yaml`
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  # Replace YOUR-NAME-DEP-gke by other name
  name: your-name-dep-gke
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hello-your-name
  template:
    metadata:
      labels:
        app: hello-your-name
    spec:
      containers:
      - name: hello-your-name-app
        # Replace YOUR-NAME-gke by the name used before
        image: us-central1-docker.pkg.dev/ucaldas-cloud-computing/ucaldas-repo/YOUR-NAME-gke:latest
        ports:
        - containerPort: 3000
        env:
          - name: PORT
            value: "3000"
```


## Implement the deployment

You need to apply the deployment with tne next command:

```sh
kubectl apply -f deployment.yaml
```
With the next command you check the deployments:

```sh
kubectl get deployments
```

With the next command you check the pods:
```sh
kubectl get pods
```

## Create a service file

It allow to create a service on kubernetes, it is important to change the name ___`your-name-svc`___.

`service.yaml`
```yaml
apiVersion: v1
kind: Service
metadata:
  name: your-name-svc
spec:
  type: LoadBalancer
  selector:
    app: hello-your-name
  ports:
  - port: 80
    targetPort: 3000
```

## Implement the service

You need to apply the service with tne next command:

```sh
kubectl apply -f service.yaml
```
With the next command you check the services:

```sh
kubectl get services
```

You'd need to wait until it generates the EXTERNAL-IP

Now you can check the applicatio with http://`EXTERNAL-IP`
