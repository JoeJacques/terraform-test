
variable "region" {
  type        = string
  default     = "eu-west-2"
  description = "The aws region to deploy to"
}
variable "instance_type" {
  type        = string
  description = "instance type to be used for instances"
  default     = "t2.micro"
}
variable "scriptLocation" {
  type        = string
  default     = "./modules/autoscaling/scripts"
  description = "The location of the userData folder"
}

variable "TechTest" { 
  type    = string 
  default = "tech-test"
}