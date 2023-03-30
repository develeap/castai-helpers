provider "azurerm" {
  features {}
}

provider "azuread" {
  tenant_id = data.azurerm_subscription.current.tenant_id
}

provider "castai" {
  api_token = var.castai_api_token
}

provider "helm" {
  kubernetes {
    host                   = azurerm_kubernetes_cluster.this.kube_config.0.host ### Provide via cluster TF state
    client_certificate     = base64decode(azurerm_kubernetes_cluster.this.kube_config.0.client_certificate) ### Provide via cluster TF state
    client_key             = base64decode(azurerm_kubernetes_cluster.this.kube_config.0.client_key) ### Provide via cluster TF state
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.this.kube_config.0.cluster_ca_certificate) ### Provide via cluster TF state
  }
}