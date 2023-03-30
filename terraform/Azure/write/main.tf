
data "azurerm_subscription" "current" {}


module "castai-aks-cluster" {
  source = "castai/aks/castai"

  aks_cluster_name    = var.cluster_name
  aks_cluster_region  = var.cluster_region
  node_resource_group = azurerm_kubernetes_cluster.this.node_resource_group ### Provide via cluster TF state
  resource_group      = azurerm_kubernetes_cluster.this.resource_group_name ### Provide via cluster TF state

  delete_nodes_on_disconnect = var.delete_nodes_on_disconnect

  subscription_id = data.azurerm_subscription.current.subscription_id
  tenant_id       = data.azurerm_subscription.current.tenant_id

  default_node_configuration = module.castai-aks-cluster.castai_node_configurations["default"]

  node_configurations = {
    default = {
      disk_cpu_ratio = 25
      subnets        = [azurerm_subnet.internal.id] ### Provide via cluster TF state
      tags           = var.tags
    }
  }
}