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
