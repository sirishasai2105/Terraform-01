resource "aws_security_group" "terraform" {
    name = "security group of terraform"
    description = "This sg allows all traffic from port 22"
    egress {
        from_port      = 0
        to_port        = 0
        protocol       = "-1"
        cidr_blocks    = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    dynamic "ingress" {
        for_each = [22,80,8080]
        iterator = port
        content {

            from_port         = port.value
            to_port           = port.value
            protocol          = "tcp"
            cidr_blocks       = ["0.0.0.0/0"]
            ipv6_cidr_blocks  = ["::/0"]

        }

    }
    tags = {
        Name = "SG"
    }
}

resource "aws_instance" "terraform" {
    for_each = var.instances
    ami                    = data.aws_ami.ami_info.id
    vpc_security_group_ids  = [aws_security_group.terraform.id]
    instance_type          = each.value
    tags = {
        Name = each.key
    }

    provisioner "local-exec" {
        command = "echo ${self.public_ip} > publicip.txt"
    }

    connection {
        type = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.public_ip
    }
    provisioner "remote-exec" {
        inline = [
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }
}