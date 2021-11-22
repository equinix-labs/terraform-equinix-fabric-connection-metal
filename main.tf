resource "metal_connection" "this" {
    name            = var.metal_connection_name
    organization_id = var.metal_organization_id
    project_id      = var.metal_project_id
    metro           = var.metal_connection_metro
    redundancy      = var.metal_connection_redundancy
    type            = "shared"
    description     = var.metal_connection_description
    tags            = var.metal_connection_tags
}

data "equinix_ecx_l2_sellerprofile" "this" {
    name = var.metal_connection_redundancy == "primary" ? "Equinix Metal - Layer 2" : "Equinix Metal - Layer 2 - Redundant"
}

data "equinix_ecx_port" "primary" {
    count   = coalesce(var.fabric_connection_port_name, false) ? 1 : 0
    name    = var.fabric_connection_port_name
}

data "equinix_ecx_port" "secondary" {
    count   = coalesce(var.fabric_secondary_connection_port_name, false) ? 1 : 0
    name    = var.fabric_secondary_connection_port_name
}

resource "equinix_ecx_l2_connection" "this" {
    name              = var.fabric_connection_name
    profile_uuid      = data.equinix_ecx_l2_sellerprofile.this.uuid
    speed             = var.fabric_connection_speed
    speed_unit        = var.fabric_connection_speed_unit
    notifications     = var.fabric_connection_notification_users
    device_uuid       = var.fabric_connection_device_id
    port_uuid         = var.fabric_connection_port_name != null ? data.equinix_ecx_port.primary[0].id : null
    vlan_stag         = var.fabric_connection_port_name != null ? var.fabric_connection_vlan_id : null
    seller_metro_code = var.metal_connection_metro
    authorization_key = metal_connection.this.token

    dynamic "secondary_connection" {
        for_each = var.metal_connection_redundancy == "redundant" ? [1] : []
        content {
            name        = "${var.fabric_connection_name}-sec"
            port_uuid   = var.fabric_secondary_connection_port_name != null ? data.equinix_ecx_port.secondary[0].id : null 
            vlan_stag   = var.fabric_secondary_connection_port_name != null ? var.fabric_secondary_connection_vlan_id : null
            device_uuid = var.fabric_secondary_connection_device_id
        }
    }
}
