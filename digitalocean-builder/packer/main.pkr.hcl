packer {
  required_version = ">= 1.8.3, < 2.0.0"

  required_plugins {
    digitalocean = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/digitalocean"
    }
  }
}
