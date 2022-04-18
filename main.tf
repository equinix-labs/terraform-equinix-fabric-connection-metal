locals {
  metal_connection_name = coalesce(var.metal_connection_name, lower(format("shared-conn-%s-%s", var.fabric_destination_metro_code, random_string.this.result)))
}

data "equinix_metal_project" "this" {
  name = var.metal_project_name
}

resource "random_string" "this" {
  length  = 3
  special = false
}

resource "equinix_metal_connection" "this" {
    name            = local.metal_connection_name
    organization_id = data.equinix_metal_project.this.organization_id
    project_id      = data.equinix_metal_project.this.project_id
    metro           = var.fabric_destination_metro_code
    redundancy      = var.redundancy_type == "SINGLE" ? "primary" : "redundant"
    type            = "shared"
    description     = var.metal_connection_description
    tags            = var.metal_connection_tags
}

module "equinix-fabric-connection" {
  source = "equinix-labs/fabric-connection/equinix"
  version = "0.1.1"

  # required variables
  notification_users = var.fabric_notification_users

  # optional variables
  name                      = var.fabric_connection_name
  network_edge_id           = var.network_edge_device_id
  network_edge_interface_id = var.network_edge_device_interface_id
  port_name                 = var.fabric_port_name
  vlan_stag                 = var.fabric_vlan_stag
  service_token_id          = var.fabric_service_token_id
  speed                     = var.fabric_speed
  purcharse_order_number    = var.fabric_purcharse_order_number

  seller_profile_name      = var.redundancy_type == "SINGLE" ? "Equinix Metal - Layer 2" : "Equinix Metal - Layer 2 - Redundant"
  seller_metro_code        = var.fabric_destination_metro_code
  seller_authorization_key = equinix_metal_connection.this.token

  redundancy_type                     = var.redundancy_type
  secondary_name                      = var.fabric_secondary_connection_name
  secondary_port_name                 = var.fabric_secondary_port_name
  secondary_vlan_stag                 = var.fabric_secondary_vlan_stag
  secondary_service_token_id          = var.fabric_secondary_service_token_id
  network_edge_secondary_id           = var.network_edge_secondary_device_id
  network_edge_secondary_interface_id = var.network_edge_secondary_device_interface_id
}
