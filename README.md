<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_autoscaling"></a> [autoscaling](#module\_autoscaling) | ./modules/autoscaling | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |
| <a name="module_network_load"></a> [network\_load](#module\_network\_load) | ./modules/NLB | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_TechTest"></a> [TechTest](#input\_TechTest) | n/a | `string` | `"tech-test"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | instance type to be used for instances | `string` | `"t2.micro"` | no |
| <a name="input_region"></a> [region](#input\_region) | The aws region to deploy to | `string` | `"eu-west-2"` | no |
| <a name="input_scriptLocation"></a> [scriptLocation](#input\_scriptLocation) | The location of the userData folder | `string` | `"./modules/autoscaling/scripts"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->