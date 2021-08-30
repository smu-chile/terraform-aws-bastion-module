data "aws_instances" "bastion" {
  depends_on = [
    module.bastion-asg
  ]
  filter {
    name   = "tag:Name"
    values = ["${var.name}-bastion"]
  }
}

output "bastion-public-ips" {
  value = data.aws_instances.bastion.public_ips
}