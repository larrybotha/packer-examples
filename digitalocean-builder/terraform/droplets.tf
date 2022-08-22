data "digitalocean_image" "from_packer" {
  name = var.droplet.image
}

resource "digitalocean_droplet" "from_packer" {
  count  = var.droplet.count
  image  = data.digitalocean_image.from_packer.id
  name   = "${var.droplet.name}.${count.index}"
  region = var.droplet.region
  size   = var.droplet.size
}
