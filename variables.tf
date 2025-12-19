variable "compartment_id" {
  description = "The OCID of the compartment to create resources in."
  type        = string
}

variable "env" {
  description = "The environment name, e.g., dev, stage, prod."
  type        = string
}

variable "vcn_cidr_block" {
  description = "The CIDR block for the VCN."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}
