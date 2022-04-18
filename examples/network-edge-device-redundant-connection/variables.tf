variable "metal_project_name" {
  type        = string
  description = "Name of the project where the connection is scoped to, must be set for shared connection."
}

variable "primary_device_id" {
  type = string
  description = <<EOF
  The ID of the (Network Edge virtual device](https://github.com/equinix/terraform-provider-equinix/tree/master/examples/edge-networking)
  from which the primary connection would originate.
  EOF
}

variable "secondary_device_id" {
  type = string
  description = <<EOF
  The ID of the (Network Edge virtual device](https://github.com/equinix/terraform-provider-equinix/tree/master/examples/edge-networking)
  from which the secondary connection would originate.
  EOF
}
