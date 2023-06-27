# About Custom Module "networkInterfaceCard" 🌐

This modules is to create a networkInterfaceCard and its associated Networking components. Depending on the requirements, only required arguments in each module are assigned. 

## Input Variable Definitions
| Variable                                   | Default | Required | Description                                                                                                                                       |
|--------------------------------------------|---------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| nic_name                                   | -       | Yes      | The name of the Network Interface.
| location                                   | -       | Yes      | The location where the Network Interface should exist.
| resource_group_name                        | -       | Yes      | The name of the Resource Group in which to create the Network Interface.
| nic_dns_servers                            | []      | No       | A list of IP Addresses defining the DNS Servers which should be used for this Network Interface.
| nic_enable_ip_forwarding                   | false   | No       | Should IP Forwarding be enabled? Defaults to false.
| nic_enable_accelerated_networking          | false   | Yes      | Should Accelerated Networking be enabled? Defaults to false.
| nic_internal_dns_name_label                | null    | No       | The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network.
| tags_NIC                                   | -       | Yes      | A mapping of tags to assign to the resource.
| [nic_config_ips]                           | []      | Yes      | A custom object variable for IP Configurations. [`Arguments`](#nic_config_ips-block-supports-the-following:) - (Required) name, (Optional) subnet_id, (Optional) private_ip_address_version, (Optional) private_ip_address, (Required) private_ip_address_allocation, (Optional) public_ip_address_id, (Optional) primary.

### nic_config_ips-block-supports-the-following:
| Variable                                   | Default | Required | Description                                                                                                                                       |
|--------------------------------------------|---------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| name                                       | -       | Yes      | A name used for this IP Configuration.
| subnet_id                                  | -       | No       | The ID of the Subnet where this Network Interface should be located in.
| private_ip_address_version                 | -       | No       | The IP Version to use. Possible values are IPv4 or IPv6. Defaults to IPv4.
| private_ip_address                         | -       | No       | The Static IP Address which should be used.
| private_ip_address_allocation              | -       | Yes      | The allocation method used for the Private IP Address. Possible values are Dynamic and Static.
| public_ip_address_id                       | -       | No       | Reference to a Public IP Address to associate with this NIC
| primary                                    | -       | No       | Is this the Primary IP Configuration? Must be true for the first | ip_configuration when multiple are specified. Defaults to false.

## Output Variable Definitions
| Variable                                      | Is Output a List | Description                                                                                                                                             |
|-----------------------------------------------|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------- |
| nic_id                                        | No               | The ID of the Network Interface.
| nic_name                                      | No               | A name used for IP Configuration of NIC.
| nic_mac                                       | No               | The Media Access Control (MAC) Address of the Network Interface.
| nic_vm_id                                     | No               | The ID of the Virtual Machine which this Network Interface is connected to.
| nic_configip_names                            | Yes              | A name used for this IP Configuration.

## Sample Usage
```
module "m_nic_01" {
  source                            = "../Modules/Network/networkInterfaceCard"
  nic_name                          = "poc-nic-01"
  location                          = module.m_rg_POC_01.rg_location
  resource_group_name               = module.m_rg_POC_01.rg_name
  nic_dns_servers                   = null              
  nic_enable_ip_forwarding          = true        
  nic_enable_accelerated_networking = false          
  nic_internal_dns_name_label       = null

  //ip_configuration Block
  nic_config_ips =  [{
    name                          = "ipconfig1"
    subnet_id                     = module.m_subNet_NetworkComponents_01.subnet_id
    private_ip_address_version    = "IPv4"
    private_ip_address_allocation = "Static"
    public_ip_address_id          = null
    primary                       = true
    private_ip_address            = "10.10.8.75"
  }]  
  tags_NIC  = { 
    environment        = "sandbox"
    protection-profile = "Not Applicable"
  } 
}
```
## Guidelines
1.	Update the name of module to keep it unique and use comment blocks & descriptions wherever required; For example-
    ```
    #------------------------------------ nic: networkInterfaceCard  -------------------------
    module "m_nic_networkInterfaceCard_01" {
      source                                 = "../Modules/Network/networkInterfaceCard"
      //networkInterfaceCard Specifications
      nic_name                               = "poc-nic-01"
    ```
2.  Update values for each arguments that references outputs from other modules within the main file
3.	Optionally, eliminate the declaration of default arguments unless the default values have to be over-ridden
4.  Create the defined variables in `variables.tf` file under respective `Core` folders
5.  Assign values to the created variables in `Environmental.tfvars` file under respective `Core` folders