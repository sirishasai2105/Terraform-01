resource "aws_route53_record" "r53" {
    for_each = aws_instance.servers
    zone_id = "Z01089512XQ8J5XJOKNVR"
    name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
    ttl = 1
    type = "A"
    records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
    allow_overwrite = true
}