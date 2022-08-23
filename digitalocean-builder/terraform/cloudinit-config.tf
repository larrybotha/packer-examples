data "cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "my-cloud-init.yml"
    merge_type   = "list(append)+dict(no_replace,recurse_list)+str()"
    content_type = "text/cloud-config"
    content      = file("user-data.yml")
  }
}
