# distinct takes a list and returns a new list with any duplicate eliments removed.
# toset will remove any duplicate eliments and discard the ordering of the elements.
locals {
  new_public_subnet_cidr = distinct(var.public_subnet_cidr)
  new_environment        = lower(var.env)
  ingress                = toset([22, 80, 443, 444, 777, 555, 666, 443])
  egress                 = toset([22, 80, 443, 444, 777, 555, 666, 443])
}