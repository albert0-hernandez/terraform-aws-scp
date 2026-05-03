# ACCOUTN id
output "service_control_policies_name" { value = [ for k,v in aws_organizations_policy.this : k] }

# ACCOUTN id
output "service_control_policies_raw" { value = local._service_control_policies_raw }
