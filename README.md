- ##### create client.pem key: the key has public key located in the server.

- ##### provision observer 
> ansible-playbook provision.yaml -i inventory -t observer

- ##### provision telegraf slave
> ansible-playbook provision.yaml -i inventory -t slave_servers
