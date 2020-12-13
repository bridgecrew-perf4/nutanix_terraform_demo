
## Demo Code of using Terraform Nutanix Provider

### Import existing VLAN: 

i.e. ```terraform import nutanix_subnet.IPAM-44 4fde9fb6-f75f-44a5-b17e-be77c001b65e```

### Usage:

### Prepare provider.tf

```
provider "nutanix" {
  username = "xxxx"
  password = "xxxxxxxxxxxx"
  endpoint = "xxx.xxx.xxx.xxx"
  insecure = true
  port     = 9440
}
```
### Prepare cloud-init template

./template/cloud-init.tpl
```
#cloud-config
# avoid configuring swap using mounts
mounts:
  - [swap, null]
#cloud-config
users:
  - name: automatin
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh-authorized-keys:
      - ssh-rsa {your public key}
chpasswd:
  list: |
    root:xxxxxxxx
    automatin:xxxxxxxx
  expire: False
disable_root: false
ssh_pwauth:   true
```

### Fill in default values in variables.tf

### Deploy
```
terrafoorm init

terraform plan -out plan-xxxxx
terraform apply plan-xxxx

terraform destroy
```