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