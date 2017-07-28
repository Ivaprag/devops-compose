# DevOps Compose

A compose of following Docker containers:

* Jenkins
* Mattermost
* ownCloud
* PostgreSQL


## Setup

Execute the init script with the parameter start to setup your containers.

```
# You might need to use 'sudo' before to execute properly
./init.lsb.sh start
```

You can also do [ stop | restart | status ]


## Backup and Restore

It may be best to backup and restore volumes under `/var/lib/docker/volumes`.

## Contribution

This is an open source software licensed under Apache-2.0.
Feel free to open issues or pull requests.
