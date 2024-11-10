####### Module for add IP address from runnuer to security group to allow deployment_mode

variable "runner_ip" {
  type    = string
  default = "10.10.10.10/32"
}

variable "bastion_sg_id" {
  type    = string
  default = "sg-079e7e59f7d2effe3"
}

resource "aws_security_group_rule" "allow_runner_api" {
  type              = "ingress"
  from_port         = 6443
  to_port           = 6443
  protocol          = "tcp"
  cidr_blocks       = [var.runner_ip]
  security_group_id = var.bastion_sg_id

  # Set rule description to identify and target for deletion
  description = "Temporary kubectl API access for GitHub Runner"
}
