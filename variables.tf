###############################
######## Instance keys ########
###############################

variable "private_key_path" {
  type = string
}

variable "public_key_path" {
  type = string
}

############################
######## AWS config ########
############################

variable "aws_credentials_path" {
  type    = string
  default = "~/.aws/credentials"
}

variable "aws_credentials_profile" {
  type    = string
  default = "syed"
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "key_name" {
  type    = string
  default = "terraform_k8s"
}

variable "aws_master_instance_type" {
  type    = string
  default = "t2.medium"
}

variable "aws_worker_instance_type" {
  type    = string
  default = "t2.large"
}

variable "aws_master_storage_size" {
  type    = number
  default = 30
}

variable "aws_worker_storage_size" {
  type    = number
  default = 100
}

##################################
######## K8s nodes config ########
##################################

variable "aws_nodes" {
  type    = number
  default = 1
}
