## terraform-metal-shared-connection

[![Experimental](https://img.shields.io/badge/Stability-Experimental-red.svg)](https://github.com/equinix-labs/standards#about-uniform-standards)
[![terraform](https://github.com/equinix-labs/terraform-equinix-template/actions/workflows/integration.yaml/badge.svg)](https://github.com/equinix-labs/terraform-equinix-template/actions/workflows/integration.yaml)

`terraform-metal-shared-connection` is a minimal Terraform module that utilizes [Terraform providers for Equinix](https://registry.terraform.io/namespaces/equinix) to set up an Equinix Metal shared connection.

A part of Platform Equinix, your Equinix Metal™ infrastructure can connect with other parties, such as public cloud providers, network service providers, or your own colocation cages in Equinix by defining an [Equinix Fabric - software-defined interconnections](https://metal.equinix.com/developers/docs/equinix-interconnect/introduction/)

Setting Up a Shared Port requires requesting the connection on the Equinix Metal side, retrieving a token and using that token to request a connection on the Equinix Fabric side. This module is intended to abstract you from this process and handle the connection as a single resource.

```
  Origin                                             Destination
  (A-side)                                           (Z-side)

┌────────────────┐                                 ┌───────────────┐
│ Equinix Fabric │      Equinix Metal              │ Equinix Metal │
│ Port / Network ├───── Shared connection  ───────►│ Shared Port   │
│ Edge Device    │      (50 Mbps - 10 Gbps)        │               │
└────────────────┘                                 └───────────────┘
```

### Usage

This project is experimental and supported by the user community. Equinix does not provide support for this project.

Install Terraform using the official guides at <https://learn.hashicorp.com/tutorials/terraform/install-cli>.

This project may be forked, cloned, or downloaded and modified as needed as the base in your integrations and deployments.

This project may also be used as a [Terraform module](https://learn.hashicorp.com/collections/terraform/modules).

To use this module in a new project, create a file such as:

```hcl
# main.tf
terraform {
  required_providers {
    equinix = {
      source = "equinix/equinix"
    }
    metal = {
      source = "equinix/metal"
    }
}

module "example" {
  source = "github.com/equinix/terraform-metal-shared-connection"

  # TEMPLATE: insert required variables here
}
```

Run `terraform init -upgrade` and `terraform apply`.


#### Resources

| Name | Type |
| :-----: | :------: |
| [metal_connection.this](https://registry.terraform.io/providers/equinix/metal/latest/docs/resources/device) | resource |
| [equinix_ecx_l2_connection.this](https://registry.terraform.io/providers/equinix/equinix/latest/docs/resources/ecx_l2_connection) | resource |
| [equinix_ecx_l2_sellerprofile.this](https://registry.terraform.io/providers/equinix/equinix/latest/docs/data-sources/ecx_l2_sellerprofile) | data source |
| [equinix_ecx_port.primary](https://registry.terraform.io/providers/equinix/equinix/latest/docs/data-sources/ecx_port) | data source |
| [equinix_ecx_port.secondary](https://registry.terraform.io/providers/equinix/equinix/latest/docs/data-sources/ecx_port) | data source |

#### Variables

|     Variable Name      |  Type   |        Default Value        | Description                                             |
| :--------------------: | :-----: | :-------------------------: | :------------------------------------------------------ |
|                        |         |                             |                                                         |

TBD

<!-- TEMPLATE: If published, remove the table and use the following: See <https://registry.terraform.io/modules/equinix-labs/template/equinix/latest?tab=inputs> for a description of all variables. -->

#### Outputs

|     Variable Name      |  Type   | Description                                             |
| :--------------------: | :-----: | :------------------------------------------------------ |
|                        |         |                                                         |

TBD

<!-- TEMPLATE: If published, remove the table and use the following: See <https://registry.terraform.io/modules/equinix-labs/template/equinix/latest?tab=outputs> for a description of all outputs. -->

### Examples

- [examples/device-redundant-connection](examples/device-redundant-connection/)