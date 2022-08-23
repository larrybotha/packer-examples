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
  default     = "docker-20-04"
}

variable "region" {
  type        = string
  description = "Digitalocean region to build the image to"
  default     = "fra1"
}

variable "sizes" {
  type        = list(string)
  description = "Digitalocean sizes for built images"
  default = [
    "s-1vcpu-1gb",
    "s-1vcpu-1gb-amd",
  ]
}
