module "aws_image_creation" {
    source ="github.com/faheemshai/aws-image-export"
    region            = var.src_provider_region
    src_bucket        = var.src_bucket
    instance_ID       = var.aws_instance_ID
    access_key_id     = var.src_provider_access_key
    secret_access_key = var.src_provider_secret_key
}

module "src_provider" {
     depends_on = [
      module.aws_image_creation
    ] 
    source ="github.com/indirakalagara/terraform-rclone-utils.git"
    rcaction = "create"
    name      = var.src_provider_name
    type         = var.src_provider_type
    storage_provider        = var.src_storage_provider
    env_auth       = var.src_env_auth
    region       = var.src_provider_region
    access_key_id = var.src_provider_access_key
    secret_access_key = var.src_provider_secret_key
    endpoint          = var.src_endpoint
}

module "dest_provider" {
    depends_on = [
      module.src_provider,
      module.aws_image_creation
    ]
    source ="github.com/indirakalagara/terraform-rclone-utils.git"
    rcaction = "create"
    name      = var.dest_provider_name
    type         = var.dest_provider_type
    storage_provider        = var.dest_storage_provider
    env_auth       = var.dest_env_auth
    region       = var.dest_provider_region
    access_key_id           = var.dest_provider_access_key
    secret_access_key        = var.dest_provider_secret_key
    endpoint          = var.dest_endpoint
}

module "copy_image" {    
    depends_on = [
      module.src_provider,
      module.dest_provider,
      module.aws_image_creation
    ]
    source ="github.com/indirakalagara/terraform-rclone-utils.git"
    rcaction = "copy"
    src_provider  = var.src_provider_name
    dest_provider = var.dest_provider_name    
    src_bucket = var.src_bucket
    dest_bucket = var.dest_bucket
    file_name = module.aws_image_creation.image_name
    
}
module "create-custom-image" {
  depends_on = [
    module.copy_image
  ]
  source = "github.com/indirakalagara/terraform-vpc-custom-image.git"
  resource_group = var.ibm_resource_group
  cos_instance_name = var.dest_cos_instance_name
  bucket_name       = var.dest_bucket 
  bucket_type       = var.dest_bucket_type 
  region            = var.dest_provider_region 
  object_key        = module.aws_image_creation.image_name #var.file_name
  image_name        = var.custom_image_name
  os_name           = var.custom_image_os

}
module "create_ibm_vsi" {
  depends_on = [
    module.create-custom-image
  ]
  source = "github.com/Sivasaivm/ibm-image2vsi"

    zone = var.ibm_region_zone
    base_name=var.base_name
    resource_group=var.ibm_resource_group
    image_name=var.custom_image_name
    ssh_key=var.dest_ibm_ssh_key
    vsi_profile=var.ibm_vsi_profile

}
