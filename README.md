# ovirt-faster
Playbooks I use with oVirt/RHV


## Setup/Prep tasks
This setup of oVirt assumes:
 * 1 host acting as NFS storage for oVirt
 * 1 or more hosts acting as oVirt host, for (self)hosted engine or local engine
 * Ansible binary is executing from the NFS storage host, because why not. (note the localhost selection in its playbook)
 * There are different things done for oVirt 4.3 (CentOS 7) versus oVirt4.4+ (CentOS 8) and that is with different playbooks
 until the logic is built in to check for which is happening.

And it can use the following playbooks (so far):
[setup-NFS-storage-node.yml](setup-NFS-storage-node.yml)
[setup-Centos8-hosts.yml](setup-Centos8-hosts.yml)
~[setup-Centos7-hosts.yml](setup-Centos7-hosts.yml)~
 
Note: I'm aware this is due to be in the form of an Ansible role and I will make a different branch for that.

## Shutdown/Startup tasks

Sometimes we want to shutdown or start-up a oVirt environment because it's a lab, etc.
To do this relatively safely, the following sequence of playbooks, via the script can handle this.

[ovirt-up-down](ovirt-up-down)
