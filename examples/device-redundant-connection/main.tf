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
  metal_project_name                    = var.metal_project_name
  metal_connection_name                 = "example-connection"
  metal_connection_metro                = "FR"
  fabric_connection_notification_users  = ["example@equinix.com"]
  
  # optional variables
  metal_connection_redundancy           = "redundant"
  fabric_connection_device_id           = var.fabric_device_id
}