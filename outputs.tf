output "equinix_metal_connection_uuid" {
  description = "Unique identifier of the connection resource on Equinix Metal side."
  value       = metal_connection.this.id
}

output "equinix_metal_connection_status" {
  description = "Status of the connection resource."
  value       = metal_connection.this.status
}

output "equinix_metal_connection_ports" {
  description = "List of connection ports - primary (ports[0]) and secondary (ports[1]). Schema of port is described in documentation of the metal_connection datasource."
  value       = metal_connection.this.ports
}

output "equinix_fabric_connection_uuid" {
  description = "Unique identifier of the connection resource on Equinix Fabric side."
  value       = equinix_ecx_l2_connection.this.uuid
}

output "equinix_fabric_connection_status" {
  description = "Connection provisioning status on Equinix Fabric side."
  value       = equinix_ecx_l2_connection.this.status
}

output "equinix_fabric_secondary_connection_uuid" {
  description = "Unique identifier of the redundant connection, applicable for HA connections."
  value       = equinix_ecx_l2_connection.this.redundant_uuid
}