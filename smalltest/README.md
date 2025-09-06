# 🧪 Smalltest: Minimal Mythic Provisioning

This example exercises both `container` and `virtual_machine` modules to demonstrate inventory-like provisioning driven by `locals.tf`. It’s a compact showcase of expressive automation and dynamic inventory generation.

## Setup

Before running, create a `terraform.tfvars` file in the `smalltest/` directory to configure the `bpg/proxmox` provider. At minimum, include:

- `virtual_environment_endpoint`
- `virtual_environment_password`

Then initialize and apply:
```bash
cd smalltest
tofu init
tofu apply
```
**Note:** requires `tofu` to be installed

## Inventory Generation

After provisioning completes, generate an Ansible-friendly inventory:

```bash
tofu output -json all_nodes_info | jq -r 'to_entries[] | "\(.key) static_ip=\(.value.ip_address | split("/")[0]) vmid=\(.value.vm_id) type=\(.value.type) os=\(.value.os)"' > inventory
```
**Note:** requires `jq` to be installed

## Example Output

```text
balboa    static_ip=192.168.50.67 vmid=108 type=lxc os=ubuntu
india    static_ip=192.168.50.68 vmid=200 type=kvm os=ubuntu
```

## Provisioning Logic

These values are defined in `locals.tf` and shape the provisioning flow

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

## Notes

- This example is intentionally minimal—ideal for testing and showcasing expressive provisioning.
- For a more expansive saga, explore the iluvatar directory.
