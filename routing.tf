resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name = "${var.vpc_name}-main_rt"
  }
}

resource "aws_route_table_association" "terraform-public1" {
  count          = 3
  subnet_id      = element(aws_subnet.subnet1-public.*.id, count.index)
  route_table_id = aws_route_table.terraform-public.id
}