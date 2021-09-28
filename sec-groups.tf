module "ssh_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.3.0"

  name        = "ssh-sg"
  description = "Security group which is to allow SSH from Bastion"
  vpc_id      = var.vpc-id

  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = data.github_ip_ranges.test.actions_ipv4
    },
    {
      rule        = "ssh-tcp"
      cidr_blocks = "186.148.38.0/25,190.98.247.64/26"
    },
  ]
  
  tags = {
    "kubernetes.io/cluster/${var.name}" = "owned"
    Region                              = "${var.tag-region}"
    Country                             = "${var.country}"
    CECO                                = "${var.ceco}"
    Owner                               = "${var.owner}"
    Environment                         = "${var.environment}"
  }
}