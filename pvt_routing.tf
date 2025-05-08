resource "aws_route_table" "terraform-private" {
  vpc_id = aws_vpc.default.id


  tags = {
    Name = "${var.vpc_name}-main_rt_private"
  }
}

resource "aws_route_table_association" "terraform-private" {
  count          = 3
  subnet_id      = element(aws_subnet.subnet1-private.*.id, count.index)
  route_table_id = aws_route_table.terraform-private.id
}