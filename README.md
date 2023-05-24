## Description

This section will guide you to apply some concepts of cloud services, concepts such as container, repositories, branch, continuous integration, continuous delivery, continuous deployment.


### - [Laboratory #1](/docs/laboratory_1.md)
<p>
With this lab we are going to clone an application and test its behaviour in our local environment, we are going to create an image using docker, after it we will run the image.  
</p>

### - [Laboratory #2](/docs/laboratory_2.md)
<p>
Whit this laboratory we are going to use Google Cloud Platform (GCP) to create the image of an application, at the end you can see the image in a repository on GCP called Container Registry.
</p>

### - [Laboratory #3](/docs/laboratory_3.md)
<p>
 In lab #1 you cloned a repository, created your branch and created a Dockerfile, after on lab #2 you created a file cloudbuild.yaml, in lab #3 you will create a trigger which is responsible for listening if your branch has been pushed any change to create new image, run and deploy it. This way you don't need to take care to deploy any application because it will deploy any time once the source is changed.
</p>

### - [Laboratory #4](/docs/laboratory_4.md)

With this lab we are going to generete the image on Artifact Registry, after it, we are going to use the image to implement it on Google Kubernetes Engine (GKE). We already have a kubernetes cluster configured in google cloud.
