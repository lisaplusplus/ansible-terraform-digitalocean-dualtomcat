# ansible-terraform-digitalocean-dualtomcat
An example project for creating two identical Tomcat servers on Digital Ocean. Ansbile is the server provisioner. Terraform is used to spin up/down servers.

# Requirements

    i) Ansible
    ii) Terraform
    iii) terraform-inventory (Mac: brew install terraform-inventory)
    iv) Digital Ocean account + API key

# Setup

    $ cd $project-folder
    $ ansible-galaxy install -r requirements.yml

# Usage

i) Spinning up the infrastructure

    $ cd $project-folder/terraform
    $ terraform apply

    Results: Terraform should create two new servers and generate
             the 'inventory' file. 

ii) Provisioning the infrastructure

    $ cd $project-folder/terraform
    $ ansible-playbook --inventory-file=/path/to/terraform-inventory ../configure-tomcat-server.yml

    Results: Ansbile should install Tomcat and its dependencies on both
             servers.


