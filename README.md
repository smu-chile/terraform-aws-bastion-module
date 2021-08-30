## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.56.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.56.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bastion-asg"></a> [bastion-asg](#module\_bastion-asg) | terraform-aws-modules/autoscaling/aws | ~> 3.0 |
| <a name="module_ssh_sg"></a> [ssh\_sg](#module\_ssh\_sg) | terraform-aws-modules/security-group/aws | 4.3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.deployer](https://registry.terraform.io/providers/hashicorp/aws/3.56.0/docs/resources/key_pair) | resource |
| [aws_instances.bastion](https://registry.terraform.io/providers/hashicorp/aws/3.56.0/docs/data-sources/instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ceco"></a> [ceco](#input\_ceco) | Tag referente a centro de costo | `string` | n/a | yes |
| <a name="input_country"></a> [country](#input\_country) | Tag referente a país | `string` | `"CL"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Ambiente, p.e: development, staging, production | `string` | n/a | yes |
| <a name="input_image-id"></a> [image-id](#input\_image-id) | Id de la imagen AMI | `string` | n/a | yes |
| <a name="input_instance-type"></a> [instance-type](#input\_instance-type) | Tipo de instancia. P.e: t2.large | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Prefijo de los nombres de las instancias. P.e k8s-virginia-almaceneros-frontend-develop | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Tag referente a owner. P.e: PRODUCTOS DIGITALES | `string` | n/a | yes |
| <a name="input_public-key"></a> [public-key](#input\_public-key) | llave Pública SSH | `string` | n/a | yes |
| <a name="input_subnet-ids"></a> [subnet-ids](#input\_subnet-ids) | Id de las subnets | `any` | n/a | yes |
| <a name="input_tag-region"></a> [tag-region](#input\_tag-region) | Tag referente a región | `string` | `"LATAM"` | no |
| <a name="input_vpc-id"></a> [vpc-id](#input\_vpc-id) | Id de la VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion-public-ips"></a> [bastion-public-ips](#output\_bastion-public-ips) | n/a |
