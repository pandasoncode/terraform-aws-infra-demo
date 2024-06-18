terraform {
  backend "s3" {
    key     = "terraform.tfstate"
    encrypt = true
  }
}

provider "aws" {
  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project_name
      Team        = "DevOps"
    }
  }
}
