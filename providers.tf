terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.0.0"
    }
  }
}

provider "oci" {
  # See https://registry.terraform.io/providers/oracle/oci/latest/docs/guides/provider_configuration
  # for more information on how to configure the provider
}
