provider "aws" {
  region = var.aws_region
}

terraform {
  required_providers {
    aws = {
      version = "~> 5.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket         = "awsmay-tfstate"
    key            = "awsmay.tfstate"
    region         = "us-east-1"
    dynamodb_table = "awsmay-state-locks"
    encrypt        = true
  }

}