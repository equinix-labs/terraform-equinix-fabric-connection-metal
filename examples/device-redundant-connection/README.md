## Device Redundant Connection Example

This example demonstrates usage of the Equinix terraform-metal-shared-connection module to create a redundant Equinix Fabric connection to interconnect your Equinix Metal resources in Silicon Valley to a single Network Edge device located in Dallas                               

```
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

```
terraform init
terraform apply
```

