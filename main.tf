terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  count         = 10
  tags ={
    Name = "test"
  
}
}

# Create a VPC
resource "aws_vpc" "testvpc" {
  cidr_block = "10.0.0.0/16"
  tags ={
    Name = "testvpc"
  }
}