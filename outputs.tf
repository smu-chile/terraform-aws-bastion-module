data "aws_instances" "bastion" {
  depends_on = [
    module.bastion-asg
  ]
  filter {
    name   = "tag:aws:autoscaling:groupName"
    values = [module.bastion-asg.this_autoscaling_group_name]
  }
}

output "bastion-public-ips" {
  value = data.aws_instances.bastion.public_ips
}