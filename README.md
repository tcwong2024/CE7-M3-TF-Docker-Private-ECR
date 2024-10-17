# Module 3 Assigment 3.5

## How to create docker image contain app and deploy to private ECR using Terraform

- Guide for creating private ECR using terraform
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository

1. Create a new github repository.

2. Clone the githbu repository locally.

3. Use terraform to create a private ECR repository.

    - locate to terraform folder and run below command
    ```terraform init
    terraform plan
    terraform apply```

4. Go to flask_app folder you should have below file
    - app.py            => python web application will print "hello,  <your name>"
    - Dockerfile        => Contain necessary infomation to build a docker image
    - requirements.txt  => require flask installed

5. Test to build docker images locally, make sure you have docker installed.

```docker build -t wtc-tf-ecr-flask-app .
   docker build -t <my-node-app>
   docker images
   docker run -dp 8080:8080 <my-node-app>
   docker ps
   curl localhost:8080
```

6. Push docker to ECR follow below command (You can get this command form AWS-Private ECR repo-> View push commands ). make sure you have aws cli install and aws configure on your local pc.
```
   aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin 255945442255.dkr.ecr.us-east-1.amazonaws.com
   sudo docker build -t wtc-tf-private-ecr .
   sudo docker tag wtc-tf-private-ecr:latest 255945442255.dkr.ecr.us-east-1.amazonaws.com/wtc-tf-private-ecr:latest
   sudo docker push 255945442255.dkr.ecr.us-east-1.amazonaws.com/wtc-tf-private-ecr:latest
```

7. Clean up docker image and ECR 
delete docker image - go to docker image folder, select the image and delete.
For ECR repo folder- back to the terraform folder, enter ```terrform destroy``` it will remove the AWS ECR folder.
    
