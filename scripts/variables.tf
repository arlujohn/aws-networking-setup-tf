##########################################
# AWS VPC
##########################################

variable "aws_vpc_name" {
    description = "AWS VPC NAME"
    type = string
}

variable "aws_vpc_cidr_block" {
    description = "CIDR Block for VPC"
    type = string
}

##########################################
# AWS PUBLIC SUBNET
##########################################

variable "aws_subnet_public_name" {
    description = "AWS SUBNET PUBLIC NAME"
    type = string
}

variable "aws_subnet_cidr_block_public" {
    description = "CIDR Block for Public Subnet"
    type = string
}

variable "aws_igw_name" {
    description = "Internet Gateway Name"
    type = string
}

variable "aws_route_table_name" {
    description = "Route Table Name"
    type = string
}



##########################################
# AWS PRIVATE SUBNET
##########################################

variable "aws_subnet_private_name" {
    description = "AWS SUBNET PRIVATE NAME"
    type = string
}

variable "aws_subnet_cidr_block_private" {
    description = "CIDR Block for Private Subnet"
    type = string
}



##########################################
# COMMONS
##########################################

variable "region" {
    description = "AWS Region"
    type = string
}

variable "environment" {
    description = "Resource environment"
    type = string
}

variable "tags" {
    description = "Tags"
    type = map(string)
    default = {
        Type = "Networking"
        Environment = "NonProd"
        ManagedBy = "tf"
    }
}

