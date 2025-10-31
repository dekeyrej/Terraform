locals {
  node = "iluvatar"
  vm_image_manifest = {
    centos_9_stream_qcow2 = {
      file_name = "centos-9-stream-generic-cloud.qcow2"
      url       = "https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2"
    }
    centos_10_stream_qcow2 = {
      file_name = "centos-10-stream-generic-cloud.qcow2"
      url       = "https://cloud.centos.org/centos/10-stream/x86_64/images/CentOS-Stream-GenericCloud-10-latest.x86_64.qcow2"
    }
    debian_12_bookworm_qcow2 = {
      file_name = "debian-12-generic-amd64.qcow2"
      url       = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
    }
    debian_13_trixie_qcow2 = {
      file_name = "debian-13-generic-amd64.qcow2"
      url       = "https://cloud.debian.org/images/cloud/trixie/latest/debian-13-generic-amd64.qcow2"
    }
    ubuntu_24_04_noble_qcow2 = {
      file_name = "ubuntu-24.04-server-cloudimg-amd64.qcow2"
      url       = "https://cloud-images.ubuntu.com/releases/noble/release/ubuntu-24.04-server-cloudimg-amd64.img"
    }
    ubuntu_25_04_plucky_qcow2 = {
      file_name = "ubuntu-25.04-server-cloudimg-amd64.qcow2"
      url       = "https://cloud-images.ubuntu.com/releases/plucky/release/ubuntu-25.04-server-cloudimg-amd64.img"
    }

  }
}