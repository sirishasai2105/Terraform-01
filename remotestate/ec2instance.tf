resource "aws_security_group" "terraform" {
    name = "allow-sshh"
    description = "allow all traffic from port 22"
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        from_port           = 22
        to_port             = 22
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"]
        ipv6_cidr_blocks    = ["::/0"]
    }

    tags = {
        Name = "terraform_sg"
    }
}

resource "aws_instance" "terraform" {
    count = length(local.instance_names)
    ami = data.aws_ami.ami_info.id
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.terraform.id]
    tags = {
        Name = local.instance_names[count.index]
    }
}