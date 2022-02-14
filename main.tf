terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.45.0"
    }
  }
}

data "openstack_networking_network_v2" "external" {
  name = var.external
}
