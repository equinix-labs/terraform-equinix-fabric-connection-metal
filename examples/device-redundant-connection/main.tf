terraform {
  required_providers {
    equinix = {
      source = "equinix/equinix"
    }
    metal = {
      source = "equinix/metal"
    }
  }
}

provider "metal" {
  auth_token = var.auth_token
}

provider "equinix" {
  client_id     = var.fabric_client_id
  client_secret = var.fabric_client_secret
}

################################################################################
# Equinix Metal Shared connection Module
################################################################################
module "connection" {
  source = "../../"

  # required variables
  metal_organization_id                 = var.metal_organization_id
  metal_project_id                      = var.metal_project_id
  metal_connection_name                 = "example-metal-conn-side"
  metal_connection_metro                = "SV"
  metal_connection_redundancy           = "redundant"
  fabric_connection_name                = "example-ef-conn-side"
  fabric_connection_speed               = 50
  fabric_connection_speed_unit          = "MB"
  fabric_connection_notification_users  = ["example@equinix.com"]
  
  # optional variables
  metal_connection_description          = "Example description"
  metal_connection_tags                 = ["terraformed"]
  fabric_connection_device_id           = var.fabric_device_id
  fabric_secondary_connection_device_id = var.fabric_device_id
}