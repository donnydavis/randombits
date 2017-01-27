#!/bin/bash
source ~/stackrc
echo '[controller]' > hosts
export CONT_VMS=$(nova list | grep controller |awk '{print $12}' |cut -f2 -d '=')
export COMP_VMS=$(nova list | grep compute |awk '{print $12}' |cut -f2 -d '=')
for i in $CONT_VMS; do echo $i >> hosts ; done
echo '[compute]' >> hosts
for v in $COMP_VMS; do echo $v >> hosts ; done

ansible-playbook -i hosts main.yaml
