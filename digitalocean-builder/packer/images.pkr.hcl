source "digitalocean" "image" {
  api_token    = var.docean_api_token
  image        = var.image
  region       = var.region
  ssh_username = var.ssh_username
}

build {
  dynamic "source" {
    for_each = var.sizes

    labels = ["digitalocean.image"]

    content {
      droplet_name  = "packer-build-image.${var.image}.${source.value}.{{timestamp}}"
      size          = source.value
      snapshot_name = "built-with-packer.${var.image}.${source.value}"
    }
  }
}
