# Fabric Service Token Redundant Connection Example

This example demonstrates usage of the Equinix Connection Metal to establish a redundant Equinix Fabric L2 Connection from another customer Equinix Fabric ports pair using two [A-Side Token](https://docs.equinix.com/en-us/Content/Interconnection/Fabric/service%20tokens/Fabric-Service-Tokens.htm) to Equinix Metal. It will:

- Create a Metal shared redundant connection in Dallas.
- Create Equinix Fabric l2 connection in Dallas for 'Equinix Metal - Layer 2 - Redundant' service profile with 100Mbps bandwidth.

## Usage

To provision this example, you should clone the github repository and run terraform from within this directory:

```bash
git clone https://github.com/equinix-labs/terraform-equinix-fabric-connection-metal.git
cd terraform-equinix-fabric-connection-metal/examples/service-token-redundant-connection
terraform init
terraform apply
```

Note that this example may create resources which cost money. Run 'terraform destroy' when you don't need these resources.

## Variables

See <https://registry.terraform.io/modules/equinix-labs/fabric-connection-metal/equinix/latest/examples/service-token-redundant-connection?tab=inputs> for a description of all variables.

## Outputs

See <https://registry.terraform.io/modules/equinix-labs/fabric-connection-metal/equinix/latest/examples/service-token-redundant-connection?tab=outputs> for a description of all outputs.
