locals {
  node = "iluvatar"
  protection = true
  gateway = "192.168.86.1"
  ssh_keys = [trimspace(data.local_file.ssh_public_key.content)]
  kvms = {
    aragorn = { 
        vmid = 200
        static_ip = "192.168.86.5"
        cores = 4
        memory = 16384
        disk =  50
        osimage = "local:import/noble-server-cloudimg-amd64.qcow2"
        diskpool = "nvme_pool"
        pool = "Lothlorien"
    }
    legolas = {
        vmid = 201
        static_ip = "192.168.86.6"
        cores = 4
        memory = 16384
        disk =  50
        osimage = "local:import/noble-server-cloudimg-amd64.qcow2"
        diskpool = "nvme_pool"
        pool = "Lothlorien"
    }
    gimli = {
        vmid = 202
        static_ip = "192.168.86.7"
        cores = 4
        memory = 16384
        disk =  50
        osimage = "local:import/noble-server-cloudimg-amd64.qcow2"
        diskpool = "nvme_pool"
        pool = "Lothlorien"
    }
    bombadil = { 
        vmid = 210
        static_ip = "192.168.86.14"
        cores = 8
        memory = 16384
        disk =  50
        osimage = "local:import/noble-server-cloudimg-amd64.qcow2"
        diskpool = "ssd_pool"
        pool = "Mirkwood"
    }
  }
  lxcs = {
    manwe = {
        vmid = 100 
        static_ip = "192.168.86.3"
        cores = 8
        memory = 16384
        disk =  50
        ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "nvme_pool"
        pool = "Lothlorien"
    }
    moria = {
        vmid = 101
        static_ip = "192.168.86.4"
        cores = 2
        memory = 2048
        disk = 10
        ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "ssd_pool"
        pool = "Lothlorien"
    }
    gandalf = {
        vmid = 102
        static_ip = "192.168.86.8"
        cores = 2
        memory = 2048
        disk = 10
        ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "ssd_pool"
        pool = "Lothlorien"
    }
    galadriel = {
        vmid = 103
        static_ip = "192.168.86.9"
        cores = 2
        memory = 16384
        disk = 100
        ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "nvme_pool"
        pool = "Lothlorien"
    }
  }
}