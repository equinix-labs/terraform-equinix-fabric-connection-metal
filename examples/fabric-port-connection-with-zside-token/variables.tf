variable "equinix_provider_client_id" {
  type        = string
  description = "API Consumer Key available under 'My Apps' in developer portal. This argument can also be specified with the EQUINIX_API_CLIENTID shell environment variable."
  default     = null
}

variable "equinix_provider_client_secret" {
  type        = string
  description = "API Consumer secret available under 'My Apps' in developer portal. This argument can also be specified with the EQUINIX_API_CLIENTSECRET shell environment variable."
  default     = null
}

variable "equinix_provider_auth_token" {
  type        = string
  description = "This is your Equinix Metal API Auth token. This can also be specified with the METAL_AUTH_TOKEN environment variable."
  default     = null
}

variable "metal_project_id" {
  type        = string
  description = "ID of the metal project where the connection is scoped to."
}

variable "fabric_port_name" {
  type        = string
  description = <<EOF
  Name of the [Equinix Fabric port](https://docs.equinix.com/en-us/Content/Interconnection/Fabric/ports/Fabric-port-details.htm)
  from which the connection would originate.
  EOF
}
