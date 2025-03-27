terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "your-bucket-name"
    key    = "path/to/key/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "dynamodbtablename"
  }
}


provider "aws" {
  region = "us-east-1"
}
