variable "aws_region" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "env" {}
variable "public_subnet_cidr" { type = list(any) }
variable "private_subnet_cidr" { type = list(any) }
variable "az" { type = list(any) }
variable "amis" { type = map(any) }
variable "instance_type" { type = map(any) }
variable "key_name" {}