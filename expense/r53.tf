resource "aws_route53_record" "terraform_route53" {
    count = length(local.instance_names)
    zone_id = "Z01089512XQ8J5XJOKNVR"
    name =  local.domain_name == "frontend" ? local.domain_name : "${local.instance_names[count.index]}.${local.domain_name}"
    type = "A"
    ttl = 1
    records = local.instance_names[count.index] == "frontend" ? [aws_instance.terraform[count.index].public_ip] :  [aws_instance.terraform[count.index].private_ip]
    allow_overwrite = true

}
