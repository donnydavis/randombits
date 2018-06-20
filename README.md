# This branch is for working with the Fort Nebula Cloud
#### You could also use these instructions to work with any openstack cloud

Lets get started by setting up the auth for the cloud.

Create this folder in your home dir

    mkdir -p ~/.config/openstack
    curl -o ~/.config/openstack/clouds.yaml https://raw.githubusercontent.com/donnydavis/randombits/master/clouds.yaml
    vi ~/.config/openstack/clouds.yaml # Edit to fit your Openstack Cloud
    sudo curl -o /etc/ansible/hosts https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/openstack_inventory.py
    sudo chmod +x /etc/ansible/hosts



Now insert your login creds and you will be ready to roll with the rest of your ansible modules. 



For those that think this is basic stuff, you would be correct. 
It is very basic, but also not well documented in a consumable fashion. 

Ansible uses shade, and os-client-config to connect to Openstack
These python libraries look for configuration files at 
    
    ~/.config/openstack/clouds.yaml
    /etc/openstack/clouds.yaml
    
To avoid any fighting or future incompatiblity with these libraies, we place our cloud config on one of those locations.

Please do remember that dynamic inventories are queried at the start of the playbook run, not mid run of a playbook. 
If you are trying to spin up a host, and then configure it you can go one of two ways

1> Run two playbooks - one to spin up the machine and then one to configure
2> Handle quering the Openstack API for up to date host info in your playbook. 
