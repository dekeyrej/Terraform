locals {
  node = "bluep"
  protection = false
  gateway = "192.168.50.1"
  ssh_keys = [trimspace(data.local_file.ssh_public_key.content)]
  kvms = {
    india = { 
        vmid = 200
        static_ip = "192.168.50.68"
        cores = 4
        memory = 16384
        disk =  50
        osimage = "local:import/noble-server-cloudimg-amd64.qcow2"
        diskpool = "nvme_pool"
        pool = "BluePolaris"
    }
    thailand = {
        vmid = 201
        static_ip = "192.168.50.69"
        cores = 4
        memory = 16384
        disk =  50
        osimage = "local:import/noble-server-cloudimg-amd64.qcow2"
        diskpool = "nvme_pool"
        pool = "BluePolaris"
    }
    mexico = {
        vmid = 202
        static_ip = "192.168.50.70"
        cores = 4
        memory = 16384
        disk =  50
        osimage = "local:import/noble-server-cloudimg-amd64.qcow2"
        diskpool = "nvme_pool"
        pool = "BluePolaris"
    }
    panama = { 
        vmid = 210
        static_ip = "192.168.50.71"
        cores = 8
        memory = 16384
        disk =  50
        osimage = "local:import/noble-server-cloudimg-amd64.qcow2"
        diskpool = "local-lvm"
        pool = "CloudFish"
    }
  }
  lxcs = {
    papeete = {
        vmid = 105 
        static_ip = "192.168.50.64"
        cores = 8
        memory = 16384
        disk =  50
        ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "nvme_pool"
        pool = "BluePolaris"
    }
    lapaz = {
        vmid = 106
        static_ip = "192.168.50.65"
        cores = 2
        memory = 2048
        disk = 10
        ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "local-lvm"
        pool = "BluePolaris"
    }
    nukuhiva = {
        vmid = 107
        static_ip = "192.168.50.66"
        cores = 2
        memory = 2048
        disk = 10
        ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "local-lvm"
        pool = "BluePolaris"
    }
    balboa = {
        vmid = 108
        static_ip = "192.168.50.67"
        cores = 2
        memory = 16384
        disk = 100
        ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "nvme_pool"
        pool = "BluePolaris"
    }
  }
}