terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# VPC 1
resource "aws_vpc" "vpc1" {
  cidr_block           = var.vpc1_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "${var.project_name}-vpc1"
    Project = var.project_name
  }
}

# VPC 2
resource "aws_vpc" "vpc2" {
  cidr_block           = var.vpc2_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "${var.project_name}-vpc2"
    Project = var.project_name
  }
}

# VPC Peering Connection
resource "aws_vpc_peering_connection" "peer" {
  vpc_id      = aws_vpc.vpc1.id
  peer_vpc_id = aws_vpc.vpc2.id
  auto_accept = true

  tags = {
    Name    = "${var.project_name}-peering"
    Project = var.project_name
  }
}

# Route Table for VPC 1
resource "aws_route_table" "vpc1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block                = var.vpc2_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  }

  tags = {
    Name    = "${var.project_name}-vpc1-rt"
    Project = var.project_name
  }
}

# Route Table for VPC 2
resource "aws_route_table" "vpc2" {
  vpc_id = aws_vpc.vpc2.id

  route {
    cidr_block                = var.vpc1_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  }

  tags = {
    Name    = "${var.project_name}-vpc2-rt"
    Project = var.project_name
  }
}


# Subnet 1 in VPC 1
resource "aws_subnet" "vpc1_subnet" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name    = "${var.project_name}-vpc1-subnet"
    Project = var.project_name
  }
}

# Subnet 2 in VPC 2
resource "aws_subnet" "vpc2_subnet" {
  vpc_id                  = aws_vpc.vpc2.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name    = "${var.project_name}-vpc2-subnet"
    Project = var.project_name
  }
}

# Associate subnet 1 with VPC 1's custom route table
resource "aws_route_table_association" "vpc1_subnet" {
  subnet_id      = aws_subnet.vpc1_subnet.id
  route_table_id = aws_route_table.vpc1.id
}

# Associate subnet 2 with VPC 2's custom route table
resource "aws_route_table_association" "vpc2_subnet" {
  subnet_id      = aws_subnet.vpc2_subnet.id
  route_table_id = aws_route_table.vpc2.id
}


# Security group for VPC 1
resource "aws_security_group" "vpc1_test" {
  name        = "${var.project_name}-vpc1-test-sg"
  description = "Allow ping from VPC 2 for peering test"
  vpc_id      = aws_vpc.vpc1.id

  ingress {
    description = "Allow ICMP from VPC 2"
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = [var.vpc2_cidr]
  }

  egress {
    description = "Allow outbound traffic"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project_name}-vpc1-test-sg"
    Project = var.project_name
  }
}

# Security group for VPC 2
resource "aws_security_group" "vpc2_test" {
  name        = "${var.project_name}-vpc2-test-sg"
  description = "Allow ping from VPC 1 for peering test"
  vpc_id      = aws_vpc.vpc2.id

  ingress {
    description = "Allow ICMP from VPC 1"
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = [var.vpc1_cidr]
  }

  egress {
    description = "Allow outbound traffic"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project_name}-vpc2-test-sg"
    Project = var.project_name
  }
}


# EC2 test instance in VPC 1
resource "aws_instance" "vpc1_test" {
  ami                         = "ami-0d4ca1ab7979de8cf"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.vpc1_subnet.id
  vpc_security_group_ids      = [aws_security_group.vpc1_test.id]
  associate_public_ip_address = false

  user_data = <<-EOF
    #!/bin/bash
    systemctl enable --now sshd
    EOF

  tags = {
    Name    = "${var.project_name}-vpc1-test"
    Project = var.project_name
  }
}

# EC2 test instance in VPC 2
resource "aws_instance" "vpc2_test" {
  ami                         = "ami-0d4ca1ab7979de8cf"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.vpc2_subnet.id
  vpc_security_group_ids      = [aws_security_group.vpc2_test.id]
  associate_public_ip_address = false

  user_data = <<-EOF
    #!/bin/bash
    systemctl enable --now sshd
    EOF

  tags = {
    Name    = "${var.project_name}-vpc2-test"
    Project = var.project_name
  }
}