variable "name" {
  type        = string
  description = "Prefijo de los nombres de las instancias. P.e k8s-virginia-almaceneros-frontend-develop"
}
variable "image-id" {
  type        = string
  description = "Id de la imagen AMI"
}
variable "instance-type" {
  type        = string
  description = "Tipo de instancia. P.e: t2.large"
}
variable "public-key" {
  type        = string
  description = "llave Pública SSH"
}
variable "vpc-id" {
  type        = string
  description = "Id de la VPC"
}
variable "environment" {
  type        = string
  description = "Ambiente, p.e: development, staging, production"
}
variable "tag-region" {
  type        = string
  default     = "LATAM"
  description = "Tag referente a región"
}
variable "country" {
  type        = string
  default     = "CL"
  description = "Tag referente a país"
}
variable "owner" {
  type        = string
  description = "Tag referente a owner. P.e: PRODUCTOS DIGITALES"
}
variable "subnet-ids" {
  description = "Id de las subnets"
}
variable "ingress-cidr" {
  description = "cidr para reglas ingress security group"
  default="0.0.0.0/0"
}

variable "ingress-cidr-ansible" {
  description = "cidr para acceso ansible"
  default=""
}