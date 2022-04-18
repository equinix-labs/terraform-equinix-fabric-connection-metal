// Interacting with Equinix Metal requires an API auth token in addition to the Equinix API
// credentials. See provider docs for further details
// https://registry.terraform.io/providers/equinix/equinix/latest/docs
provider "equinix" {}

module "equinix-fabric-connection-metal" {
  source = "github.com/equinix-labs/terraform-equinix-fabric-connection-metal"
  
  # required variables
  fabric_notification_users     = ["example@equinix.com"]
  fabric_destination_metro_code = "SV" // corresponds to Silicon Valley

  metal_project_name = var.metal_project_name

  # optional variables
  redundancy_type  = "REDUNDANT"

  fabric_speed                      = 100
  fabric_service_token_id           = var.fabric_service_token_id
  fabric_secondary_service_token_id = var.fabric_secondary_service_token_id

  metal_connection_name = "example-sv-token"
}
