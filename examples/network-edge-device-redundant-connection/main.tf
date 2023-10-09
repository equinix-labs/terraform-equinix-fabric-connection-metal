// Interacting with Equinix Metal requires an API auth token in addition to the Equinix API
// credentials. See provider docs for further details
// https://registry.terraform.io/providers/equinix/equinix/latest/docs
provider "equinix" {}

module "equinix-fabric-connection-metal" {
  source = "equinix-labs/fabric-connection-metal/equinix"

  # required variables
  fabric_notification_users     = ["example@equinix.com"]
  fabric_destination_metro_code = "DA" // corresponds to Dallas
  metal_project_name            = var.metal_project_name

  # optional variables
  redundancy_type                  = "REDUNDANT"
  network_edge_device_id           = var.primary_device_id
  network_edge_secondary_device_id = var.secondary_device_id
}
