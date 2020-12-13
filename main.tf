terraform {
  required_version = ">= 0.13"
  required_providers {
    nutanix = {
      //source  = "terraform-providers/nutanix"
      source  = "nutanix/nutanix"
      version = "~> 1.1.1"
    }
  }
}

/*
provider "nutanix" {
  username = "xxxxxx"
  password = "xxxxxxxxxxxx"
  endpoint = "xxx.xxx.xxx.xxx"
  insecure = true
  port     = 9440
}
*/

data "nutanix_clusters" "clusters" {
  //  cluster_id = var.cluster_uuid
}

data "nutanix_subnet" "IPAM-44" {
  subnet_name = var.subnet_name
  //subnet_name = "IPAM-10.129.44.0/24"
  subnet_id = var.subnet_uuid
}

data "nutanix_image" "CentOS-7" {
  image_name = "CentOS-7-x86_64-GenericCloud"
  image_id   = var.centos_image_uuid
}
