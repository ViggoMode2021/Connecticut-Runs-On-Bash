terraform {
  cloud {
    organization = "TerraformVig"

    workspaces {
      name = "provisioners"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

data "template_file" "imaging" {
  template = file("./imaging.yml")
}

resource "aws_instance" "ubuntu-server-with-docker-compose-and-postgres" {
  ami                         = var.ami
  instance_type               = var.instance-type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  associate_public_ip_address = true
  user_data                   = data.template_file.imaging.rendered

  tags = {
    Name = "ubuntu-server-with-docker-compose-and-postgres"
  }
}

output "instance_ip_addr" {
  value = join("", [aws_instance.ubuntu-server-with-docker-compose-and-postgres.public_ip, ":5432"])
}
