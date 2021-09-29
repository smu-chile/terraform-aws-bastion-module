locals {
    ingress_rules = var.ingress-cidr-ansible != "" ? [
    {
      rule        = "ssh-tcp"
      cidr_blocks = var.ingress-cidr
      description = "SSH from Allowed cidr"
    },
    {
      rule        = "ssh-tcp"
      cidr_blocks = var.ingress-cidr-ansible
      description = "SSH from Allowed cidr"
    },
    ] : [
    {
      rule        = "ssh-tcp"
      cidr_blocks = var.ingress-cidr
      description = "SSH from Allowed cidr"
    }
    ]

}

module "ssh_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.3.0"

  name        = "ssh-sg"
  description = "Security group which is to allow SSH from Bastion"
  vpc_id      = var.vpc-id

  ingress_with_cidr_blocks = locals.ingress_rules
  
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]

  tags = {
    "kubernetes.io/cluster/${var.name}" = "owned"
    Region                              = "${var.tag-region}"
    Country                             = "${var.country}"
    CECO                                = "${var.ceco}"
    Owner                               = "${var.owner}"
    Environment                         = "${var.environment}"
  }
}