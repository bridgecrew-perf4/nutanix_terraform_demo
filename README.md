
## Demo Code of using Terraform Nutanix Provider

Create a CentOS7 Virtual Machine terraform (use CentOS7 Cloud image)

### File list
```
.
|-- datasources.tf
|-- main.tf
|-- provider.tf
|-- README.md
|-- template
|   `-- cloud-init.tpl
|-- variables.tf
`-- vms.tf
```

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

provider "aws" {
  region     = "us-east-1"
  profile    = "xxxxxx"
  access_key = "xxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxxxxx"
  /*
  endpoints  {
    s3      = "http://xxx.xxx.xxx.xxx"
  }
  */
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