variable "TechTest" {
    default = "tech-test"
}
variable "vpc_id" { 
    type = string
    description = "The ID of the VPC which will be used"
}
variable "type" {
    type = string
    default = "network"
    description = "The Type of load balancer which will be used."
}
variable "subnet_id" {
    type = list(string)
    description = "Subnet(s) which the network load balancer will use."
}

variable "port" {
    type = number 
    default = 31555
}