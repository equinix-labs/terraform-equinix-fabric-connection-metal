variable "metal_organization_id" {
  type        = string
  description = "ID of the organization responsible for the connection."
}

variable "metal_project_id" {
  type        = string
  description = "ID of the project where the connection is scoped to, must be set for shared connection."
}

variable "metal_connection_name" {
  type        = string
  description = "Name of the connection resource."
}

variable "metal_connection_metro" {
  type        = string
  description = "Metro where the connection will be created."
  validation {
    condition     = can(regex("^[A-Z]{2}$", var.metal_connection_metro))
    error_message = "Valid metro code consits of two capital leters, i.e. SV, DC."
  }
}

variable "metal_connection_redundancy" {
  type        = string
  description = "Connection redundancy - redundant or primary."
  validation {
    condition     = contains(["primary", "redundant"], var.metal_connection_redundancy)
    error_message = "Argument 'metal_connection_redundancy' must one of 'primary', or 'redundant'."
  }
}

variable "metal_connection_description" {
  type        = string
  description = "Description for the connection resource."
  default     = null
}

variable "metal_connection_tags" {
  type        = list(string)
  description = "String list of tags for the connection resource."
  default     = ["terraformed"]
}

variable "fabric_connection_name" {
  type        = string
  description = "Connection name. An alpha-numeric 24 characters string which can include only hyphens and underscores."
}

variable "fabric_connection_speed" {
  type        = number
  description = "Speed/Bandwidth to be allocated to the connection - (MB or GB). "
}

variable "fabric_connection_speed_unit" {
  type        = string
  description = " Unit of the speed/bandwidth to be allocated to the connection."
}

variable "fabric_connection_notification_users" {
  type        = list(string)
  description = "A list of email addresses used for sending connection update notifications."
  validation {
    condition     = length(var.fabric_connection_notification_users) > 0
    error_message = "Notification list cannot be empty."
  }
}

variable "fabric_connection_device_id" {
  type        = string
  description = "(Required when fabric_connection_port_name is not set) Unique identifier of the Network Edge virtual device from which the connection would originate."
  default     = null
}

variable "fabric_connection_port_name" {
  type        = string
  description = "(Required when fabric_connection_device_id is not set) Name of the buyer's port from which the connection would originate."
  default     = null
}

variable "fabric_connection_vlan_id" {
  type        = string
  description = "(Required when fabric_connection_device_id is not set) S-Tag/Outer-Tag of the connection - a numeric character ranging from 2 - 4092."
  default     = null
  validation {
    condition = (
      var.fabric_connection_vlan_id == null ||      
     (coalesce(var.fabric_connection_vlan_id, 1) >= 2 && coalesce(var.fabric_connection_vlan_id, 4093) <= 4092)
    )
    error_message = "Argument 'fabric_connection_vlan_id' must be between 2 and 4092 seconds, inclusive."
  }
}

variable "fabric_secondary_connection_device_id" {
  type        = string
  description = "(Required when metal_connection_redundancy is 'redundant' and fabric_secondary_connection_port_name is not set) Unique identifier of the Network Edge virtual device from which the secondary connection would originate."
  default     = null
}

variable "fabric_secondary_connection_port_name" {
  type        = string
  description = "(Required when metal_connection_redundancy is 'redundant' and fabric_secondary_connection_device_id is not set) Name of the buyer's port from which the secondary connection would originate."
  default     = null
}

variable "fabric_secondary_connection_vlan_id" {
  type        = string
  description = "(Required when fabric_secondary_connection_device_id is not set) S-Tag/Outer-Tag of the connection - a numeric character ranging from 2 - 4092."
  default     = null
  validation {
    condition = (
      var.fabric_secondary_connection_vlan_id == null ||      
     (coalesce(var.fabric_secondary_connection_vlan_id, 1) >= 2 && coalesce(var.fabric_secondary_connection_vlan_id, 4093) <= 4092)
    )
    error_message = "Argument 'fabric_secondary_connection_vlan_id' must be between 2 and 4092 seconds, inclusive."
  }
}