
locals {
  _compliance_base_path = "${path.module}/compliance"

  # Local YAML paths with configs of type map
  _service_control_policies_raw = flatten (
    [
        for f in fileset(local._compliance_base_path, "**/*yml") : { 
          for k, v in yamldecode(templatefile(format("%s/%s", local._compliance_base_path, f), var.compliance)) : k => v
        }
    ]
  )

  service_control_policies = merge ([ 
    for p in local._service_control_policies_raw: {
        for k in p: k.sid => k
  }]...)

}