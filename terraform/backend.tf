terraform {
  backend "s3" {
    bucket = "sctp-ce7-tfstate"
    key    = "wtc-tf-private-ecr.tfstate" #Change the value of this to yourname-tf-workspace-act.tfstate for  example
    region = "us-east-1"
  }
}