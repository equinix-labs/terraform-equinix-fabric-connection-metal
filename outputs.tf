output "fabric_connection_primary_uuid" {
  description = "Unique identifier of the connection."
  value       = module.equinix-fabric-connection.primary_connection.uuid
}

output "fabric_connection_primary_name" {
  description = "Name of the connection."
  value       = module.equinix-fabric-connection.primary_connection.name
}

output "fabric_connection_primary_status" {
  description = "Connection provisioning status."
  value       = module.equinix-fabric-connection.primary_connection.status
}

output "fabric_connection_primary_provider_status" {
  description = "Connection provisioning provider status."
  value       = module.equinix-fabric-connection.primary_connection.provider_status
}

output "fabric_connection_primary_speed" {
  description = "Connection speed."
  value       = module.equinix-fabric-connection.primary_connection.speed
}

output "fabric_connection_primary_speed_unit" {
  description = "Connection speed unit."
  value       = module.equinix-fabric-connection.primary_connection.speed_unit
}

output "fabric_connection_primary_seller_metro" {
  description = "Connection seller metro code."
  value       = module.equinix-fabric-connection.primary_connection.seller_metro_code
}

output "fabric_connection_secondary_uuid" {
  description = "Unique identifier of the secondary connection."
  value       = module.equinix-fabric-connection.secondary_connection != null ? module.equinix-fabric-connection.secondary_connection.uuid : (
    var.service_token_automation_feature_preview && var.redundancy_type == "REDUNDANT") ? module.equinix-fabric-connection-sec.primary_connection.uuid : null
}

output "fabric_connection_secondary_name" {
  description = "Name of the secondary connection."
  value       = module.equinix-fabric-connection.secondary_connection != null ? module.equinix-fabric-connection.secondary_connection.name : (
    var.service_token_automation_feature_preview && var.redundancy_type == "REDUNDANT") ? module.equinix-fabric-connection-sec.primary_connection.name : null
}

output "fabric_connection_secondary_status" {
  description = "Secondary connection provisioning status."
  value       = module.equinix-fabric-connection.secondary_connection != null ? module.equinix-fabric-connection.secondary_connection.status : (
    var.service_token_automation_feature_preview && var.redundancy_type == "REDUNDANT") ? module.equinix-fabric-connection-sec.primary_connection.status : null
}

output "fabric_connection_secondary_provider_status" {
  description = "Secondary connection provisioning provider status."
  value       = module.equinix-fabric-connection.secondary_connection != null ? module.equinix-fabric-connection.secondary_connection.provider_status : (
    var.service_token_automation_feature_preview && var.redundancy_type == "REDUNDANT") ? module.equinix-fabric-connection-sec.primary_connection.provider_status : null
}

output "equinix_metal_connection_uuid" {
  description = "Unique identifier of the connection resource on Equinix Metal side."
  value       = equinix_metal_connection.this.id
}

output "equinix_metal_connection_status" {
  description = "Status of the connection resource."
  value       = equinix_metal_connection.this.status
}

output "equinix_metal_connection_ports" {
  description = <<EOF
  List of connection ports - primary (ports[0]) and secondary (ports[1]). Schema of port is
  described in documentation of the
  [equinix_metal_connection](https://registry.terraform.io/providers/equinix/equinix/latest/docs/data-sources/equinix_metal_connection)
  datasource.
  EOF
  value       = equinix_metal_connection.this.ports
}
