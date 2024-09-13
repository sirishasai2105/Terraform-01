resource "aws_security_group" "allow_ssh_terraform" {
    name = var.name
    description = var.description
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        cidr_blocks      = var.egress_cidr
        ipv6_cidr_blocks = var.egress_ipv6_cidr
    }
    tags = var.tags
}

resource "aws_instance" "terraform"{
    count = length(var.instance_names)
    ami                    =  var.ami_id
    instance_type        =  var.environment == "prod" ? "t3.large" : "t3.small"
    vpc_security_group_ids =  [aws_security_group.allow_ssh_terraform.id]
    tags = {
        Name = var.instance_names[count.index]
    }
}