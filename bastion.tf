module "bastion-asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3.0"
  name    = "${var.name}-bastion"

  lc_name = "${var.name}-bastion-lc"

  image_id                     = var.image-id
  instance_type                = var.instance-type
  security_groups              = [module.ssh_sg.security_group_id]
  associate_public_ip_address  = true
  recreate_asg_when_lc_changes = true

  root_block_device = [
    {
      volume_size           = "10"
      volume_type           = "gp2"
      delete_on_termination = true
    },
  ]

  # Auto scaling group
  asg_name            = "${var.name}-bastion"
  vpc_zone_identifier = var.subnet-ids
  health_check_type   = "EC2"
  min_size            = 1
  max_size            = 1
  desired_capacity    = 1

  key_name = aws_key_pair.deployer.key_name

  tags = [
    {
      key                 = "kubernetes.io/cluster/${var.name}"
      propagate_at_launch = true
      value               = "owned"
    },
    {
      key                 = "Region"
      value               = "${var.tag-region}"
      propagate_at_launch = true
    },
    {
      key                 = "Country"
      value               = "${var.country}"
      propagate_at_launch = true
    },
    {
      key                 = "CECO"
      value               = "${var.ceco}"
      propagate_at_launch = true
    },
    {
      key                 = "Owner"
      value               = "${var.owner}"
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = "${var.environment}"
      propagate_at_launch = true
    }
  ]
}
