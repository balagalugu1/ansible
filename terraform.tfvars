aws_region          = "us-east-1"
vpc_cidr            = "10.35.0.0/16"
vpc_name            = "aws_vpc"
env                 = "dev"
public_subnet_cidr  = ["10.35.1.0/24", "10.35.2.0/24", "10.35.3.0/24", "10.35.4.0/24"]
private_subnet_cidr = ["10.35.10.0/24", "10.35.20.0/24", "10.35.30.0/24"]
az                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
amis = {
  us-east-1 = "ami-084568db4383264d4"
  us-east-2 = "ami-0d857ff0f5fc4e03b"
}
instance_type = {
  dev = "t2.micro"
  uat = "t2.med"
}
key_name = "shellscrpting_kp"
#