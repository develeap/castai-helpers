terraform {
  required_version = ">=0.13.0"
  required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = ">= 3.7.0"

        }
        azuread = {
            source = "hashicorp/azuread"
            version = ">= 2.22.0" 
        }
        helm = {
            source = "hashicorp/helm"
            version = ">= 2.0.0" 
        }  
        castai = {
            source = "castai/castai"
            version = ">= 3.3.0"
        }
    }
}

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