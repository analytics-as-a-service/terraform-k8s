provider "aws" {
  region                  = var.aws_region
  shared_credentials_files = [var.aws_credentials_path]
  profile                 = var.aws_credentials_profile
}

terraform {
  required_providers {
    ansible = {
      source  = "nbering/ansible"
      version = "1.0.4"
    }
  }
}

provider "ansible" {}

provider "null" {}