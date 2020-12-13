
# Demo Code of using Trrraform Nutanix Provider

### Import existing VLAN: 

i.e. ```terraform import nutanix_subnet.IPAM-44 4fde9fb6-f75f-44a5-b17e-be77c001b65e```

### Usage:

* Prepare provider.tf

```
provider "nutanix" {
  username = "xxxx"
  password = "xxxxxxxxxxxx"
  endpoint = "xxx.xxx.xxx.xxx"
  insecure = true
  port     = 9440
}
```

* Fill in default values in variables.tf

```
terrafoorm init

terraform plan -out plan-20201212
terraform apply plan-20201212

terraform destroy
```