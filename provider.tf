terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # optional: you can omit version entirely and let env0/OpenTofu decide
      # version = ">= 3.24.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}
