variable "name" {
  type    = string
  default = "env0-acme-simetra-ec2"
}

variable "instance_type" {
  type    = string
  default = "t3a.Large"
}

# No longer used directly, but safe to keep if env0 expects it.
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
