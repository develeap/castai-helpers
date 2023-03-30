
data "azurerm_subscription" "current" {}


resource "helm_release" "castai_ro" {
  name       = "castai-agent"
  repository = "https://castai.github.io/helm-charts"
  chart      = "castai-helm/castai-agent"
  version    = "0.43.0"

  set {
    name = "apiKey" 
    value = vars.castai_api_token
  }

  set {
    name = "provider"
    value = "aks"
  }
}