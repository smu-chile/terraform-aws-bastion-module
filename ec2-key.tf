
resource "aws_key_pair" "deployer" {
  key_name   = var.name
  public_key = var.public-key
}