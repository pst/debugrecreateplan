
terraform {
  required_providers {
    kind = {
      source  = "kyma-incubator/kind"
      version = "0.0.6"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.0.1"
    }
  }

  required_version = ">= 0.13"
}
