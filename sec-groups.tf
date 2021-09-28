module "ssh_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.3.0"

  name        = "ssh-sg"
  description = "Security group which is to allow SSH from Bastion"
  vpc_id      = var.vpc-id

  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = var.ingress-cidr
      description = "SSH from SMU"
    },
    {
      rule        = "ssh-tcp"
      cidr_blocks = join("," , data.github_ip_ranges.test.actions_ipv4)
      description = "SSH from Github Actions IPV4"
    },
        {
      rule        = "ssh-tcp"
      cidr_blocks = join("," , data.github_ip_ranges.test.actions_ipv6)
      description = "SSH from Github Actions IPV6"
    },
  ]

  egress_cidr_blocks      = ["0.0.0.0/0"]
  egress_rules            = ["any"]
  
  tags = {
    "kubernetes.io/cluster/${var.name}" = "owned"
    Region                              = "${var.tag-region}"
    Country                             = "${var.country}"
    CECO                                = "${var.ceco}"
    Owner                               = "${var.owner}"
    Environment                         = "${var.environment}"
  }
}