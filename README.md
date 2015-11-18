## my collection of mcollective plugins

agents:

- monit	[summary, stop, start, status] (monit process only)

data:

- monit	# discovery query, match monit process status


examples:

```
# mco rpc monit summary
# mco rpc monit status service="tomcat"
# mco rpc monit stop service="tomcat"
# mco rpc monit start service="tomcat"
# mco ping -S "monit('tomcat').status=running"
```
