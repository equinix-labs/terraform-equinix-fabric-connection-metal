terraform {
  required_version = ">= 0.13"

  required_providers {
    metal = {
      source  = "equinix/metal"
      version = ">= 3.1.0"
    }
    equinix = {
      source  = "equinix/equinix"
      version = "1.1.0"
    }
  }
}