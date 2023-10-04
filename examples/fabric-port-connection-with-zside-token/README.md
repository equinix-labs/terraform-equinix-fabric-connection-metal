# Equinix Fabric Port Connection With Z-Side Token Example

~> Equinix Metal connection with automated `z_side` service token is not generally available and may not be enabled yet for your organization.

~> To learn how to use Equinix metal `a_side` service token to connect to a cloud provider, take a look at metal service token examples included in [the various fabric modules to connect to cloud providers](https://registry.terraform.io/search/modules?namespace=equinix-labs&q=fabric-connection).

This example demonstrates the use of the Equinix Connection Metal module to establish a single Equinix Fabric L2 connection from an Equinix Fabric port to Equinix Metal using a Z-side token.
The main difference from the `Equinix Fabric Port connection` example is that with the Equinix Metal `z_side` service token the entire process is fully automated and the connection is provisioned in a matter of minutes. It will:

- Create a new Equinix Metal VLAN in Frankfurt.
- Request an Equinix Metal shared non-redundant connection in Frankfurt.
- Provision an Equinix Fabric l2 connection in Frankfurt for 'Equinix Metal - Layer 2' service profile with 200Mbps bandwidth.
- Attach the Equinix Metal VLAN to the Virtual Circuit created for the Equinix Metal connection.

## Usage

To provision this example, you should clone the github repository and run terraform from within this directory:

```bash
git clone https://github.com/equinix-labs/terraform-equinix-fabric-connection-metal.git
cd terraform-equinix-fabric-connection-metal/examples/fabric-port-connection-with-zside-token
terraform init
terraform apply
```

Note that this example may create resources which cost money. Run 'terraform destroy' when you don't need these resources.

## Variables

See <https://registry.terraform.io/modules/equinix-labs/fabric-connection-metal/equinix/latest/examples/fabric-port-connection-with-zside-token?tab=inputs> for a description of all variables.

## Outputs

See <https://registry.terraform.io/modules/equinix-labs/fabric-connection-metal/equinix/latest/examples/fabric-port-connection-with-zside-token?tab=outputs> for a description of all outputs.
