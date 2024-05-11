<h3>Note for prometheus</h3>

- ##### testing rules for correct syntax
> install promtool
> promtool check rules /etc/prometheus/rules/rule_file.yml

- ##### Prometheus running without docker:
> get prometheus PID: ps aux | grep prometheus
> KILL -HUP $(get prometheus PID: ps aux | grep prometheus)
> prometheus --web.enable-lifecycle 
> curl -X POST http://localhost:9090/-/reload

- ##### Prometheus running as docker container:
> docker kill -s SIGHUP prometheus


<h3>Note for alert manager</h3>
https://www.pluralsight.com/cloud-guru/labs/aws/installing-prometheus-alertmanager

- ##### testing rules for correct syntax
> install amtool
> amtool check-config config_file.yml

- ##### Prometheus running as docker container:
> docker kill -s SIGHUP alertmanager
