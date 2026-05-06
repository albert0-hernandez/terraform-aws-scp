
variable "organization_id" {
  type = string
}

variable "tag_policy_name" {
  type    = string
  default = "organization-tag-policies"
}


variable "compliance" {
  type = object({
    tags = object({
      entries         = map(list(string)),
      report_required = list(string)
    })
  })

  default = {
    tags = {
      entries = {
        "organization:unit"       = ["44Tech"],
        "organization:costcenter" = ["44Tech"]
        "project:name"            = ["aws-organization"]
        "project:environment"     = ["prd", "stg", "dev"]
        "terraform:state"         = []
        "terraform:url"           = []
      },
      report_required = ["ec2:ALL_SUPPORTED", "ecr:ALL_SUPPORTED", "rds:ALL_SUPPORTED", "s3:ALL_SUPPORTED"]
    }
  }
}
