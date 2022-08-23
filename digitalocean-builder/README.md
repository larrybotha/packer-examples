# Packer example - Digitalocean builder

Build a Digitalocean server image using the [Digitalocean builder][external-do-builder].

Using this builder mitigates having to use a post-processor to upload the image to
Digitalocean.

## Instructions

### Build images / snapshots

1. install Packer on your machine
2. create an access token in Digitalocean, and set it in your environment
3. initialise Packer:
   ```bash
   $ packer init -var docean_api_token=$DO_ACCESS_TOKEN ./packer
   ```
4. run Packer
   ```bash
   $ packer build -var docean_api_token=$DO_ACCESS_TOKEN ./packer
   ```

### Provision droplets using the images

1. install Terraform on your machine
2. initialise terraform
   ```bash
   $ terraform -chdir=./terraform init
   ```
3. view the plan
   ```bash
   $ terraform -chdir=./terraform plan
   ```
4. apply the plan
   ```bash
   $ terraform -chdir=./terraform apply -var=docean_api_token=$DO_ACCESS_TOKEN
   ```
5. clean up
   ```bash
   $ terraform -chdir=./terraform destroy -var=docean_api_token=$DO_ACCESS_TOKEN
   ```

## Notes

- to use the snapshot with Terraform, the `digitalocean_image` data source needs
  to be used in order to dynamically get the droplet's ID in
  `digitalocean_droplet`

  See [./terraform/droplets.tf](./terraform/droplets.tf)

- if multiple snapshots with the same name are built, and that name is provided
  to `digitalocean_image`, Terraform will raise an error with the following
  message: `│ Error: too many images found with name [name] (found [x], expected 1)`
- every size required for provisioning instances in Terraform requires an
  explicit build in Packer

## Links and resources

- [Create image snapshots for Digitalocean using Packer][external-do-create-snapshots]
- [Create Digitalocean images using packer][external-do-images-with-packer]
- [Create 1-click images for Digitalocean with Packer][external-do-1-click-images]

<!-- LINKS -->

[external-do-builder]: https://www.packer.io/plugins/builders/digitalocean "Digitalocean builder"
[external-do-create-snapshots]: https://www.digitalocean.com/community/tutorials/how-to-create-digitalocean-snapshots-using-packer-on-ubuntu-16-04 "Create Digitalocean snapshots"
[external-do-1-click-images]: https://www.digitalocean.com/blog/using-packer-to-create-a-1-click-nkn-image-on-digitalocean "1-click images on Digitalocean"
[external-do-images-with-packer]: https://dev.to/corpcubite/automating-building-images-with-packer-in-digitalocean-56ip "Packer for creating Digitalocean images"
