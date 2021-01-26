locals {
  node_count = 1
}

resource "kind_cluster" "current" {
  name = "debug-kind-kustomize"

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

provider "kustomization" {
  kubeconfig_raw = kind_cluster.current.kubeconfig
}

data "kustomization" "current" {
  path = "manifests/"
}

resource "kustomization_resource" "current" {
  for_each = data.kustomization.current.ids

  manifest = data.kustomization.current.manifests[each.value]

  depends_on = [kind_cluster.current]
}
