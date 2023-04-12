
provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}


provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = var.dest_provider_region
}
