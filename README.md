# Project_1
# The project has been coded in Terraform which uses 2 providers Azure and AWS. I have created it as a part of the week 1 devops project. 
# I have created  Azure resource group, virtual machine, subnet, storage account, AD users one of mine and other for the trainer and added required for the password change when the trainer first logs in to the account. I have also created required resources for the virtual machin on Azure. 
# for the AWS, I have created four different user account on IAM using terraform for each. also i have created 2 S3 buckets using count method. 
# this project is organized with different modules where main.tf has all the resources, Providers.tf has all the provider information of AWS and Azure, variables.tf has all the variables defined, output.tf has the code to print the pricate ip address of the resource. 
