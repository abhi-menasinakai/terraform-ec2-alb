#VPC creation
resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    "Name" = "my_vpc"
  }
}

#2 Subnets
resource "aws_subnet" "subnets" {
  count = length(var.subnet_cidr)
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_names[count.index]
  }
}

#Internet Gateway

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "MyInternetGateway"
  }
}

#RouteTableConfiguration

resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0" #Public
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    "Name" = "my_RouteTable"
  }
}

#RouteTableAssociation

resource "aws_route_table_association" "my_rta" {
  count = length(var.subnet_cidr)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.my_rt.id
}