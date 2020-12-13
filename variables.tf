//variable username {}
//variable password {}
//variable prism_central_endpoint {}

variable "vmname" {
  default = "myTestVM"  
}

variable "cluster_name" {
  default = "DevOps-AOS5.17.1-auto_cluster_nested_5f50aeca82e14f9bf989ad2b"
}

variable "subnet_name" {
  default = "IPAM-10.129.44.0/24"
}

variable "image_name" {
  default = "CentOS-7-x86_64-GenericCloud"
}