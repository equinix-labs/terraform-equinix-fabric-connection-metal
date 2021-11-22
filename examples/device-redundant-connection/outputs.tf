output "metal_connection_id" {
  description = "Metal connection identifier"
  value       = module.connection.equinix_metal_connection_uuid
}

output "metal_connection_status" {
  description = "Connection provisioning status"
  value       = module.connection.equinix_metal_connection_status
}

output "fabric_connection_id" {
  description = "Fabric connection identifier"
  value       = module.connection.equinix_fabric_connection_uuid
}

output "fabric_connection_status" {
  description = "Connection provisioning status"
  value       = module.connection.equinix_fabric_connection_status
}

output "fabric_secondary_connection_id" {
  description = "Secondary Fabric connection identifier"
  value       = module.connection.equinix_fabric_secondary_connection_uuid
}