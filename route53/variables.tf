variable name {
    type = string
    default = "terraform-user"
}

variable description {
    type = string
    default = "allow all traffic from port 22"
}

variable from_port {
    type = number
    default = 22
}

variable to_port {
    type = number
    default = 22
}

variable protocol {
    type = string
    default = "tcp"
}

variable cidr_blocks {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable ipv6_cidr_blocks {
    type = list(string)
    default = ["::/0"]
}

variable tags {
    type = map
    default = {
        Name = "terraform_sg_group"

    } 
}

variable ami {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable instance_names {
    default = ["mysql","backend","frontend"]
    type = list(string)
}

variable instance_type {
    type = string
    default = "t3.micro"
}

variable zone_id {
    default = "Z01089512XQ8J5XJOKNVR"
    type = string
}

variable domain_name {
    type = string
    default = "reyanshsai.online"
}