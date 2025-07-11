data "aws_ami" "redis_ami" {
     most_recent      = true
     name_regex       = "^DevSecOps"
     owners           = ["721834156908"]
}


resource "aws_instance" "redis-server" {
  ami                         = data.aws_ami.my_ami.id
  instance_type               = "t2.medium"
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public-subnets.0.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name              = "Redis-Server"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
  }
}