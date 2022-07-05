terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.6.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
  
}

terraform {
  backend "s3" {
    bucket         = "sloaizavtestterraform"
    key            = "modules/terraform.tfstate"
    region         = "us-east-1"
  }
}


module "s3_module" {
  source                      = "./modules/s3_bucket"
  s3-bucket-name              = "s3-sloaiza-modules"
  s3-region                   = "us-east-1"
  s3-bucket-acl               = "public-read"
  s3-bucket-allow_access_list = ["arn:aws:iam::385560202135:user/sebastian.loaiza"]
  s3-bucket-versioning        = "Disabled"
  s3-bucket-encrypt           = true
  
}