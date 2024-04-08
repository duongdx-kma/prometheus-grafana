Observer role
=========

We will run prometheus, grafana, alter-manager as docker container. Then for prerequisite we must install docker first 

Role Variables
--------------
prometheus_version: `string` the prometheus version
grafana_version: `string` the grafana version
alertmanager_version: `string` the alertmanager version
alertmanagers_endpoint: `string` the alert manager endpoint (only hostname and port)
prometheus_endpoint: `string` the prometheus endpoint (only http://hostname and http://hostname:port)
discord_webhook_url: `string` the Discord webhook

telegraf_host: `map[string]` The list of telegraf hosts

node_host: `map[string]` The list of node_exporter hosts

Dependencies
------------
Docker

Notes
------------
Now playbook only support for Centos distribution
