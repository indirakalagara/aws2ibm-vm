# Migrate AWS EC2 instance to IBM Cloud VPC VSI 

This repository provides the automation script for transferring the virtual server instance (EC2) from AWS to IBM Cloud VPC virtual server. 

## Pre-reqs:

- install terraform
- install git
- AWS cloud access and secret keys and s3 bucket
- IBM Cloud API key and service credentials for the IBM COS bucket
- In detail step by step process to migret instance from aws to ibm cloud
  https://community.ibm.com/community/user/cloud/blogs/sivasailam-vellaisamy/2022/09/08/how-to-migrate-a-ec2-instance-from-aws-to-ibm-clou
## Instructions

1. Clone the repository
    git clone https://github.ibm.com/indira-kalagara/aws2ibm-vm.git


2. Navigate to the directory 
    cd aws2ibm-vm
 
3. Create  terraform.tfvars by copying it from terraform.tfvars-template and update it  with the values for the parameters
    cp terraform.tfvars-template terraform.tfvars

    Below are the minimum paratmeters required from each cloud provider
    - Details of the source provider - AWS credentials, S3 bucket and instance details which need to be transferred

        src_provider_access_key = ""   # Access key from AWS Cloud

        src_provider_secret_key = ""   # Secret key from AWS Cloud

        src_provider_name=""           # Provide a name to create a soruce provider configurations"

        src_provider_region =""        # Region of the AWS Cloud /S3 instance

        src_bucket=""                  # Name of the S3 bucket 

        aws_instance_ID = ""           # Instance ID AWS EC2 instance which needs to be migrated.


    - Details of the Destination provider - IBM Cloud COS bucket service credentials. This can be picked from IBM COS instance page by creating the service credentials. Please ensure to enable HMAC to true while creating service credentials.

        ibmcloud_api_key=""            # API Key of IBM Cloud 

        ibm_resource_group=""          # IBM Cloud Resource group name

        dest_provider_access_key = ""  # Access key from IBM COS service credentials

        dest_provider_secret_key = ""  # Secret key from IBM COS service credentials

        dest_cos_instance_name=""      # IBM COS Service instance name

        dest_provider_name=""          # Provide a name to create a destination provider configurations"

        dest_provider_region= ""       # Region of IBM COS bucket 

        dest_endpoint = ""             # Endpoint of IBM COS Bucket 

        dest_bucket=""                 # IBM COS Bucket name

        dest_bucket_type=""            # IBM COS Bucket type 
        

    - Provide the details to create the VPC and vsi instance in IBM Cloud
    
        custom_image_name  = ""         # Provide a name for the custom image to be created in IBM Cloud VPC

        custom_image_os=""              # Provide Operating System for the custom image

        dest_ibm_ssh_key=""             # Provide ssh key which need to be mapped to the vsi instance
        
        ibm_vsi_profile=""              # Provide a instance profile value. Ex: cx2-2x4

        base_name=""                    # Name-prefix to be added to the vpc resources

        ibm_region_zone=""              # Zone for the subnet zone. 


4. Execute the terraform scripts

    terraform init

    terraform plan

    terraform apply


Based on the size of the EC2 instance size, script will take time as it first export the image created from the EC2 instance to AWS S3 bucket and then transfer the same to IBM COS bucket. Once the transfer is done, we can find the IBM Custom image in the IBM Cloud VPC and also VPC, subnets and virtual server instance created.