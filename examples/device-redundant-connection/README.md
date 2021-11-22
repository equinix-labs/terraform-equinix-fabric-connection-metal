## Device Redundant Connection Example

This example demonstrates usage of the Equinix terraform-metal-shared-connection modul to create a redundant Equinix Fabric connection from a single Network Edge devie                               

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

