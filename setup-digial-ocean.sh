#ansible-playbook -i hosts -u root playbook-by-role-ping.yml
ansible-playbook -i hosts -u root playbook-by-role-basic.yml
# ansible-playbook -i hosts -u root playbook-by-role-basic.yml -vv

# only run when needed
ansible-playbook -i hosts -u root playbook-by-role-docker.yml
ansible-playbook -i hosts -u root playbook-by-role-nginx.yml

# vpn only
ansible-playbook -i hosts -u root playbook-by-role-vpn-for-ubuntu.yml
#ansible-playbook -i hosts -u root playbook-by-role-vpn-for-centos.yml