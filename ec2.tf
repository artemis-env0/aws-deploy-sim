module "acme-ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name = var.name

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  # AZ is implied by these subnets; no availability_zone arg needed
  subnet_ids = data.aws_subnet_ids.selected.ids

  associate_public_ip_address = true

  # Make the ROOT disk use your desired size instead of default 8 GiB
  root_block_device = [
    {
      volume_type           = "gp3"
      volume_size           = var.data_volume_size
      delete_on_termination = true
      encrypted             = true
    }
  ]

  tags = {
    Terraform = "true"
    Owner     = "acme demo org"
    Test      = "new taga"
    Demo      = "May 20"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

data "aws_subnet_ids" "selected" {
  vpc_id = data.aws_vpc.selected.id
}

/* If you ONLY want the bigger root disk, remove or comment these out:

resource "aws_ebs_volume" "data" {
  size      = var.data_volume_size
  type      = "gp3"
  encrypted = true

  tags = {
    Name = "${var.name}-data"
  }
}

resource "aws_volume_attachment" "data" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.data.id
  instance_id = module.acme-ec2.id
}
*/
