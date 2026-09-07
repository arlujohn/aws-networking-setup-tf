provider "aws" {
  default_tags {
    tags = {
        Name = "test"
        Type = "Networking"
        Environment = "test"
        ManagedBy = "tf"
    }
  }
  region = var.region
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}