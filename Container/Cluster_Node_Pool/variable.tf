
/*
variable "nodepool_count" {
  description = "The  number of nodepools to be created"
  type = string
}
*/
variable "nodepool_name" {
  description = "The  names of the nodepool"
}
variable "agent_count" {
  description = "The number of nodes that should exist in the node Pool"

}
variable "min_count" {
  description = "The  minimum node counts in vm scale set"

}
variable "max_count" {
  description = "The  maximum node counts in vm scale set"
}
variable "max_pods" {
  description = "The  maximum pods"

}

variable "agent_size" {
  
}

variable "os_type" {
  
}

variable "vnet_subnet_id" {
  
}

variable "kubernetes_version" {
  
}
variable "os_disk_size_gb" {
  
}
variable "availability_zones" {
  description = "The  number of availability zones to be created "

}
variable "tier_tags" {
  description = "A mapping of tags for all nodes for respective nodepool"

}
#variable "node_labels" {
  #description = "A map of Kubernetes labels which should be applied to nodes in this Node Pool"
#}


variable "cluster_id" {
  
}
variable "mode" {
  
}
variable "os_sku" {
  
}
#variable "node_taints" {}