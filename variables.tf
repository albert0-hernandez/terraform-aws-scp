

variable "aws_profile" { default = "eu-west-1" }
variable "aws_region" { default = "eu-west-1" }

variable "environment" { default = "development" }

variable "backend" {
  type = object({
    name = string
    lock = string
  })
}

variable "organization_id" {
  type = string
}


variable "compliance" {
  type = object({
    regions = object ({
      allowed = list(string),
      denied = list(string)
    })
    tags = list(string)
  })

  default = {
    regions = {
      allowed =  ["eu-west-1", "eu-west-2"]
      denied  =  ["us-west-2"]
    }
    tags = [
      "organization:unit",
      "organization:costcenter",
      "project:name",
      "project:environment",
      "terraform:state",
      "terraform:url",
    ]
  }
}
