<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.autoscaling_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_schedule.scaledown](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_schedule) | resource |
| [aws_autoscaling_schedule.scaleup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_schedule) | resource |
| [aws_launch_configuration.autoscaling_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration) | resource |
| [aws_ami.amazon-linux-2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_TechTest"></a> [TechTest](#input\_TechTest) | n/a | `string` | `"terraform-test"` | no |
| <a name="input_amiName"></a> [amiName](#input\_amiName) | The name of the ami to run on the instance | `string` | `"amzn2-ami-hvm*"` | no |
| <a name="input_amiOwner"></a> [amiOwner](#input\_amiOwner) | The Owner of the ami to run on the instance | `string` | `"amazon"` | no |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Should aws give the instance a public ip | `bool` | `true` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | The amount of instances to create | `number` | `2` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of instance | `string` | `"t2.micro"` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | n/a | `number` | `4` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | n/a | `number` | `1` | no |
| <a name="input_profile"></a> [profile](#input\_profile) | The Role of the instance to take | `string` | `null` | no |
| <a name="input_scale_down_cron"></a> [scale\_down\_cron](#input\_scale\_down\_cron) | n/a | `string` | `"0 08 * * *"` | no |
| <a name="input_scale_up_cron"></a> [scale\_up\_cron](#input\_scale\_up\_cron) | n/a | `string` | `"0 18 * * *"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | An array of security groups for the instance | `list(string)` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The id of the subnet | `list(string)` | n/a | yes |
| <a name="input_target_group_arns"></a> [target\_group\_arns](#input\_target\_group\_arns) | n/a | `list(string)` | n/a | yes |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | n/a | `string` | `"CET"` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Custom user data to run on first start | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->