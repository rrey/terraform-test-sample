## Requirements

| Name | Version |
|------|---------|
| azurerm | ~> 2.6 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 2.6 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| location | The resource group location | `string` | `"westeurope"` | no |
| rg\_name | The resource group name | `string` | n/a | yes |
| rg\_owner | The resource group owner | `string` | n/a | yes |
| rg\_tags | The resource group tags | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| rg | The resource group |

