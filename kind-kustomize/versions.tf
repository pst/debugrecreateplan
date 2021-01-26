
terraform {
  required_providers {
    kind = {
      source  = "kyma-incubator/kind"
      version = "0.0.6"
    }

    kustomization = {
      source  = "kbst/kustomization"
      version = "0.3.0"
    }

    template = {
      source  = "hashicorp/template"
      version = "2.1.2"
    }
  }

  required_version = ">= 0.13"
}
