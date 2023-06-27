variable "resource_group_name" {
  description = "The name of the Resource Group to deploy the AKS service"
  type = string
}
variable "location" {
  description = "The Azure Region in which to create the AKS cluster"
  type = string
}
variable "cluster_name" {
  description = "The name of the AKS cluster"
  type = string
}
variable "dns_prefix" {
  default = null
  description = "The dns prefix for the resources created in the specified Azure Resource Group."
  type = string
}
variable "node_resource_group" {
  description = "The name of the node resource group to deploy the node pools"
  type = string
}
variable "kubernetes_version" {
  description = "The Kubernetes version to be deployed"
  type = string
}
variable "tags" {
  description = "The tags associated kubernetes cluster"
  type = map(string)
}
# variable "adminl_username" {
#    description = "Node admin username"
#    type = string
#  }
#  variable "admin_public_ssh_key" {
#    description = "The ssh public for accessing the node"
#    type = string
#  }
 
 #variable "workspace_rs_id" {
  #description = "The tenant id for cluster"
  #type = string
 #}
 
variable "node_name" {

  description = "AKS node name"
  type = string
}
variable "min_count_default" {
  description = "The  min number of nodepools to be created"
  type = string
}
variable "max_count_default" {
  description = "The  min number of nodepools to be created"
  
}
variable "agent_count_default" {
  
  description = "The number of nodes that should exist in the node Pool"
 
}
variable "agent_size" {
  type = string
}
variable "os_disk_size_gb" {
  type = string
}
variable "vnet_subnet_id" {
  type = string
}

variable "max_pods_default" {
  type = string
}

variable "node_labels"{
  type = map(string)
}

#variable "subnet_id" {}
# variable "gateway_id" {}

# variable "tenant_id" {
#   type = string
  
# }
# variable "azure_rbac_enabled" {
  
# }
# variable "aksadministrator_adgroups" {
# type = list(string)
# default= null
# }

variable "cluster_service_cidr" {}
variable "docker_bridge_cidr" {}
variable "network_plugin" {}
variable "pod_cidr" {}
variable "dns_service_ip" {}
variable "local_account_disabled" {}
variable "availability_zones" {
type = list(string)
default= null 
}
variable "enable_auto_scaling" {
  
}
variable "private_cluster_enabled" {
  
}
#
# variable "adminw_username" {}
# variable "adminw_password" {}
# variable "windowslicense" {}