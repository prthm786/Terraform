# Terraform Commands 
---

### Check Terraform Version
- `$ terraform -version`


### Terraform Help 
- `$ terraform -help`
- `$ terraform -help <command>`


### Initalise Terraform and installs the necessary providers 
- `$ terraform init`


### Formats the Terraform configuration files 
- `$ terraform fmt`


### Validate the Terraform configuration files
- `$ terraform validate`


### Terraform Creates Execution plan before making resources
- `$ terraform plan`
#### Save the plan to a file 
 - `$ terraform plan -out myplan.tfplan`

- `$ terraform plan -refresh-only`

#### Displays the plan without being prompted for confirmation 
- `$ terraform plan -auto-approve`

- `$ terraform plan -var "var_name=var_value"`
- `$ terraform plan -var-file="file_name.tfvars"`
- `$ terraform plan -json`
- `$ terraform plan -input=false`


### Applying the Terraform Configuration and creating infrastructure 
- `$ terraform apply`
#### Use the plan file to apply the Terraform Configuration 
- `$ terraform apply <plan_file>`

- `$ terraform apply -var "var_name=var_value"`
- `$ terraform apply-var-file="file_name.tfvars"`

#### Apply the Configuration without being prompted for confirmation 
- `$ terraform apply -auto-approve`

#### Refrehes the state and doesn't make changes to infrastructure
- `$ terraform apply -refresh-only`
 
- `$ terraform apply -json`
- `$ terraform apply -input=false`
- `$ terraform apply -replace <resource_type>.<resource_name>`


### Inspecting Terraform State 
- `$ terraform show` 
- `$ terraform show -json` 
- `$ terraform state list`
- `$ terraform state show <resource_type>.<resource_name>`


### Displays values of Output after running the Terraform configuration 
- `$ terraform output`
- `$ terraform output <output_name>`
- `$ terraform output -json`


### Display the plan for destroying infrastructure 
  - `$ terraform plan -destroy`


### Destroys all the infrastructure managed by current Terraform configuration files.
- `$ terraform destroy`
