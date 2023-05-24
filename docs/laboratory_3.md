# Laboratory # 3 - Use Google Cloud Platform to automate the Continuous Deployment Process
In previous steps you created an image manually on GCP, after you use the image to deploy it. Cloud computing services allow you to automate this process. For it, it is necessary to do some configuration.

To summarize the whole exercise is the next, you cloned a repository, created your branch and created a Dockerfile on [Laboratory #1](/docs/laboratory_1.md) after you created a file cloudbuild.yaml on [Laboratory #2](/docs/laboratory_2.md), in lab #3 you will created a trigger which is responsible for listening if your branch has been pushed any change to create new image, run and deploy it.

## Create trigger.
Go to CI/CD / Trigger and choose `CREATE TRIGGER`
- Name Section: Choose a name. 
- Repository Section: Choose repository ucaldas-cloud-computing/lab-ucaldas from GitHub.
If the repository doesn't list choose `CONNECT NEW REPOSITORY`, follow the steps show on the system.
Note: Make sure the organization is ucaldas-cloud-computing and choose lab-ucaldas repository.
- Branch Section: Choose a branch that will trigger. Choose a branch that you creted previously, to check you can use `git status` on terminal
- Configuration Section: Choose Cloud Build Configuration file (yaml or json).

## Test trigger.
You need to push the changes on the branch to trigger the image creation.

```bash
# Check the changes on your branch
# Make sure you are on your branch previously created
$ git status
# Add all new changes to local repository
$ git add .
# Prepare the changes with a comment
$ git commit -m "Your comment"
# Push the changes to remote branch
$ git push origin "your branch"
```
Check on Gloogle Cloud Platform
- Go to CI/CD / Cloud Build / History
```
You should see a new build. The build will create a new image.
```
- Go to CI/CD / Container Registy / Images and select the image
```
You should see a new instance of the image.
```
Summary: 
With the trigger when you push on the branch, a new instance image is created

## Automate Continous Deployment

- Go to SERVERLESS / Cloud Run and choose the service created previously
- Hit SET UP CONTINOUS DEPLOYMENT button
- Follow the steps that the system shows.
- Branch section: Choose or type the name of your branch, remember you can check the branch with `git status` on a terminal.
- Build Type section: choose Dockerfile.

## Test continous deployment

You need to do a change to push on the branch

- Go to `lab-ucaldas/views/index.hbs` and add add some information on body section
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

- Push the new change
```bash
# Check the changes on your branch
# Make sure you are on your branch previously created
$ git status
# Add all new changes to local repository
$ git add .
# Prepare the changes with a comment
$ git commit -m "Your comment"
# Push the changes to remote branch
$ git push origin "your branch"
```

- Go to SERVERLESS / Cloud Run and choose the service created previously.
```
You should note the service is pending.
```
- Go to URL generated on the service