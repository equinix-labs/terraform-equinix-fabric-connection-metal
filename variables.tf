variable "fabric_notification_users" {
  type        = list(string)
  description = "A list of email addresses used for sending connection update notifications."

  validation {
    condition     = length(var.fabric_notification_users) > 0
    error_message = "Notification list cannot be empty."
  }
}

variable "fabric_connection_name" {
  type        = string
  description = "Name of the connection resource that will be created. It will be auto-generated if not specified."
  default     = ""
}

variable "fabric_destination_metro_code" {
  type        = string
  description = "Destination Metro code where the connection will be created."

  validation {
    condition     = can(regex("^[A-Z]{2}$", var.fabric_destination_metro_code))
    error_message = "Valid metro code consits of two capital leters, i.e. 'FR', 'SV', 'DC'."
  }
}

variable "network_edge_device_id" {
  type        = string
  description = "Unique identifier of the Network Edge virtual device from which the connection would originate."
  default     = ""
}

variable "network_edge_device_interface_id" {
  type        = number
  description = <<EOF
  Applicable with 'network_edge_device_id', identifier of network interface on a given device, used for a connection.
  If unspecified, then first available interface will be selected.
  EOF
  default     = 0
}

variable "fabric_port_name" {
  type        = string
  description = <<EOF
  Name of the buyer's port from which the connection would originate. One of 'fabric_port_name',
  'network_edge_device_id' or 'fabric_service_token_id' is required.
  EOF
  default     = ""
}

variable "fabric_vlan_stag" {
  type        = number
  description = <<EOF
  S-Tag/Outer-Tag of the primary connection - a numeric character ranging from 2 - 4094. Required if 'port_name' is
  specified.
  EOF
  default     = 0
}

variable "fabric_service_token_id" {
  type        = string
  description = <<EOF
  Unique Equinix Fabric key shared with you by a provider that grants you authorization to use their interconnection
  asset from which the connection would originate.
  EOF
  default     = ""
}

variable "fabric_speed" {
  type        = number
  description = <<EOF
  Speed/Bandwidth in Mbps to be allocated to the connection. If unspecified, it will be used the minimum
  bandwidth available for the `Equinix Metal` service profile.
  EOF
  default     = 50
  validation {
    condition     = contains([50, 100, 200, 500, 1000, 2000, 5000, 10000], var.fabric_speed)
    error_message = "Valid values are (50, 100, 200, 500, 1000, 2000, 5000, 10000)."
  }
}

variable "fabric_purchase_order_number" {
  type        = string
  description = "Connection's purchase order number to reflect on the invoice."
  default     = ""
}

variable "fabric_secondary_connection_name" {
  type        = string
  description = "Name of the secondary connection that will be created. It will be auto-generated if not specified."
  default     = ""
}

variable "fabric_secondary_port_name" {
  type        = string
  description = <<EOF
  Name of the buyer's port from which the secondary connection would originate. If unspecified, and
  'fabric_port_name', is specified, both primary and secondary connection will use 'fabric_port_name'.
  EOF
  default     = ""
}

variable "fabric_secondary_vlan_stag" {
  type        = number
  description = <<EOF
  S-Tag/Outer-Tag of the secondary connection. A numeric character ranging from 2 - 4094. Required if
  'fabric_secondary_port_name' is set. 
  EOF
  default     = 0
}


variable "fabric_secondary_service_token_id" {
  type        = string
  description = <<EOF
  Unique Equinix Fabric key shared with you by a provider that grants you authorization to use their interconnection
  asset from which the secondary connection would originate.
  EOF
  default     = ""
}

variable "network_edge_secondary_device_id" {
  type        = string
  description = <<EOF
  Unique identifier of the secondary Network Edge virtual device from which the connection would originate. If not
  specified, and 'network_edge_device_id' is specified, and 'redundancy_type' is set to 'REDUNDANT' then primary edge
  device will be used.
  EOF
  default     = ""
}

variable "network_edge_secondary_device_interface_id" {
  type        = number
  description = <<EOF
  Applicable with 'network_edge_device_id' or 'network_edge_secondary_device_id', identifier of network interface on a
  given device, used for a connection. If unspecified, then first available interface will be selected.
  EOF
  default     = 0
}

variable "redundancy_type" {
  type        = string
  description = "Whether to create a 'SINGLE' connection or 'REDUNDANT'."
  default     = "SINGLE"

  validation {
    condition     = contains(["SINGLE", "REDUNDANT"], var.redundancy_type)
    error_message = "Valid values for 'redundancy_type' are (SINGLE, REDUNDANT)."
  }
}

variable "metal_project_name" {
  type        = string
  description = "Name of the project where the connection is scoped to."
}

variable "metal_connection_name" {
  type        = string
  description = "Name of the connection resource that will be created. It will be auto-generated if not specified."
  default     = ""
}

variable "metal_connection_description" {
  type        = string
  description = "Description for the connection resource."
  default     = ""
}

variable "metal_connection_tags" {
  type        = list(string)
  description = "String list of tags for the connection resource."
  default     = ["terraform"]
}

variable "metal_connection_vlans" {
  type        = list(number)
  description = "Pass one vlan for Primary/Single connection and two vlans for Redundant connection."
  default     = null
}
