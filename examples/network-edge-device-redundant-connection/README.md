# Network Edge Device Redundant Connection Example

This example demonstrates usage of the Equinix Connection Metal module to establish a redundant Equinix Fabric L2 Connection from two Equinix Network Edge devices to Equinix Metal. It will:

- Request an Equinix Metal shared redundant connection in Dallas.
- Request an Equinix Fabric l2 connection in Dallas for 'Equinix Metal - Layer 2 - Redundant' service profile with 50Mbps bandwidth (default if not specified).

After apply the connection status will remain in pending approval. This process can take up to 24 hours.

```html
                                  ┌─────────────────┐
                                  │                 │
                                  │  Equinix Metal  │
                                  │  (SV)           │
                                  │                 │
                                  └─────────────────┘
                                           ▲
┌────────────────┐     Speed 50 Mpbs       │
│                ├─────────────────────────┘
│  Network Edge  │
│  Device        │     Speed 50 Mpbs
│  (DA)          ├─────────────────────────┐
└────────────────┘                         │
                                           ▼
                                  ┌─────────────────┐
                                  │                 │
                                  │  Equinix Metal  │
                                  │  (SV)           │
                                  │                 │
                                  └─────────────────┘
```

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
