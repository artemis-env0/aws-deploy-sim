########################################################################
# EC2 instance + volume
########################################################################

# Find Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

# VPC we’re targeting
data "aws_vpc" "selected" {
  id = var.vpc_id
}

# All subnets in that VPC (AWS provider v6-compatible data source)
data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

# Single EC2 instance (no module)
resource "aws_instance" "acme" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  # Just pick the first subnet in the VPC.
  # (If you want to constrain to public subnets, we can add a tag filter later.)
  subnet_id                   = data.aws_subnets.selected.ids[0]
  associate_public_ip_address = true

  # IMPORTANT: root volume size is now driven by var.data_volume_size
  root_block_device {
    volume_type           = var.data_volume_type
    volume_size           = var.data_volume_size 
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name      = var.name
    Terraform = "true"
    Owner     = "acme demo org"
    Test      = "new taga"
    Demo      = "May 20"
  }
}
