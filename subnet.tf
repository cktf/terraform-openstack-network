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
