<h3>encrypt sensitive data with Ansible Vault</h3>

- ##### ansible-vault: generate private data: (then enter password, confirm password -> value need encrypt -> we will obtain data encrypted inside vault.yml) 
> ansible-vault create vault.yml

- ##### ansible-vault: generate private data with exist file: 'unencrypted stuff'
> echo 'unencrypted stuff' > encrypt_me.txt 

> ansible-vault encrypt encrypt_me.txt

> cat encrypt_me.txt

- ##### ansible-vault: view encrypted value:
> ansible-vault view vault.yml

- ##### ansible-vault: edit encrypted value:
> ansible-vault edit vault.yml

- ##### ansible-vault: decrypt data:
> ansible-vault decrypt vault.yml

- ##### ansible-vault: change password of encrypted file:
> ansible-vault rekey vault.yml
