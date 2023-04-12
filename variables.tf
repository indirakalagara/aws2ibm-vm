variable "ibmcloud_api_key" {
  type        = string
  description = "File to be copied from source to destination"  
  default     = ""
}
variable "ibm_resource_group" {
  type        = string
  description = "Resource group on IBM Cloud"
  default     = "Default"
}


variable "src_provider_access_key" {
  type        = string
  description = "Access key of the Storage Provider "
  #default     = ""  
}

variable "aws_instance_ID" {
  type = string
  description = "EC2 instance id which we want to export"
  #default = ""
}

variable "src_provider_secret_key" {
  type        = string
  description = "Secret key of the Storage Provider"
  #default     = ""
}

variable "src_provider_name" {
  type        = string
description = "Provide a name to create a soruce provider configurations"
  default     = "src_provider"
}

variable "src_provider_type" {
  type        = string
  description = ""
  default     = "s3"
}
variable "src_provider_region" {
  type        = string
  description = "Region for the source provider"  
  #default     = ""
}

variable "src_storage_provider" {
  type        = string
  description = "Provide values from : [IBMCOS AWS]"
  default     = "AWS"
}
variable "src_env_auth" {
  type        = bool
  description = ""
  default     = false
}

variable "src_endpoint" {
  type        = string
  description = ""
  default     = ""
}

variable "dest_provider_access_key" {
  type        = string
  description = "Access key of the Storage Provider "
  #default     = ""  
}

variable "dest_provider_secret_key" {
  type        = string
  description = "Secret key of the Storage Provider"
  #default     = ""
}

variable "dest_provider_name" {
  type        = string
  description = "Provide a name to create a destination provider configurations"
  default     = "dest_provider"
}

variable "dest_provider_type" {
  type        = string
  description = ""
  default     = "s3"
}

variable "dest_storage_provider" {
  type        = string
  description = "IBMCOS / AWS"
  default     = "IBMCOS"
}

variable "dest_provider_region" {
  type        = string
  description = "Region for the dest provider"  
  #default     = ""
}
variable "dest_env_auth" {
  type        = bool
  description = ""
  default     = false
}


variable "dest_endpoint" {
  type        = string
  description = ""
  default     = ""
}



variable "src_bucket" {
  type        = string
  description = "Type of action with rclone utility create / copy / dry-run"  
  #default     = ""
}
variable "dest_bucket" {
  type        = string
  description = "Type of action with rclone utility create / copy / dry-run"  
  default     = ""
}


variable "dest_bucket_type" {
  type        = string
  description = "Type of bucket in IBM Cloud"  
  default     = ""
}

variable "file_name" {
  type        = string
  description = "File to be copied from source to destination"  
  default     = ""
}

variable "rcaction" {
  type        = string
  description = "Type of action with rclone utility create / copy / dry-run"
  default     = "create"
}


variable "custom_image_name" {
  type        = string
  description = "Custom Image name "
  default     = ""
}

variable "custom_image_os" {
  type        = string
  description = "Operating System of the Image "
  default     = ""
}


variable "dest_cos_instance_name" {
  type        = string
  description = "IBM COS Instance name"
  default     = ""
}

variable "dest_ibm_ssh_key" {
  type        = string
  description = "SSH key ID to inject into the virtual server instance"
  #default     = ""
}

variable "ibm_vsi_profile" {
  type        = string
  description = "VS Instance size"
  default     = "cx2-2x4"
}


variable "base_name" {
  type        = string
  description = "name prefix"
  default     = ""
}

variable "ibm_region_zone" {
  type        = string
  description = "Zone for IBM Specified region prefix"
 
}