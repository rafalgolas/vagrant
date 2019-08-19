. /vagrant_config/install.env

sh /vagrant_scripts/oracle_user_environment_common.sh

echo "******************************************************************************"
echo "Passwordless SSH Setup for oracle." `date`
echo "******************************************************************************"
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
rm -f *
cat /dev/zero | ssh-keygen -t dsa -q -N "" > /dev/null
cat id_dsa.pub >> authorized_keys
ssh ${NODE2_HOSTNAME} date
echo "${ORACLE_PASSWORD}" > /tmp/temp2.txt


ssh-keyscan -H ${NODE1_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE2_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE3_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE4_HOSTNAME} >> ~/.ssh/known_hosts
sshpass -f /tmp/temp2.txt ssh-copy-id -i ~/.ssh/id_dsa.pub ${NODE2_HOSTNAME}
sshpass -f /tmp/temp2.txt ssh-copy-id -i ~/.ssh/id_dsa.pub ${NODE3_HOSTNAME}
sshpass -f /tmp/temp2.txt ssh-copy-id -i ~/.ssh/id_dsa.pub ${NODE4_HOSTNAME}

cat > /tmp/ssh-setup.sh <<EOF
ssh-keyscan -H ${NODE1_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE2_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE3_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE4_HOSTNAME} >> ~/.ssh/known_hosts
sshpass -f /tmp/temp2.txt ssh-copy-id -i ~/.ssh/id_dsa.pub ${NODE1_HOSTNAME}
EOF

ssh ${NODE1_HOSTNAME} 'bash -s' < /tmp/ssh-setup.sh
ssh ${NODE3_HOSTNAME} 'bash -s' < /tmp/ssh-setup.sh
ssh ${NODE4_HOSTNAME} 'bash -s' < /tmp/ssh-setup.sh
