
## Demo Code of using Terraform Nutanix Provider

Create a CentOS7 Virtual Machine terraform (use CentOS7 Cloud image)

### Usage

#### Prepare provider.tf

```
provider "nutanix" {
  username = "xxxx"
  password = "xxxxxxxxxxxx"
  endpoint = "xxx.xxx.xxx.xxx"
  insecure = true
  port     = 9440
}
```
#### Prepare cloud-init template

./template/cloud-init.tpl
```
#cloud-config
# avoid configuring swap using mounts
mounts:
  - [swap, null]
#cloud-config
users:
  - name: automation
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh-authorized-keys:
      - ssh-rsa {your public key}
chpasswd:
  list: |
    root:xxxxxxxx
    automation:xxxxxxxx
  expire: False
disable_root: false
ssh_pwauth:   true
```

#### Fill in default values in variables.tf

### Deploy
```
terrafoorm init

terraform plan -out plan-xxxxx
terraform apply plan-xxxx

terraform destroy
```