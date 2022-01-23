data "openstack_networking_network_v2" "external" {
  name = var.external
}

resource "openstack_networking_network_v2" "this" {
  name           = var.name
  description    = var.description
  tenant_id      = var.tenant_id
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "this" {
  for_each = { for idx, val in var.subnets : idx => val }

  name            = each.key
  description     = "Subnet ${each.key}"
  tenant_id       = var.tenant_id
  network_id      = openstack_networking_network_v2.this.id
  dns_nameservers = ["8.8.8.8", "8.8.4.4"]
  cidr            = each.value
  ip_version      = 4
}

resource "openstack_networking_router_v2" "this" {
  name                = var.name
  description         = "${var.description} Router"
  tenant_id           = var.tenant_id
  external_network_id = data.openstack_networking_network_v2.external.id
}

resource "openstack_networking_router_interface_v2" "this" {
  for_each = { for idx, val in var.subnets : idx => val }

  router_id = openstack_networking_router_v2.this.id
  subnet_id = openstack_networking_subnet_v2.this[each.key].id
}
