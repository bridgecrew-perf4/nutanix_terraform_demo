terraform {
  required_version = ">= 0.13"
  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = "~> 1.1.1"
    }
  }
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "devops-nutanix-terraform-state"
    key            = "devops/s3/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
