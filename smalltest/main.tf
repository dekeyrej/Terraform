module "containers" {
  for_each = local.lxcs
  source   = "../modules/container"

  node           = local.node
  protection     = local.protection
  gateway        = local.gateway
  ssh_public_key = local.ssh_keys
  name           = each.key
  vmid           = each.value.vmid
  static_ip      = each.value.static_ip
  cores          = each.value.cores
  memory         = each.value.memory
  template       = each.value.osimage
  os             = each.value.os
  diskpool       = each.value.diskpool
  disk           = each.value.disk
  pool           = each.value.pool
}

module "virtual_machines" {
  for_each = local.kvms
  source   = "../modules/virtual_machine"

  node           = local.node
  protection     = local.protection
  gateway        = local.gateway
  ssh_public_key = local.ssh_keys
  name           = each.key
  vmid           = each.value.vmid
  static_ip      = each.value.static_ip
  cores          = each.value.cores
  memory         = each.value.memory
  template       = each.value.osimage
  os             = each.value.os
  diskpool       = each.value.diskpool
  disk           = each.value.disk
  pool           = each.value.pool
}

data "local_file" "ssh_public_key" {
  filename = "/home/ubuntu/.ssh/id_rsa.pub"
}

output "all_nodes_info" {
  value = merge(
    {
      for name, module in module.containers :
      name => {
        vm_id      = module.vm_id
        hostname   = module.hostname
        ip_address = module.ip_address
        os         = module.os
        type       = module.type
      }
    },
    {
      for name, module in module.virtual_machines :
      name => {
        vm_id      = module.vm_id
        hostname   = module.hostname
        ip_address = module.ip_address
        os         = module.os
        type       = module.type
      }
    }
  )
}

## tofu output -json all_nodes_info | jq -r 'to_entries[] | "\(.key) \(.value.ip_address)"' > inventory
## tofu output -json all_nodes_info | jq -r 'to_entries[] | "\(.key) static_ip=\(.value.ip_address | split("/")[0]) vmid=\(.value.vm_id) type=\(.value.type) os=\(.value.os)"' > inventory