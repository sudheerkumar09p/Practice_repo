terraform {
  backend "s3" {
    region  = "us-east-1"
    bucket  = "terraformstatefilebackupdemoproj"
    key     = "terraform-state/terraform.tfstate"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.63.0"
    }
  }
}
