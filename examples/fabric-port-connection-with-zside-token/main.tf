// Interacting with Equinix Metal requires an API auth token in addition to the Equinix API
// credentials. See provider docs for further details
// https://registry.terraform.io/providers/equinix/equinix/latest/docs
provider "equinix" {
  client_id     = var.equinix_provider_client_id
  client_secret = var.equinix_provider_client_secret
  auth_token    = var.equinix_provider_auth_token
}

locals {
  metro_code = "FR" // corresponds to Frankfurt
  // Optionally you can use the same name on both sides Equinix Fabric and Equinix Metal to easily
  // identify the connection
  connection_name = upper(format("EXAMPLE-%s-%s", local.metro_code, random_string.this.result))
}

# Create a new VLAN in Frankfurt
resource "equinix_metal_vlan" "example" {
  description = format("Example VLAN in %s", local.metro_code)
  metro       = local.metro_code
  project_id  = var.metal_project_id
}

module "equinix-fabric-connection-metal" {
  source = "equinix-labs/fabric-connection-metal/equinix"

  # required variables
  fabric_notification_users     = [ "example@equinix.com" ]
  fabric_destination_metro_code = local.metro_code

  metal_project_id = var.metal_project_id

  # optional variables
  fabric_speed           = 200
  fabric_connection_name = local.connection_name
  fabric_port_name       = var.fabric_port_name
  fabric_vlan_stag       = 1010

  metal_connection_name        = local.connection_name
  metal_connection_description = "My shared connection from an Equinix Fabric Port"
  metal_connection_vlans       = [equinix_metal_vlan.example.vxlan]

  service_token_automation_feature_preview = true
}

resource "random_string" "this" {
  length  = 3
  special = false
  upper   = false
}
