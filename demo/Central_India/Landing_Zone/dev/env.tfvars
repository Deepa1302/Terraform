# /*--------------------- Common Values -------------------*/
    location                    = "centralindia"
    tags                        = {
        "Environment"           = "dev"
        "Owner"                 = "ravi.girisetti@gmail.com"
       "CreatedBy"             = "DevOps Team"
     }
/*---------------------------- Vnets -----------------------*/
    vnets = {
    "aks_vnet"   =  {
            "vnet_name"          = "dev-vnet",
            "rg_name"            = "aksingress"
            "vnt_address_space"  = ["172.25.0.0/19"]
            #"vnt_dns_servers"   = null
            "isenabled"          = false

   },
}

/*--------------------- Subnets-------------------*/
    subnets = {
        "aks_subnet"   ={
                "snet_name"              = "aks-subnet"
               "snet_address_space"     = ["172.25.0.0/22"]
                "vnet_name"              = "aks_vnet"
            #"resource_group"         = "" 
                "enforce_pep"            = "true" 
                "snt_service_endpoints"  =  null
           },
       
    }


/*------------------------------------ AKS -----------------------------------------*/  
  aks={
   "abrpl_aks"   =  {
           "cluster_name"         = "devaks",
           #"rg_name"              = "aks-nonprod-rg"
            "dns_prefix"           = "aks02-apci-dev-dns"
            "kubernetes_version"   = "1.23.12"
            "admin_enabled"        = "true"
            #"admin_username"       = "" 
            #"admin_public_ssh_key" = ""
            # "app_gw_name"          ="app_gw1"
            "node_name"              ="agentpool"
            "enable_auto_scaling"    ="true"
            "node_resource_group"    = "aks-dev-node-rg"
            "min_count_default"      ="3"
            "max_count_default"      ="5"
            "agent_count_default"    ="3"
            "agent_size"           ="Standard_DS2_v2"
            "os_disk_size_gb"      ="128"
           "subnet_name"          ="aks_subnet"
            "max_pods_default"     ="30"
            "availability_zones"   =["1","2","3"]
           "node_labels"          = null
            "cluster_service_cidr" ="10.0.0.0/16"
           "dns_service_ip"       ="10.0.0.10"
            "docker_bridge_cidr"   ="172.17.0.1/16"
            "network_plugin"       = "kubenet"
            "pod_cidr"             = "10.245.0.0/16"
            "private_cluster_enabled" = "false"
            "local_account_disabled" = "false"
            # "rbac_enabled"          = "true"
            # "aksadministrator_adgroups" = ["fd1a2de9-23a5-43ca-912f-e0c11bdbbc0a" , "3e552b44-d836-4e76-be81-d1d264098ce6"]
            # "windowslicense"            = "Windows_Server"
    }
  }