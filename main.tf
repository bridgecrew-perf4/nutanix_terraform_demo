terraform {
  required_version = ">= 0.13"
  required_providers {
    nutanix = {
      source  = "terraform-providers/nutanix"
      version = "~> 1.1"
    }
  }
}

data "nutanix_clusters" "clusters" {}

data "nutanix_cluster" "sglab-devops-cluster" {
   cluster_id = "0005ae65-4f5c-0343-0632-c0c28edc611e"
}

# ### Define Terraform Managed Subnets
# Import existing VLAN: terraform import nutanix_subnet.IPAM-44 4fde9fb6-f75f-44a5-b17e-be77c001b65e
resource "nutanix_subnet" "IPAM-44" {
  cluster_uuid = data.nutanix_clusters.clusters.entities.0.metadata.uuid
  name = "IPAM-10.129.44.0/24"
  vlan_id = 0
  subnet_type = "VLAN"
  //subnet_id = "4fde9fb6-f75f-44a5-b17e-be77c001b65e"
}
resource "nutanix_image" "cirros-034-disk" {
  name = "cirros-034-disk"

  #source_uri  = "http://endor.dyn.nutanix.com/acro_images/DISKs/cirros-0.3.4-x86_64-disk.img"
  source_uri  = "http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img"
  description = "heres a tiny linux image, not an iso, but a real disk!"
}
