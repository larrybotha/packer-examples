variable "docean_api_token" {
  type        = string
  description = "Digitalocean access token"

  validation {
    condition     = length(var.docean_api_token) > 0
    error_message = "Digitalocean access token is required."
  }
}

variable "droplet" {
  type = object({
    name   = string
    count  = number
    image  = string
    region = string
    size   = string
  })

  default = {
    name   = "packer-example"
    count  = 1
    image  = "built-with-packer.small.s-1vcpu-1gb"
    region = "fra1"
    size   = "s-1vcpu-1gb"
  }
}

