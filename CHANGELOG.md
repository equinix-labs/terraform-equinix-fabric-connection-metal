## 0.2.0 (July 20, 2022)

FEATURES:

- Added input variable `service_token_automation_feature_preview` to support feature preview for automated service token type `z_side`
- Added `speed` and `vlans` parameters to the `equinix_metal_connection` resource [#4](https://github.com/equinix-labs/terraform-equinix-fabric-connection-metal/pull/4)

BUG FIXES:

- typo `purchase_order` was `purcharse_order` 

NEW CONTRIBUTORS:

- @cprivitere made their first contribution in https://github.com/equinix-labs/terraform-equinix-fabric-connection-metal/pull/4
  
## 0.1.1 (April 19, 2022)

NOTES:

Modules in the examples folder now point to the registry path instead of the github repository.

## 0.1.0 (April 18, 2022)

NOTES:

Initial release.

FEATURES:

- Supported single connections from Equinix Fabric Port, Network Edge Device, Equinix Service Token
to service profiles `Equinix Metal - Layer 2` and `Equinix Metal - Layer 2 - Redundant`.
