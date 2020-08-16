#
#To bring it down the below steps will help.

#1) Stop all Virtual Machines

echo -e '\nEnsure all virtual machines are powered off/ shutdown.\n'
echo -e 'Ensure that all the storage domains other than hosted_storage are set to maintenance!\n'

#2) echo -e '\nAnsible will turn on global maintenance mode and shut down the HE VM.. \n'
# Move hosted-engine into global maintenance by running the command
# hosted-engine --set-maintenance --mode=global
# stop HE VM by running `hosted-engine --vm-shutdown`
ansible-playbook -i virt-hosts.inv global-maint.yml -e "globalornone=global"

echo -e "\nAnsible will stop the ovirt-ha-brokers, ovirt-ha-agents and the hosted-engine VM  and it's storage.. \n"
#3) start ha agent and broker services on all the nodes by running the
# command systemctl start ovirt-ha-broker; systemctl start ovirt-ha-agent
ansible-playbook -i virt-hosts.inv stop-broker-agent-HE.yml

