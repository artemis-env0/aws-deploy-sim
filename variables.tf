variable "name" {
  type    = string
  default = "env0-acme-ec2"
}

variable "instance_type" {
  type    = string
  default = "t3a.small"
}

variable "az" {
  type    = string
  default = "us-west-2b"
}

variable "vpc_id" {
  type = string
}

variable "data_volume_size" {
  description = "Size of the additional EBS data volume in GiB."
  type        = number
  default     = 12
}
