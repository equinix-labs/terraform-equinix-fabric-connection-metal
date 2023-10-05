locals {
  metal_connection_name = coalesce(var.metal_connection_name, lower(format("shared-conn-%s-%s", var.fabric_destination_metro_code, random_string.this.result)))
  fabric_primary_name   = var.fabric_connection_name != "" ? var.fabric_connection_name : upper(format("METAL-%s-%s", var.fabric_destination_metro_code, random_string.this.result))
  fabric_secondary_name = var.fabric_secondary_connection_name != "" ? var.fabric_secondary_connection_name : format("%s-SEC", local.fabric_primary_name)
  network_edge_secondary_device_id = var.network_edge_secondary_device_id != "" ? var.network_edge_secondary_device_id : var.network_edge_device_id
}

data "equinix_metal_project" "this" {
  name       = var.metal_project_name == "" || var.metal_project_id != "" ? null : var.metal_project_name
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
  service_token_type = "z_side"
}

module "equinix-fabric-connection" {
  count   = var.redundancy_type == "REDUNDANT" ? 2 : 1
  source  = "equinix-labs/fabric-connection/equinix"
  version = "0.4.0"

  # required variables
  notification_users = var.fabric_notification_users

  # optional variables
  name = count.index == 0 ? local.fabric_primary_name : local.fabric_secondary_name

  network_edge_id           = count.index == 0 ? var.network_edge_device_id : local.network_edge_secondary_device_id
  network_edge_interface_id = count.index == 0 ? var.network_edge_device_interface_id : var.network_edge_secondary_device_interface_id

  port_name             = count.index == 0 ? var.fabric_port_name : var.fabric_secondary_port_name != "" ? var.fabric_secondary_port_name : var.fabric_port_name
  vlan_stag             = count.index == 0 ? var.fabric_vlan_stag : var.fabric_secondary_vlan_stag
  service_token_id      = count.index == 0 ? var.fabric_service_token_id : var.fabric_secondary_service_token_id
  speed                 = count.index == 0 ? var.fabric_speed : var.fabric_secondary_speed != 0 ? var.fabric_secondary_speed : var.fabric_speed
  speed_unit            = "MB"
  purchase_order_number = var.fabric_purchase_order_number

  zside_service_token_id = equinix_metal_connection.this.service_tokens[count.index].id
}
