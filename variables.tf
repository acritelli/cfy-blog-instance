variable "instance_type" {
  type        = string
  description = "AWS instance type to deploy"
  default     = "t2.small"
}

variable "instance_name" {
  type        = string
  description = "EC2 instance name"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-west-2"

}

variable "ssh_keypair" {
  type        = string
  description = "SSH Keypair Name"
}

variable "aws_access_key" {
  type        = string
  description = "AWS Access Key ID"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Access Key"
}
