data "aws_vpc" "ansible_controller_vpc" {
    id = "vpc-0497cdc0675e5a238"
}

data "aws_route_table" "controller_rt" {
    subnet_id = "subnet-0acb48c0f9b989844"
}

resource "aws_vpc_peering_connection" "foo" {
  peer_vpc_id   = data.aws_vpc.ansible_controller_vpc.id
  vpc_id        = aws_vpc.default.id
  auto_accept   = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
tags = {
    Name = "ansible-${var.vpc_name}-peering"
  }
}

resource "aws_route" "peering" {
  route_table_id            = aws_route_table.terraform-public.id
  destination_cidr_block    = "10.10.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.foo.id
  depends_on = [aws_route_table.terraform-public]
}

resource "aws_route" "peeringfromansible" {
  route_table_id            = data.aws_route_table.controller_rt.id
  destination_cidr_block    = "10.35.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.foo.id
  depends_on = [aws_route_table.terraform-public]
}