resource "openstack_networking_network_v2" "this" {
  name           = var.name
  description    = var.description
  tenant_id      = var.tenant_id
  admin_state_up = "true"
}
