[docker_servers]
dockermaster01 ansible_port=22 ansible_host=${master01}  ansible_user=ubuntu ansible_ssh_private_key_file=/root/ansibleadminkey.pem 
dockermaster02 ansible_port=22 ansible_host=${master02}  ansible_user=ubuntu ansible_ssh_private_key_file=/root/ansibleadminkey.pem
dockermaster03 ansible_port=22 ansible_host=${master03}  ansible_user=ubuntu ansible_ssh_private_key_file=/root/ansibleadminkey.pem 
dockerworker01 ansible_port=22 ansible_host=${worker01}  ansible_user=ubuntu ansible_ssh_private_key_file=/root/ansibleadminkey.pem 
dockerworker02 ansible_port=22 ansible_host=${worker02}  ansible_user=ubuntu ansible_ssh_private_key_file=/root/ansibleadminkey.pem 
dockerworker03 ansible_port=22 ansible_host=${worker03}  ansible_user=ubuntu ansible_ssh_private_key_file=/root/ansibleadminkey.pem 

[docker_master]
dockermaster01

[docker_managers]
dockermaster02
dockermaster03

[docker_workers]
dockerworker01
dockerworker02
dockerworker03


