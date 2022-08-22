variable "docean_api_token" {
  type        = string
  description = "Digitalocean access token"

  validation {
    condition     = length(var.docean_api_token) > 0
    error_message = "Digitalocean access token is required."
  }
}

variable "ssh_username" {
  type        = string
  description = "Digitalocean droplet SSH username"
  default     = "root"
}

variable "image" {
  type        = string
  description = "Digitalocean droplet image name to build images from"
  default     = "ubuntu-22-04-x64"
}

variable "region" {
  type        = string
  description = "Digitalocean region to build the image to"
  default     = "fra1"
}

variable "configs" {
  type = list(object({
    name = string
    size = string
  }))
  description = "Digitalocean configs for built images"
  default     = [
    { name = "micro", size = "s-1vcpu-512mb-10gb" },
    { name = "small", size = "s-1vcpu-1gb" }
  ]
}
