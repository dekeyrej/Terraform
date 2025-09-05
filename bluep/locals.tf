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
        pool = "BluePolaris"
    }
    thailand = {
        fqdn = "thailand.local"
        vmid = 201
        static_ip = "192.168.50.69"
        cores = 4
        memory = 16384
        disk =  50
        osimage = "local:import/plucky-server-cloudimg-amd64.qcow2"
        os = "ubuntu"
        diskpool = "nvme_pool"
        pool = "BluePolaris"
    }
    mexico = {
        fqdn = "mexico.local"
        vmid = 202
        static_ip = "192.168.50.70"
        cores = 4
        memory = 16384
        disk =  50
        osimage = "local:import/debian-12-genericcloud-amd64.qcow2"
        os = "debian"
        diskpool = "nvme_pool"
        pool = "BluePolaris"
    }
    panama = {
        fqdn = "panama.local"
        vmid = 210
        static_ip = "192.168.50.71"
        cores = 8
        memory = 16384
        disk =  50
        osimage = "local:import/debian-13-genericcloud-amd64.qcow2"
        os = "debian"
        diskpool = "local-lvm"
        pool = "CloudFish"
    }
  }
  lxcs = {
    papeete = {
        fqdn = "papeete.local"
        vmid = 105
        static_ip = "192.168.50.64"
        cores = 8
        memory = 16384
        disk =  50
        osimage = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "nvme_pool"
        pool = "BluePolaris"
    }
    lapaz = {
        fqdn = "lapaz.local"
        vmid = 106
        static_ip = "192.168.50.65"
        cores = 2
        memory = 2048
        disk = 10
        osimage = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "local-lvm"
        pool = "BluePolaris"
    }
    nukuhiva = {
        fqdn = "nukuhiva.local"
        vmid = 107
        static_ip = "192.168.50.66"
        cores = 2
        memory = 2048
        disk = 10
        osimage = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
        os = "debian"
        diskpool = "local-lvm"
        pool = "BluePolaris"
    }
    balboa = {
        fqdn = "balboa.local"
        vmid = 108
        static_ip = "192.168.50.67"
        cores = 2
        memory = 16384
        disk = 100
        osimage = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
        os = "debian"
        diskpool = "nvme_pool"
        pool = "BluePolaris"
    }
  }
}