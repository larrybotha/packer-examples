variable "docean_api_token" {
  type        = string
  description = "Digitalocean access token"

  validation {
    condition     = length(var.docean_api_token) > 0
    error_message = "Digitalocean access token is required."
  }
}

variable "droplet_configs" {
  type = list(object({
    image     = string
    region    = string
    size      = string
    is_packer = bool
  }))

  default = [
    {
      image     = "docker-20-04"
      region    = "fra1"
      size      = "s-1vcpu-1gb-amd"
      is_packer = false
    },
    {
      image     = "docker-20-04"
      region    = "fra1"
      size      = "s-1vcpu-1gb-amd"
      is_packer = true
    },
    {
      image     = "docker-20-04"
      region    = "fra1"
      size      = "s-1vcpu-1gb"
      is_packer = false
    },
    {
      image     = "docker-20-04"
      region    = "fra1"
      size      = "s-1vcpu-1gb"
      is_packer = true
    },
  ]
}

