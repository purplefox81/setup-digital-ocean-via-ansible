ansible-playbook -i hosts -u root playbook-by-role-ping.yml
ansible-playbook -i hosts -u root playbook-by-role-basic.yml
# ansible-playbook -i hosts -u root playbook-by-role-basic.yml -vv
ansible-playbook -i hosts -u root playbook-by-role-docker.yml
ansible-playbook -i hosts -u root playbook-by-role-nginx.yml
