# Module 3: Assigment 3.5

## How to create docker image contain app and deploy to private ECR using Terraform

1. Create a new github repository and Clone the github repository locally.

2. Under you local git folder create "terrform" folder to store all TF files use to setup private ECR repository.

3. Locate to "terraform" folder and run below command one by one. After "terrform apply" success, your private ECR repository will created. Please check on AWS console online.

```
    terraform init
    terraform plan
    terraform apply
```

4. Locate to "flask_app" folder you should have below files create.
    | File name | Description |
    |-----|-----|
    | app.py| Python code for web application - the outpur will printed "hello,  <your name>"|
    | Dockerfile | Contain all necessary infomation to build a docker image|
    | requirements.txt | Requirement software need to be installed. eg. flask|

5. Test to build docker images locally, make sure you have docker installed. Run the below command, you should be able to curl a website.

```
    docker build -t wtc-tf-ecr-flask-app .
    docker build -t <my-node-app>
    docker images
    docker run -dp 8080:8080 <my-node-app>
    docker ps
    curl localhost:8080
```

6. To push docker image to AWS ECR enter the command below (You can get this command form AWS->Private ECR repository-> View push commands). Make sure you have AWS CLI install and AWS Configure on your local computer. Run all the command one by one, you should able to see your docker image uploaded into AWS ECR.

```
   aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin <password>
   sudo docker build -t wtc-tf-private-ecr .
   sudo docker tag wtc-tf-private-ecr:latest <ECR Repository>
   sudo docker push <docker image>
```

7. Clean up docker image and ECR 
    - Delete docker image - Go to ECR repository folder, select the docker image and delete.
    - Delete ECR repository folder- Back to the terraform folder, enter ```terraform destroy``` it will remove the AWS ECR folder.

## Resource Link : 
- Guide for creating private ECR using terraform
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository
