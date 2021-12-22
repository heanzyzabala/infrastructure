#!/bin/bash

sudo yum -y update
curl -sfL https://get.k3s.io | K3S_TOKEN=token sh -s - --write-kubeconfig-mode 644

# When running with systemd, logs will be created in /var/log/syslog and viewed using journalctl -u k3s.
# /var/lib/rancher/k3s/server/node-token
# /usr/local/bin/k3s-uninstall.sh
# /usr/local/bin/k3s-agent-uninstall.sh
