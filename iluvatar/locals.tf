locals {
  node = "iluvatar"
  protection = true
  gateway = "192.168.86.1"
  ssh_keys = [trimspace(data.local_file.ssh_public_key.content)]
  kvms = {
    aragorn = {
        fqdn = "aragorn.local"
        vmid = 200
        static_ip = "192.168.86.5"
        cores = 4
        memory = 16384
        disk =  50
        osimage = "local:import/noble-server-cloudimg-amd64.qcow2"
        os = "ubuntu"
        diskpool = "nvme_pool"
        pool = "Lothlorien"
    }
    legolas = {
        fqdn = "legolas.local"
        vmid = 201
        static_ip = "192.168.86.6"
        cores = 4
        memory = 16384
        disk =  50
        osimage = "local:import/noble-server-cloudimg-amd64.qcow2"
        os = "ubuntu"
        diskpool = "nvme_pool"
        pool = "Lothlorien"
    }
    gimli = {
        fqdn = "gimli.local"
        vmid = 202
        static_ip = "192.168.86.7"
        cores = 4
        memory = 16384
        disk =  50
        osimage = "local:import/noble-server-cloudimg-amd64.qcow2"
        os = "ubuntu"
        diskpool = "nvme_pool"
        pool = "Lothlorien"
    }
    bombadil = {
        fqdn = "bombadil.local"
        vmid = 210
        static_ip = "192.168.86.14"
        cores = 8
        memory = 16384
        disk =  50
        osimage = "local:import/noble-server-cloudimg-amd64.qcow2"
        os = "ubuntu"
        diskpool = "ssd_pool"
        pool = "Mirkwood"
    }
  }
  lxcs = {
    manwe = {
        fqdn = "manwe.local"
        vmid = 100
        static_ip = "192.168.86.3"
        cores = 8
        memory = 16384
        disk =  50
        osimage = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "nvme_pool"
        pool = "Lothlorien"
    }
    moria = {
        fqdn = "moria.local"
        vmid = 101
        static_ip = "192.168.86.4"
        cores = 2
        memory = 2048
        disk = 10
        osimage = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "ssd_pool"
        pool = "Lothlorien"
    }
    gandalf = {
        fqdn = "gandalf.local"
        vmid = 102
        static_ip = "192.168.86.8"
        cores = 2
        memory = 2048
        disk = 10
        osimage = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "ssd_pool"
        pool = "Lothlorien"
    }
    galadriel = {
        fqdn = "galadriel.local"
        vmid = 103
        static_ip = "192.168.86.9"
        cores = 2
        memory = 16384
        disk = 100
        osimage = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        os = "ubuntu"
        diskpool = "nvme_pool"
        pool = "Lothlorien"
    }
  }
}