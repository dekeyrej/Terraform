terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.83.0"
    }
  }
}

provider "proxmox" {
  # Configuration options
  endpoint = var.virtual_environment_endpoint
  insecure = var.virtual_environment_insecure
  username = var.virtual_environment_username
  password = var.virtual_environment_password
}

variable "virtual_environment_endpoint" {
  description = "Proxmox API endpoint"
  type        = string
  default     = "https://proxmox.example.com:8006/"
}

variable "virtual_environment_insecure" {
  description = "Skip TLS verification"
  type        = bool
  default     = false
}

variable "virtual_environment_username" {
  description = "Proxmox username with realm"
  type        = string
  default     = "root@pam"
}

variable "virtual_environment_password" {
  description = "Proxmox password"
  type        = string
  default     = "your_password"
  sensitive   = true
}

