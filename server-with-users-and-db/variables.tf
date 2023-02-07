variable "subnet_id" {
  type        = string
  default     = "subnet-04df4b51689d455c8"
  description = "It's the subnet id for the instance to live in, ya know what I mean? (us-east-1a)"
}

variable "vpc_security_group_ids" {
  type        = string
  default     = "sg-0c84f321c24c8747f"
  description = "It's the security group id for the instance to live in, ya know what I mean? (us-east-1a)"
}

variable "ami" {
  type        = string
  default     = "ami-0059b7cd9f67d8050"
  description = "It's the Amazon Linux 2 ami, ya know what I mean?"
}

variable "instance-type" {
  type        = string
  default     = "t2.micro"
  description = "It's the t2.micro instance time to save money, ya know what I mean?"
}

variable "aws-key-pair" {
  type        = string
  default     = "NGINX-KEY-PAIR"
  description = "It's the key pair t2.micro instance time to save money, ya know what I mean?"
}
