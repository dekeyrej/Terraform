resource "proxmox_virtual_environment_vm" "virtual_machine" {
  on_boot = true
  stop_on_destroy = true
  node_name = var.node
  pool_id = var.pool
  protection = var.protection

  name      = var.name
  vm_id     = var.vmid

  # dynamic "vm_id" {
  #   for_each = var.vmid == 0 ? [1] : []
  #   content {
  #     vm_id = random_integer.vmid.result
  #   }
  # }

  initialization {
    datastore_id = var.diskpool
    ip_config {
      ipv4 {
        address = "${var.static_ip}/24"
        gateway = var.gateway
      }
    }

    user_account {
      username = "ubuntu"
      keys = var.ssh_public_key
    }
  }
  
  network_device {
    bridge = "vmbr0"
  }  
  
  cpu {
    cores = var.cores
    sockets = 1
    type = "host"
  }

  memory {
    dedicated = var.memory
    floating  = var.memory
  }

  operating_system {
    type = var.ostype
  }

  disk {
    datastore_id = var.diskpool
    import_from  = var.template
    interface    = "virtio0"
    size         = var.disk
  }
  
  serial_device {}
}
