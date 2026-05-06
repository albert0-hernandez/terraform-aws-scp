## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.15.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.43.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.43.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_config_config_rule.required_tags](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_organizations_policy.tagging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy_attachment.tagging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compliance"></a> [compliance](#input\_compliance) | n/a | <pre>object({<br/>    tags = object ({<br/>      entries = map(list(string)),<br/>      report_required = list(string)<br/>    })<br/>  })</pre> | <pre>{<br/>  "tags": {<br/>    "entries": {<br/>      "organization:costcenter": [<br/>        "44Tech"<br/>      ],<br/>      "organization:unit": [<br/>        "44Tech"<br/>      ],<br/>      "project:environment": [<br/>        "prd",<br/>        "stg",<br/>        "dev"<br/>      ],<br/>      "project:name": [<br/>        "aws-organization"<br/>      ],<br/>      "terraform:state": [],<br/>      "terraform:url": []<br/>    },<br/>    "report_required": [<br/>      "ec2:ALL_SUPPORTED",<br/>      "ecr:ALL_SUPPORTED",<br/>      "rds:ALL_SUPPORTED",<br/>      "s3:ALL_SUPPORTED"<br/>    ]<br/>  }<br/>}</pre> | no |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | n/a | `string` | n/a | yes |
| <a name="input_tag_policy_name"></a> [tag\_policy\_name](#input\_tag\_policy\_name) | n/a | `string` | `"organization-tag-policies"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tagging_aws_config_config_rule_id"></a> [tagging\_aws\_config\_config\_rule\_id](#output\_tagging\_aws\_config\_config\_rule\_id) | Tagging AWS Config Rule ID |
| <a name="output_tagging_aws_organizations_policy_id"></a> [tagging\_aws\_organizations\_policy\_id](#output\_tagging\_aws\_organizations\_policy\_id) | n/a |
