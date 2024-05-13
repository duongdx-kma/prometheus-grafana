- ##### create client.pem key: the key has public key located in the server.

- ##### prerequisite:
> export VAULT_PASSWORD=my_vault_password

> chmod +x .vault_pass.py

- ##### provision observer 
> ansible-playbook provision.yaml -i inventory -t observer --vault-password-file .vault_pass.py

- ##### provision telegraf slave
> ansible-playbook provision.yaml -i inventory -t slave_servers

- ##### provision all:
> ansible-playbook provision.yaml -i inventory  --vault-password-file .vault_pass.py
