# Smalltest Example

The modules (container, virtual_machine) are intended to allow inventory-like provisioning against `locals.tf`.

`smalltest` is a minimal example exercising both.

## Setup

**Note:** You'll have to create a `terraform.tfvars` to configure the `bpg/proxmox` provider, specifying at least: 
- `virtual_environment_endpoint`
- `virtual_environment_password`

```bash
cd smalltest
terraform init
terraform apply
```

After provivioning is complete, run:
```bash
tofu output -json all_nodes_info | jq -r 'to_entries[] | "\(.key) static_ip=\(.value.ip_address | split("/")[0]) vmid=\(.value.vm_id) type=\(.value.type) os=\(.value.os)"' > inventory
```
**Note:** requires `jq` to be installed

inventory should contain:
```
balboa    static_ip=192.168.50.67 vmid=108 type=lxc os=ubuntu
india    static_ip=192.168.50.68 vmid=200 type=kvm os=ubuntu
```

...based on `locals.tf`:
```hcl
locals {
  node = "bluep"
  protection = false
  gateway = "192.168.50.1"
  ssh_keys = [trimspace(data.local_file.ssh_public_key.content)]
  kvms = {
    india = {
        fqdn = "india.local" 
        vmid = 200
        static_ip = "192.168.50.68"
        cores = 4
        memory = 16384
        disk =  50
        osimage = "local:import/noble-server-cloudimg-amd64.qcow2"
        os = "ubuntu"
        diskpool = "nvme_pool"
        pool = "CloudFish"
    }
  }
  lxcs = {
    balboa = {
        fqdn = "balboa.local"
        vmid = 108
        static_ip = "192.168.50.67"
        cores = 2
        memory = 16384
        disk = 100
        osimage = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "nvme_pool"
        pool = "BluePolaris"
    }
  }
}
```