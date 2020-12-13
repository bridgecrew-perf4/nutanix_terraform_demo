terraform {
  required_version = ">= 0.13"
  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = "~> 1.1.1"
    }
  }
}

/* uncomment annd fill values
/* 
provider "nutanix" {
  username = "xxxxxx"
  password = "xxxxxxxxxxxx"
  endpoint = "xxx.xxx.xxx.xxx"
  insecure = true
  port     = 9440
}
*/

