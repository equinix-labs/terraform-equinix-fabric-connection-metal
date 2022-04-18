variable "metal_project_name" {
  type        = string
  description = "Name of the project where the connection is scoped to, must be set for shared connection."
}

variable "fabric_port_name" {
  type        = string
  description = <<EOF
  Name of the [Equinix Fabric port](https://docs.equinix.com/en-us/Content/Interconnection/Fabric/ports/Fabric-port-details.htm)
  from which the connection would originate.
  EOF
}
