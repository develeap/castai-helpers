

variable "castai_api_token" {
  type = string
  description = "CAST AI API token created in console.cast.ai API Access keys section"
}

variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster, resources will be created for."
}

variable "cluster_region" {
  type        = string
  description = "Region of the AKS cluster, resources will be created for."
}

# variable "delete_nodes_on_disconnect" {
#   type        = bool
#   description = "Optional parameter, if set to true - CAST AI provisioned nodes will be deleted from cloud on cluster disconnection. For production use it is recommended to set it to false."
#   default     = true
# }

variable "castai_configuration"{
    type = object({
        delete_nodes_on_disconnect = bool
        autoscaler_policies_json   = any
        # node_templates             = any #will push th right fix soon
  })
}