locals {
  node_count = 1
}

resource "kind_cluster" "current" {
  name = "debug-kind-kubernetes"

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }

    dynamic "node" {
      for_each = range(local.node_count)
      content {
        role = "worker"
      }
    }
  }
}

provider "kubernetes" {
  config_path = kind_cluster.current.kubeconfig_path
}

resource "kubernetes_namespace" "current" {
  metadata {
    name = "debug"
  }
}
