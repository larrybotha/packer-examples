source "digitalocean" "image" {
  api_token = var.docean_api_token
  image = var.image
  region = var.region
  ssh_username=var.ssh_username
}

build {
  dynamic "source" {
    for_each = var.configs

    labels = ["digitalocean.image"]

    content {
      size = source.value.size
      droplet_name = "packer-build-image.${source.value.name}.{{timestamp}}"
      snapshot_name = "built-with-packer.${source.value.name}.${source.value.size}"
    }
  }
}
