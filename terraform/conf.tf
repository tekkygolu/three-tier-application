module "templates" {
    source = "../../templates"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
  backend "s3" {
    bucket = "terraform-backend-<<AWS_ACCOUNT_ID>>"
    key    = "aws_stuff/day_two_two_tier_application/terraform"
    region = "us-east-1"
    profile = "AdministratorAccess-<<AWS_ACCOUNT_ID>>"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  profile = "AdministratorAccess-<<AWS_ACCOUNT_ID>>"
}

output  key {
  value = join("/", slice(split("/", path.cwd), index(split("/", path.cwd), "aws_stuff"), length(split("/", path.cwd))))
}