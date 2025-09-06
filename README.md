# Terraform Modules

A modular, expressive infrastructure provisioning framework using Terraform/OpenTofu. Designed for automation, and seamless Ansible handoff.

## Structure

- `modules/`: Core provisioning logic
- `smalltest/`: Minimal working example of map-driven provisioning
- `iluvatar/`: Larger orchestration example for my mythic-themed homelab
- `bluep/`: Example similar in scope to iluvatar without the mythic host names 

## Getting Started

```bash
terraform init
terraform apply
```

Outputs are shaped for Ansible inventory generation via jq, with expressive tags to streamline further orchestration.

## Philosophy

Infrastructure as story. Every module, tag, and output is crafted with clarity, maintainability, and mythic esonance.

## License
MIT
