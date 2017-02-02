# This branch is for working with the Fort Nebula Cloud

Lets get started by setting up the auth for the cloud.

Create this folder in your home dir

    mkdir -p ~/.config/openstack
    curl -o ~/.config/openstack/clouds.yaml https://raw.githubusercontent.com/donnydavis/randombits/playbooks/clouds.yaml
    vi ~/.config/openstack/clouds.yaml
Now insert your login creds and you will be ready to roll with the rest of your ansible modules. 



#### For those that think this is basic stuff, you would be correct. 
#### It is very basic, but also not well documented in a consumable fashion. 
    
