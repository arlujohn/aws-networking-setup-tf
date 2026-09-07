locals {
    common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
    account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

    aws_region = local.account_vars.locals.aws_region
    resource_tags = local.common_vars.locals.tags
}

include "root" {
    path = find_in_parent_folders()
}

terraform {
    source = "../..//scripts"
}

inputs = {

    ##########################################
    # AWS VPC
    ##########################################
    
    aws_vpc_name = "my-main-vpc"
    aws_vpc_cidr_block = "10.0.0.0/16"



    ##########################################
    # AWS SUBNETS - PUBLIC
    ##########################################

    aws_subnet_public_name = "my-public-subnet"
    aws_subnet_cidr_block_public = "10.0.0.0/24"

    aws_igw_name = "main_igw"
    aws_route_table_name = "public-rt"


    ##########################################
    # AWS SUBNETS - PRIVATE 
    ##########################################

    aws_subnet_private_name = "my-private-subnet"
    aws_subnet_cidr_block_private = "10.0.1.0/24"


    ##########################################
    # COMMON
    ##########################################

    region = local.aws_region
    tags = local.resource_tags
    environment = "nonprod"
}