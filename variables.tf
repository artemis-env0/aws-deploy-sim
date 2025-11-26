variable "name" {
  type    = string
  default = "env0-acme-simetra-ec2"
}

variable "instance_type" {
  type    = string
  default = "t3a.large"
}

variable "data_volume_type" {
  type    = string
  default = "gp3"
}

variable "az" {
  type    = string
  default = "us-west-2a"
}

variable "vpc_id" {
  type = string
}

variable "data_volume_size" {
  description = "Size of the root EBS volume in GiB."
  type        = number
  default     = 14
}
