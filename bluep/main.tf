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
  template       = each.value.ostemplate
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
  diskimage      = each.value.osimage
  diskpool       = each.value.diskpool
  disk           = each.value.disk
  pool           = each.value.pool
}

data "local_file" "ssh_public_key" {
  filename = "/home/ubuntu/.ssh/id_rsa.pub"
}

output "container_info" {
  value = {
    for name, module in module.containers :
    name => {
      vm_id      = module.vm_id
      hostname   = module.hostname
      ip_address = module.ip_address
    }
  }
}

output "virtual_machine_info" {
  value = {
    for name, module in module.virtual_machines :
    name => {
      vm_id      = module.vm_id
      hostname   = module.hostname
      ip_address = module.ip_address
    }
  }
}