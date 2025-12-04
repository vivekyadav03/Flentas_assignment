terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1" # Europe(Stockholm)
}

# VPC creation

resource "aws_vpc" "vivek_yadav" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Vivek_yadav"
  }
}

# Subnets creation

# Public Subnet 1 - eu-north-1a
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.vivek_yadav.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Vivekyadav_subnet1"
    Type = "public"
  }
}

# Public Subnet 2 - eu-north-1b
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.vivek_yadav.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Vivekyadav_subnet2"
    Type = "public"
  }
}

# Private Subnet 1 - eu-north-1c
resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.vivek_yadav.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-north-1c"

  tags = {
    Name = "Vivekyadav_privsub1"
    Type = "private"
  }
}

# Private Subnet 2 - eu-north-1a
resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.vivek_yadav.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-north-1a"

  tags = {
    Name = "Vivekyadav_privsub2"
    Type = "private"
  }
}

# Internet Gateway creating process

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vivek_yadav.id

  tags = {
    Name = "Vivekyadav_ig1"
  }
}

# Public Route Table creation


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vivek_yadav.id

  tags = {
    Name = "Vivekyadav_routetab1"
    Type = "public"
  }
}

# Route for internet access through IGW
resource "aws_route" "public_internet_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate Public Subnet 1
resource "aws_route_table_association" "public_subnet1_assoc" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}

# Associate Public Subnet 2
resource "aws_route_table_association" "public_subnet2_assoc" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}


# NAT Gateway (in Public Subnet 1)

# Elastic IP for NAT
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "Vivekyadav_Nat1_eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = "Vivekyadav_Nat1"
  }

  depends_on = [aws_internet_gateway.igw]
}

# Private Route Table

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vivek_yadav.id

  tags = {
    Name = "Vivekyadav_routetab2"
    Type = "private"
  }
}

# Route for private subnets to use NAT for internet access
resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

# Associate Private Subnet 1
resource "aws_route_table_association" "private_subnet1_assoc" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_rt.id
}

# Associate Private Subnet 2
resource "aws_route_table_association" "private_subnet2_assoc" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_rt.id
}
