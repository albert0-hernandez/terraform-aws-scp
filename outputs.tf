# Tagging AWS Config Rule ID
output "tagging_aws_config_config_rule_id" { value = aws_config_config_rule.required_tags.id }

output "tagging_aws_organizations_policy_id" { value = aws_organizations_policy.tagging.id }
