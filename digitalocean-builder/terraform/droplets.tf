locals {
  droplet_configs = {
    for x in var.droplet_configs : join(
      ".",
      ["${x.image}.${x.size}", x.is_packer ? "packer" : "docean"]
      ) => merge(
      x, {
        name = x.is_packer ? "built-with-packer.${x.image}.${x.size}" : ""
        slug = x.is_packer ? "" : x.image
      }
    )
  }
}

data "digitalocean_image" "from_packer" {
  for_each = local.droplet_configs

  # build image from snapshot
  name = length(each.value.name) > 0 ? each.value.name : null
  # build image from official docker image
  slug = length(each.value.slug) > 0 ? each.value.slug : null
}


resource "digitalocean_droplet" "from_packer" {
  for_each = local.droplet_configs

  image     = data.digitalocean_image.from_packer[each.key].id
  name      = length(each.value.name) > 0 ? each.value.name : each.value.slug
  region    = each.value.region
  size      = each.value.size
  user_data = data.cloudinit_config.user_data.rendered
}
