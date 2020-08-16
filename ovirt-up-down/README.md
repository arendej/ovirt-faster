# oVirt up/down

Use the scripts to combine the tasks to bring ovirt up or down.
These combine some shell and ansible-playbook tasks to get it done.
At this time there's a manual element where..

 * **before using [the script to start it up](ovirt-up.sh)**, the storage for the oVirt datacentre must be ready and serving and the hosts must be up
 * **before using [the script to shut down](ovirt-down.sh)**, all VMs (except the hosted engine) must be off and the datacenter and it's storage domains
 (except the hosted engine storage domain) must be set in maintenance mode.
 
Use scripts from the same system that has ansible capability upon the oVirt hosts.
In my case, this is the storage host.
