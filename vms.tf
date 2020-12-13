resource "nutanix_virtual_machine" "testvm" {
  name = var.vmname
  //cluster_uuid       = data.nutanix_clusters.clusters.entities.0.metadata.uuid
  cluster_uuid         = var.cluster_uuid
  num_vcpus_per_socket = 2
  num_sockets          = 1
  memory_size_mib      = 1024

  disk_list {
    data_source_reference = {
      kind = "image"
      //uuid = var.centos_image_uuid
      uuid = nutanix_image.CentOS-7.id
    }

    device_properties {
      disk_address = {
        device_index = 0
        adapter_type = "SCSI"
      }

      device_type = "DISK"
    }

    storage_config {
      storage_container_reference {
        kind = "storage_container"
        uuid = var.container_uuid
      }
    }
  }

  disk_list {
    disk_size_mib = 100000

    storage_config {
      storage_container_reference {
        kind = "storage_container"
        uuid = var.container_uuid
      }
    }
  }

  nic_list {
    subnet_uuid = nutanix_subnet.IPAM-44.id
    //subnet_uuid = var.subnet_uuid
  }
}

# Show IP address
output "ip_address" {
  value = nutanix_virtual_machine.testvm.nic_list_status.0.ip_endpoint_list[0]["ip"]
}
