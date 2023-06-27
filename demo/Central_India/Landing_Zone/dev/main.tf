

 /*------------------------------ Vnets ---------------------------*/
  module "vnet" {
         for_each            = var.vnets
        source              = "../../../../Modules/Network/Vnet"
         vnt_name            = each.value.vnet_name
         location            = var.location
         resource_group_name = data.azurerm_resource_group.aks-dev.name 
         vnt_address_space   = each.value.vnt_address_space
         # vnt_dns_servers     = var.dns_servers
         tags_VNT            = var.tags
         # ddos_id             = data.azurerm_network_ddos_protection_plan.ne_ddos.id
         # isenabled           = each.value.isenabled
 }

/*------------------------------ Subnets ---------------------------*/
   module "snet"  {
        for_each                                           = var.subnets
         source                                             = "../../../../Modules/Network/subNet"
         snt_name                                           = each.value.snet_name
         resource_group_name                                = data.azurerm_resource_group.aks-dev.name
          vnt_name                                           = module.vnet[each.value.vnet_name].vnet_name
         address_space                                      = each.value.snet_address_space
         snt_enforce_private_link_endpoint_network_policies = each.value.enforce_pep  
         snt_service_endpoints                              = each.value.snt_service_endpoints
 }


#/*----------------------------------- AKS ---------------------------------------*/ 
   module "aks" {
       for_each                    = var.aks
       source                      = "../../../../Modules/Container/AKS"
        cluster_name                = each.value.cluster_name
        resource_group_name         = data.azurerm_resource_group.aks-dev.name
        location                    = var.location
        dns_prefix                  = each.value.dns_prefix
        node_resource_group         = each.value.node_resource_group
        kubernetes_version          = each.value.kubernetes_version
      #workspace_rs_id            = data.azurerm_log_analytics_workspace.law_ci.id
        # admin_public_ssh_key      = var.GENUS_AKS_SSH_KEY_NP
        # gateway_id                = module.application_gateway[each.value.app_gw_name].id
        node_name                   = each.value.node_name 
        enable_auto_scaling         = each.value.enable_auto_scaling
        min_count_default           = each.value.min_count_default    
        max_count_default           = each.value.max_count_default 
        agent_count_default         = each.value.agent_count_default
       agent_size                  = each.value.agent_size 
        os_disk_size_gb             = each.value.os_disk_size_gb  //30 GB
        vnet_subnet_id              = module.snet[each.value.subnet_name].subnet_id
       max_pods_default            = each.value.max_pods_default 
       availability_zones          = each.value.availability_zones
       node_labels                 = each.value.node_labels
       network_plugin              = each.value.network_plugin
       cluster_service_cidr        = each.value.cluster_service_cidr
        dns_service_ip              = each.value.dns_service_ip
        docker_bridge_cidr          = each.value.docker_bridge_cidr
       pod_cidr                    = each.value.pod_cidr
        # tenant_id                 = var.TENANT_ID
       # aksadministrator_adgroups    = each.value.aksadministrator_adgroups
      private_cluster_enabled      = each.value.private_cluster_enabled
      local_account_disabled       = each.value.local_account_disabled
        # rbac_enabled                 = each.value.rbac_enabled
       tags                         = var.tags
  }