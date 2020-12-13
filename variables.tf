//variable username {}
//variable password {}
//variable prism_central_endpoint {}

variable "vmname" {
  default = "myTestVM"
}

variable "cluster_name" {
  default = "mycluster"
}

variable "subnet_name" {
  default = "vlan123"
}

variable "image_name" {
  default = "CentOS-7-x86_64-GenericCloud"
}

variable "s3-backend-bucket" {
  default = "devops-nutanix-terraform-state"
}
