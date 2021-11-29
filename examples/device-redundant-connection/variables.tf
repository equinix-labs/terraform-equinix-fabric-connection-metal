variable "auth_token" {
  type = string
  description = "This is your Equinix Metal API Auth token."
}

variable "fabric_client_id" {
  type = string
  description = "API Consumer Key available under 'My Apps' in Equinix developer portal."
}

variable "fabric_client_secret" {
  type = string
  description = "API Consumer secret available under 'My Apps' in Equinix developer portal."
}

variable "metal_project_name" {
  type        = string
  description = "Name of the project where the connection is scoped to, must be set for shared connection."
}

variable "fabric_device_id" {
  type        = string
  description = "Unique identifier of the Network Edge virtual device from which the connection would originate."
}
