

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

