resource "azurerm_kubernetes_cluster" "cluster_service" {
  name                = var.cluster_name
  location            = var.location 
  resource_group_name = var.resource_group_name 
  dns_prefix          = var.dns_prefix 
  node_resource_group = var.node_resource_group /*Nodes has to be created in a non existing resource group
  or else a new resource group will be created automatically*/
  kubernetes_version  = var.kubernetes_version //data
  tags                = var.tags
  private_cluster_enabled = var.private_cluster_enabled
  local_account_disabled = var.local_account_disabled
  # linux_profile {
  #   admin_username =  var.adminl_username
  #    ssh_key {
  #   key_data    =  var.admin_public_ssh_key 
  #    }
  #  }

  #  windows_profile {
  #   admin_username =  var.adminw_username
  #   admin_password =  var.adminw_password
  #   license = var.windowslicense 
  #  } 
  
  # addon_profile {
    oms_agent {
      #  enabled                    = "true"
       log_analytics_workspace_id = var.workspace_rs_id
    }
  #   ingress_application_gateway{
  #     enabled = "true"
  #     #subnet_id = var.subnet_id
  #     gateway_id=var.gateway_id
  #   }
  #   azure_keyvault_secrets_provider{
  #     enabled = "true"
  #   }
  #  }
  

  default_node_pool {
    type                  = "VirtualMachineScaleSets"
    //type                =   var.nodepool_type//"CommonPool"   //AvailabilitySet and VirtualMachineScaleSets
    name                  =   var.node_name 
    enable_auto_scaling   =   var.enable_auto_scaling
    min_count             =   var.min_count_default    
    max_count             =   var.max_count_default 
    node_count            =   var.agent_count_default
    vm_size               =   var.agent_size 
    os_disk_size_gb       =   var.os_disk_size_gb  //30 GB
    # vnet_subnet_id        =   var.vnet_subnet_id 
    max_pods              =   var.max_pods_default 
    zones                 =   var.availability_zones
    orchestrator_version  =   var.kubernetes_version //Data
    node_labels           =   var.node_labels
    tags                  =   var.tags
  }
   
  network_profile {
    network_plugin     = var.network_plugin
    service_cidr       =  var.cluster_service_cidr   
    outbound_type      = "userDefinedRouting"
    load_balancer_sku  = "standard"
    dns_service_ip      = var.dns_service_ip
    docker_bridge_cidr  = var.docker_bridge_cidr
    pod_cidr            = var.pod_cidr

  }

   identity {
    type = "SystemAssigned"
  }

   #role_based_access_control_enabled = var.rbac_enabled
    azure_active_directory_role_based_access_control {
      managed = true
      # tenant_id = var.tenant_id
      # admin_group_object_ids = var.aksadministrator_adgroups
      azure_rbac_enabled = true
    }
   

 }
