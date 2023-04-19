variable "region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "ec2_count" {
  type = number
  default = "Num of ec2 instances to create"
}