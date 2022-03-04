#!/bin/bash
cat >> /etc/hosts <<EOF
$MASTER_IP  k3s
$WORKER_IP  k3s-worker1
EOF