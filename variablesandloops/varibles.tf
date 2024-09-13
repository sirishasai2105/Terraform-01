variable name {
    default = "allow_all"
    type = string 
}

variable description {
    default = "allows all traffic from port 22"
    type = string
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

variable egress_cidr {
    type = list
    default = ["0.0.0.0/0"]
}

variable egress_ipv6_cidr {
    type = list
    default = ["::/0"]
}

variable tags {
    type = map
    default = {
        Name = "terraform"
    }
}

variable ami_id {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable instance_type {
    type = string
    default = "t3.micro"
}

variable environment {
    type = string
    default = "prod"
}

variable instance_names {
    type = list(string)
    default = ["mysql","backend","frontend"]
}