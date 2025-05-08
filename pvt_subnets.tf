resource "aws_subnet" "subnet1-private" {
  count             = 3
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.private_subnet_cidr, count.index)
  availability_zone = element(var.az, count.index)

  tags = {
    Name              = "${var.vpc_name}-pvt_subnet-${count.index + 1}"
    Terraform-Managed = "yes"
  }
}