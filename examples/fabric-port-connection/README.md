# Equinix Fabric Port Connection Example

This example demonstrates usage of the Equinix Connection Metal module to establish a single Equinix Fabric L2 Connection from an Equinix Fabric Port to Equinix Metal. It will:

- Create a Metal shared non-redundant connection in Frankfurt.
- Create Equinix Fabric l2 connection in Frankfurt for 'Equinix Metal - Layer 2' service profile with 200Mbps bandwidth.

## Usage

To provision this example, you should clone the github repository and run terraform from within this directory:

```bash
git clone https://github.com/equinix-labs/terraform-equinix-fabric-connection-metal.git
cd terraform-equinix-fabric-connection-metal/examples/network-edge-device-redundant-connection
terraform init
terraform apply
```

Note that this example may create resources which cost money. Run 'terraform destroy' when you don't need these resources.

## Variables

See <https://registry.terraform.io/modules/equinix-labs/fabric-connection-metal/equinix/latest/examples/network-edge-device-redundant-connection?tab=inputs> for a description of all variables.

## Outputs

See <https://registry.terraform.io/modules/equinix-labs/fabric-connection-metal/equinix/latest/examples/network-edge-device-redundant-connection?tab=outputs> for a description of all outputs.
