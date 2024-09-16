# variable "instance_type" {
#   type    = string
#   default = "t3.micro"
# }

# variable "environment" {
#   type    = string
#   default = "prod"
# }

# variable instance_names {
#     type = list(string)
#     default = ["mysql","backend","frontend"]
# }

# variable domain_name {
#     type = string
#     default = "reyanshsai.online"
# }

locals {
    instance_names = ["mysql","backend","frontend"]
    environment = "prod"
    instance_type = "t3.micro"
    domain_name = "reyanshsai.online"
}