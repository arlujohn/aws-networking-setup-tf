resource "aws_vpc" "main" {
  cidr_block       = var.aws_vpc_cidr_block

  tags = {
    Name = var.aws_vpc_name
    Environment = var.environment
  }
}

resource "aws_subnet" "aws_subnet_public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.aws_subnet_cidr_block_public

  tags = {
    Name = var.aws_subnet_public_name
    Environment = var.environment
  }
}

resource "aws_subnet" "aws_subnet_private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.aws_subnet_cidr_block_private

  tags = {
    Name = var.aws_subnet_private_name
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.aws_igw_name
  }
}

resource "aws_route_table" "aws_route_table_public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.aws_route_table_name
  }
}

resource "aws_route_table_association" "aws_rt_association_public" {
  subnet_id = aws_subnet.aws_subnet_public.id
  route_table_id = aws_route_table.aws_route_table_public.id
}
