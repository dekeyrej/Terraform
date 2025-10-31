resource "proxmox_virtual_environment_download_file" "vm_images" {
  for_each          = local.vm_image_manifest
  content_type      = "import"
  datastore_id      = "local"
  file_name         = each.value.file_name
  node_name         = local.node
  url               = each.value.url
  upload_timeout    = 600
}
