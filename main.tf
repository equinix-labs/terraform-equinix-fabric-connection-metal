locals {
  metal_connection_name = coalesce(var.metal_connection_name, lower(format("shared-conn-%s-%s", var.fabric_destination_metro_code, random_string.this.result)))
  fabric_primary_name   = var.fabric_connection_name != "" ? var.fabric_connection_name : upper(format("METAL-%s-%s", var.fabric_destination_metro_code, random_string.this.result))
}

data "equinix_metal_project" "this" {
  name = var.metal_project_name == "" || var.metal_project_id != "" ? null : var.metal_project_name
  project_id = var.metal_project_id == "" ? null : var.metal_project_id
}

resource "random_string" "this" {
  length  = 3
  special = false
}

resource "equinix_metal_connection" "this" {
  name               = local.metal_connection_name
  project_id         = data.equinix_metal_project.this.project_id
  metro              = var.fabric_destination_metro_code
  redundancy         = var.redundancy_type == "SINGLE" ? "primary" : "redundant"
  type               = "shared"
  description        = var.metal_connection_description
  tags               = var.metal_connection_tags
  speed              = format("%dMbps", var.fabric_speed)
  vlans              = var.metal_connection_vlans
  service_token_type = var.service_token_automation_feature_preview ? "z_side" : null
}

module "equinix-fabric-connection" {
  source  = "equinix-labs/fabric-connection/equinix"
  version = "0.3.1"

  # required variables
  notification_users = var.fabric_notification_users

  # optional variables
  name                      = local.fabric_primary_name
  network_edge_id           = var.network_edge_device_id
  network_edge_interface_id = var.network_edge_device_interface_id
  port_name                 = var.fabric_port_name
  vlan_stag                 = var.fabric_vlan_stag
  service_token_id          = var.fabric_service_token_id
  speed                     = var.fabric_speed
  speed_unit                = "MB"
  purchase_order_number     = var.fabric_purchase_order_number

  zside_service_token_id   = var.service_token_automation_feature_preview ? equinix_metal_connection.this.service_tokens.0.id : null
  seller_profile_name      = var.service_token_automation_feature_preview ? "" : var.redundancy_type == "SINGLE" ? "Equinix Metal - Layer 2" : "Equinix Metal - Layer 2 - Redundant"
  seller_authorization_key = var.service_token_automation_feature_preview ? "" : equinix_metal_connection.this.token
  seller_metro_code        = var.service_token_automation_feature_preview ? "" : var.fabric_destination_metro_code

  redundancy_type                     = var.service_token_automation_feature_preview ? "SINGLE" : var.redundancy_type
  secondary_name                      = var.service_token_automation_feature_preview ? "" : var.fabric_secondary_connection_name
  secondary_port_name                 = var.service_token_automation_feature_preview ? "" : var.fabric_secondary_port_name
  secondary_vlan_stag                 = var.service_token_automation_feature_preview ? 0 : var.fabric_secondary_vlan_stag
  secondary_service_token_id          = var.service_token_automation_feature_preview ? "" : var.fabric_secondary_service_token_id
  network_edge_secondary_id           = var.service_token_automation_feature_preview ? "" : var.network_edge_secondary_device_id
  network_edge_secondary_interface_id = var.service_token_automation_feature_preview ? 0 : var.network_edge_secondary_device_interface_id
}

module "equinix-fabric-connection-sec" {
  count = var.service_token_automation_feature_preview && var.redundancy_type == "REDUNDANT" ? 1: 0
  source  = "equinix-labs/fabric-connection/equinix"
  version = "0.3.1"

  # required variables
  notification_users = var.fabric_notification_users

  # optional variables
  name                      = var.fabric_secondary_connection_name != "" ? var.fabric_secondary_connection_name : format("%s-SEC", local.fabric_primary_name)
  port_name                 = var.fabric_secondary_port_name != "" ? var.fabric_secondary_port_name : var.fabric_port_name
  vlan_stag                 = var.fabric_secondary_vlan_stag
  speed                     = var.fabric_speed
  speed_unit                = "MB"
  purchase_order_number     = var.fabric_purchase_order_number

  zside_service_token_id = equinix_metal_connection.this.service_tokens.1.id

  redundancy_type = "SINGLE"
}
