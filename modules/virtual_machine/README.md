
# Module: virtual_machine

## Purpose

Provisions a tailorable Proxmox-VE 9.0 Virtual Machine with metadata to support hand-off to Ansible.

## Inputs

| Variable | Description | Type | Default |
|----------|-------------|------|---------|
| `name`   | Hostname of the VM | `string` | `"mythic"` |
| `protection` | Enable protection for the VM | `bool` | `false` |
| `vmid` | Unique VMID for the VM | `number` | none |
| `static_ip` | Static IP address for the VM | `string` | none |
| `gateway` | Gateway for the VM | `string` | none |
| `cores` | Cores allocated to the VM | `number` | 2 |
| `memory` | Base memory (in KB) allocated to the VM | `number` | 2048 |
| `swap` | Base swap size (in KB) | `number` | 0 |
| `template` | VM template to use | `string` | local:import/noble-server-cloudimg-amd64.qcow2 |
| `os` | Operating system type | `string` | `"ubuntu"` |
| `diskpool` | Storage pool for the VM disk | `string` | `"local-lvm"` |
| `disk` | Disk size in GB | `number` | 8 |
| `pool` | Proxmox Resource Pool | `string` | none |
| `ssh_public_key` | SSH public key(s) for ubuntu access | `list(string)` | none |


## Outputs

| Output | Description |
|--------|-------------|
| `inventory_entry` | INI snippet for Ansible inventory |

## Example

```hcl
module "virtual_machines" {
  source = "../modules/virtual_machine"
  name   = "iluvatar"
}
```