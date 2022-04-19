// Interacting with Equinix Metal requires an API auth token in addition to the Equinix API
// credentials. See provider docs for further details
// https://registry.terraform.io/providers/equinix/equinix/latest/docs
provider "equinix" {} 

module "equinix-fabric-connection-metal" {
  source  = "equinix-labs/fabric-connection-metal/equinix"

  # required variables
  fabric_notification_users     = ["example@equinix.com"]
  fabric_destination_metro_code = "FR" // corresponds to Frankfurt

  metal_project_name = var.metal_project_name

  # optional variables
  fabric_speed           = 200
  fabric_connection_name = local.connection_name
  fabric_port_name       = var.fabric_port_name
  fabric_vlan_stag       = 1010

  metal_connection_name        = local.connection_name
  metal_connection_description = "My shared connection from an Equinix Fabric Port"
}

locals {
  // Optionally you can use the same name on both sides Equinix Fabric and Equinix Metal to easily
  // identify the connection
  connection_name = format("example-fr-%s", random_string.this.result)
}

resource "random_string" "this" {
  length  = 3
  special = false
  upper   = false
}
