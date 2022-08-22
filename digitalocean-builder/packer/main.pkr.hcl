packer {
  required_version = ">= 1.8.3, < 2.0.0"

  required_plugins {
    digitalocean = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/digitalocean"
    }
  }
}

source "digitalocean" "1vcpu-1gb" {
  image = var.image
  size = var.image
  region = var.region
  ssh_username=var.root
}
