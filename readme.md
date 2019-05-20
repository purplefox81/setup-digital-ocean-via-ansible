
## Setup Digital Ocean


## Prerequisit

install ansible on the control machine. in my case I used brew to install ansible on Mac.
verify the installation by `ansible --version`
add the ssh pub key of the control machine to the remote machines which to be remotely auto configured
perform a "ssh root@remoteIp" to make sure we can successfully log in to the remote machine
create a inventory file named "hosts", which list all remote servers are meant to be configured


## Hosts, Host Group and Inventory File
hosts is an inventory file in plain text format that ansible query for every command
if we have ansible.cfg on the current directory, ansible will read it and take the inventory file from the default path
with that, we can omit all "-i hosts" below 

we always need to switch to 'root' user while testing on digital ocean cloud instances

## Run Adhoc Ansible Commands
if ansible.cfg is properly configured and have inventory specified, we may omit '-i hosts' from the command below

To log in as root user to all instance defined in 'playground' (or simply 'all') and then 
perform a ping,         ansible -i hosts playground -u root -m ping
check free disk stat,   ansible -i hosts playground -u root -m shell -a 'df -h'


## Run Adhoc Ansible Playbooks
let's take nginx as an exmaple, 
log in as root and perform actions according to the given playbook

install a nginx server to the target servers, and copy index.html to /usr/share/nginx/html/index.html
ansible-playbook -i hosts -u root nginx-setup.yml

after running the above playbook, ssh to the cloud instance, open etc/nginx/sites-available/default
change line `#root /var/www/html;` to `root /usr/share/nginx/html;`
this will make the nginx to load the website from /usr/share/nginx/html directory
now restart nginx by `service nginx start/stop/quit/restart/reload`
btw `systemctl start/stop/.../reload nginx` is not working


## Run Ansible Playbook as Roles

all playbooks are organized according to their roles, there is a directory named 'roles', under which multiple roles are defined.
When a role is called from playbook, the main.yml under its 'tasks' subdirectory is loaded and executed by ansible.

in this project, available commands are
ansible-playbook -i hosts -u root playbook-by-role-ping.yml
ansible-playbook -i hosts -u root playbook-by-role-basic.yml
ansible-playbook -i hosts -u root playbook-by-role-docker.yml
ansible-playbook -i hosts -u root playbook-by-role-nginx.yml



