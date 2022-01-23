output "id" {
  value       = openstack_networking_network_v2.this.id
  description = "Network ID"
  sensitive   = false
}
