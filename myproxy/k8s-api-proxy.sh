#!/bin/sh

set -o errexit
set -o pipefail
set -o nounset

# Get the external cluster IP
EXTERNAL_IP=$(curl -SsL --insecure https://kubernetes.default/api |
 jq -r '.serverAddressByClientCIDRs[0].serverAddress')

# Replace CLUSTER_IP in the rewrite filter and action file
sed -i "s/CLUSTER_IP/${EXTERNAL_IP}/g"\
 /etc/privoxy/k8s-rewrite-external.filter
sed -i "s/CLUSTER_IP/${EXTERNAL_IP}/g"\
 /etc/privoxy/k8s-only.action

# Start Privoxy un-daemonized
privoxy --no-daemon /etc/privoxy/config
