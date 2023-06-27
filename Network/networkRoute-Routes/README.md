# About Custom Module "networkRoute-Routes" 🌐

This modules is to create a networkRoute-Routes and its associated Networking components. Depending on the requirements, only required arguments in each module are assigned.

## Input Variable Definitions
| Variable                                   | Default | Required | Description                                                                                                                                       |
|--------------------------------------------|---------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| rou_name                                   | -       | Yes      | The name of the route.
| resource_group_name                        | -       | Yes      | The name of the resource group in which to create the route.
| udr_name                                   | -       | Yes      | The name of the route table within which create the route.
| rou_address_prefix                         | -       | Yes      | The destination CIDR to which the route applies, such as 10.1.0.0/16.
| rou_hop_type                               | None    | Yes      | The type of Azure hop the packet should be sent to.
| rou_hop_ip                                 | null    | No       | Contains the IP address packets should be forwarded to.

## Output Variable Definitions
| Variable                                      | Is Output a List | Description                                                                                                                                              |
|-----------------------------------------------|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------- |
| route_table_name                              | No               | The name of the route table within which create the route.
| rou_id                                        | No               | The Route ID.

## Sample Usage
```
module "m_rou_01" {
  source               = "../Modules/Network/networkRoute-Routes"
  rou_name             = "poc-rou-01"
  resource_group_name  = module.m_rg_POC_01.rg_name
  udr_name             = module.m_udr_01.route_table_name
  rou_address_prefix   = "10.1.0.0/16"
  rou_hop_type         = "vnetlocal"
  rou_hop_ip           = "10.1.0.80/16"
}
```
## Guidelines
1.	Update the name of module to keep it unique and use comment blocks & descriptions wherever required; For example-
    ```
    #------------------------------------ ROU: networkRoute-Routes -------------------------
    module "m_rou_networkRouteRoutes_01" {
      source                                 = "../Modules/Network/networkRoute-Routes"
      //networkRoute-Routes Specifications
      rou_name                               = "poc-rou-01"
    ```
2.  Update values for each arguments that references outputs from other modules within the main file
3.	Optionally, eliminate the declaration of default arguments unless the default values have to be over-ridden
4.  Create the defined variables in `variables.tf` file under respective `Core` folders
5.  Assign values to the created variables in `Environmental.tfvars` file under respective `Core` folders