resource "aws_subnet" "subnet1-public" {
  # count             = 3
  count             = length(var.public_subnet_cidr)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.public_subnet_cidr, count.index)
  availability_zone = element(var.az, count.index)

  tags = {
    Name              = "${var.vpc_name}-pub_subnet-${count.index + 1}"
    Terraform-Managed = "yes"
  }
}

# resource "aws_subnet" "subnet_impoted" {
#   vpc_id            = "vpc-0ed5a112d5ffad052"
#   availability_zone = "us-east-1a"
#   cidr_block        = "10.35.4.0/24"
#   tags = {
#     "Name" = "aws_vpc-pub_subnet-4"
#   }
# }