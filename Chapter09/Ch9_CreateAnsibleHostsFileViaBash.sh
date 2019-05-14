############ Remove then Create Temp.Hosts file with target IP.
file="$WORKSPACE/temp.hosts"
[[ -f "$file" ]] && rm -f "$file"
echo “[all]” >> $WORKSPACE/temp.host
echo “$ANSIBLETARGETIP” >> $WORKSPACE/temp.host 

############ Execute the Ansible Playbook.
export PYTHONUNBUFFERED=1
ansible-playbook -i /$WORKSPACE/temp.hosts /$WORKSPACE/infrastructure/ansible-playbooks/$ANSIBLEPLAYBOOK.yml --user root --verbose

