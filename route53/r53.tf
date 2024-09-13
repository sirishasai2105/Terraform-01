resource "aws_route53_record" "terraform_route53" {
    count = length(var.instance_names)
    zone_id = var.zone_id
    name = "${var.instance_names[count.index]}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [aws_instance.terraform[count.index].private_ip]
    allow_overwrite = true

}

# resource "aws_route53_record" "terraform_r53" {
#   count = length(var.instance_names)
#   zone_id = var.zone_id
#   #backend.daws81s.online
#   name    = "${var.instance_names[count.index]}.${var.domain_name}"
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.terraform[count.index].private_ip]
#   allow_overwrite = true
# }