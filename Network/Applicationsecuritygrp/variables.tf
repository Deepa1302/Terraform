variable "application_security_group_name" {
  description="(Required) Specifies the name of the Application Security Group. Changing this forces a new resource to be created. "
  type=string
}
variable "rg_name" {
  description="The name of the resource group in which to create the application security group."
  type=string  
}
variable "location" {
  description="he location/region where the application security group is created."
  type=string  
}
variable "tags" {
  description="A mapping of tags to assign to the resource."
  type=map(string)
}
