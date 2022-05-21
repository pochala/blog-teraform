#Kubernetes Cluster
resource "digitalocean_kubernetes_cluster" "lbarahona" {
  name    = "lbarahona"
  region  = "nyc1"
  version = "1.22.8-do.1"

  node_pool {
    name       = "lbarahona-nodes"
    size       = "s-1vcpu-2gb"
    node_count = 2
  }
}

#Blog namespace
#Since the namespace won't be modified, we can create it once and reuse it
resource "kubernetes_namespace" "lbarahona-blog" {
  metadata {
    name = "lbarahona-blog"
  }
}