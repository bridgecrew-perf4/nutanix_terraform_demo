
resource "nutanix_virtual_machine" "testvm" {
  name                 = "myVm2"
  cluster_uuid         = data.nutanix_clusters.clusters.entities.0.metadata.uuid
  num_vcpus_per_socket = 2
  num_sockets          = 1
  memory_size_mib      = 1024

  disk_list {
    //disk_size_mib   = 2048
    data_source_reference = {
        kind = "image"
        uuid = nutanix_image.cirros-034-disk.id
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
        uuid = "c88ad2db-b523-49f0-ae50-32db209c4df3"
      }
    }
  }

  disk_list {
    disk_size_mib   = 100000

    storage_config {
      storage_container_reference {
        kind = "storage_container"
        uuid = "c88ad2db-b523-49f0-ae50-32db209c4df3"
      }
    }
  }

  nic_list {
    subnet_uuid = nutanix_subnet.IPAM-44.id
  }
}

# Show IP address
//output "ip_address" {
  //value = nutanix_virtual_machine.testvm.nic_list_status.0.ip_endpoint_list[0]["ip"]
//}

