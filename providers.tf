# root-providers
# aws provider

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.10.0"      # default was 5.0 version changed it to 5.10 for fixing issues with bucket acl
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
# resource "aws_vpc" "resume_vpc" {
#   cidr_block = "10.10.0.0/16"
# }