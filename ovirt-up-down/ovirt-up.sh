#
#To bring it up the below steps will help.

#1) Power on all the hypervisors.

echo -e '\nEnsure all hypervisors are powered on and nominal.\nAny volumes from storage should be working..\n'
echo -e 'Ensure that requisite DNS servers are up and running!\n'

#2) start all the volumes
showmount -e

echo -e '\nAnsible will start the ovirt-ha-brokers & agents.. \n'
#3) start ha agent and broker services on all the nodes by running the
# command systemctl start ovirt-ha-broker; systemctl start ovirt-ha-agent
ansible-playbook -i virt-hosts.inv start-broker-agent.yml

echo -e '\nAnsible will turn off global maintenance mode.. \n'
#4) Move hosted-engine out of global maintenance by running the command
# hosted-engine --set-maintenance --mode=none
ansible-playbook -i virt-hosts.inv global-maint.yml -e "globalornone=none"

#5) give some time for the HE to come up. check for 'hosted-engine --vm-status' to see if HE vm is up.
echo -e '\nGive some time for the HE to come up. \nCheck for 'hosted-engine --vm-status' to see if HE vm is up.\n'

#6) Activate all storage domains from UI.
echo -e 'Activate all storage domains from UI and then start any VMs.\n'

#7) start your virtual machines.
