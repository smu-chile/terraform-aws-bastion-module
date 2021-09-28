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

data "github_ip_ranges" "test" {}

output "github-public-ipv4" {
  value = data.github_ip_ranges.actions_ipv4
}

output "github-public-ipv6" {
  value = data.github_ip_ranges.actions_ipv6
}