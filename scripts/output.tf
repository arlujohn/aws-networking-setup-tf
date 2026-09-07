output "aws_vpc_created" {
    description = "Created VPC"
    value = aws_vpc.main.arn
}

output "aws_subnet_private_created" {
    description = "Created Private Subnet"
    value = aws_subnet.aws_subnet_private.arn
}

output "aws_subnet_public_created" {
    description = "Created Public Subnet"
    value = aws_subnet.aws_subnet_public.arn
}