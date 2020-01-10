provider "openstack" {
  user_name   = "${var.user_name}"
  password    = "${var.password}"
  tenant_name = "${var.tenant_name}"
  auth_url    = "${var.auth_url}"
}
 
resource "openstack_compute_keypair_v2" "keypair" {
  name       = "${var.name}"
  public_key = "${var.public_key}"
}
 
resource "openstack_compute_instance_v2" "${var.name}" {
  name        = "${var.name}" 
  image_name  = "${var.image_name}"
  flavor_name = "${var.flavor_name}"
  key_pair    = "terraform-keypair"
 
  security_groups = [
    "gncs-ipv4-ssh",
    "gncs-ipv4-web",
  ]
 
  metadata = {
    instance_name_tag = "${var.name}"
  }
}
