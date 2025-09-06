# Module: Container

## Purpose

Provisions a tailorable Proxmox-VE 9.0 LXC container with metadata to support hand-off to Ansible.

## Inputs

| Variable | Description | Type | Default |
|----------|-------------|------|---------|
| `name`   | Hostname of the container | `string` | `"mythic"` |
| `protection` | Enable protection for the container | `bool` | `false` |
| `vmid` | Unique VMID for the container | `number` | required* |
| `static_ip` | Static IP address for the container | `string` | required* |
| `gateway` | Gateway for the container | `string` | required* |
| `cores` | Cores allocated to the container | `number` | 2 |
| `memory` | Base memory (in KB) allocated to the container | `number` | 2048 |
| `swap` | Base swap size (in KB) | `number` | 0 |
| `template` | Container template to use | `string` | local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst |
| `os` | Operating system type | `string` | `"ubuntu"` |
| `diskpool` | Storage pool for the container disk | `string` | `"local-lvm"` |
| `disk` | Disk size in GB | `number` | 8 |
| `pool` | Proxmox Resource Pool | `string` | required* |
| `ssh_public_key` | SSH public key for root access | `list(string)` | required* |

## Outputs

| Output | Description |
|--------|-------------|
| `inventory_entry` | INI snippet for Ansible inventory |

## Example

```hcl
module "containers" {
  source = "../modules/container"
  name   = "iluvatar"
}
```