variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "my_ip" {
  description = "Your public IP in CIDR format (for SSH access)"
  type        = string
}

variable "public_key_path" {
  description = "Path to your SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
