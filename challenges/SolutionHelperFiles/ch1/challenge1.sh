#!/bin/bash

RG_NAME='ejv-hackfest-rg'
ACS_NAME='ejvk8satl'
SSH_KEY_PATH='~/.ssh/id_rsa.pub'
MASTER_OS_DISK=50
AGENT_OS_DISK=120
SP_NAME='17630115-e5f3-490f-804e-8168732258ed'
SP_SECRET='4Ay6S5KQA3hqc'
DNS_PREFIX='ejvatlk8s'
VM_SIZE='Standard_D2_v2'
ADMIN_NAME='edvilla-atl'


az acs create --orchestrator-type Kubernetes -g $RG_NAME -n $ACS_NAME  \
--ssh-key-value $SSH_KEY_PATH --service-principal $SP_NAME --client-secret  \
$SP_SECRET --dns-prefix $DNS_PREFIX --master-count 1 --master-vm-size \
$VM_SIZE --master-storage-profile ManagedDisks --master-osdisk-size \
$MASTER_OS_DISK --agent-count 2 --agent-vm-size $VM_SIZE \
--agent-storage-profile ManagedDisks --agent-osdisk-size $AGENT_OS_DISK \
--admin-username $ADMIN_NAME
