module "ssh_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.0.1"

  name        = "ssh-sg"
  description = "Security group which is to allow SSH from Bastion"
  vpc_id      = var.vpc-id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]

  tags = {
    "kubernetes.io/cluster/${var.name}"         = "owned"
    Region                                      = "${var.tag-region}"
    Country                                     = "${var.country}"
    CECO                                        = "${var.ceco}"
    Owner                                       = "${var.owner}"
    Environment                                 = "${var.environment}"
  }
}