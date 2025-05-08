resource "aws_instance" "public" {
  #   count = length(var.az)
  count = local.new_environment == "dev" ? 3 : 1
  ami    = lookup(var.amis, var.aws_region)
  #ami = "ami-0d857ff0f5fc4e03b"
  #ami = "${data.aws_ami.my_ami.id}"
  instance_type               = lookup(var.instance_type, local.new_environment)
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.subnet1-public.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "${var.vpc_name}-public_server-${count.index + 1}"
    Env  = var.env
  }

  user_data = <<-EOF
    #! /bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<center><h1>${var.vpc_name}-public_server-${count.index + 1}</h1></center>" | sudo tee /var/www/html/index.html
EOF
}