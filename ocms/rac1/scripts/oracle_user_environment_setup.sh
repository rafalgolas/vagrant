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
ssh ${NODE1_HOSTNAME} date
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

ssh ${NODE2_HOSTNAME} 'bash -s' < /tmp/ssh-setup.sh
ssh ${NODE3_HOSTNAME} 'bash -s' < /tmp/ssh-setup.sh
ssh ${NODE4_HOSTNAME} 'bash -s' < /tmp/ssh-setup.sh

#echo "******************************************************************************"
#echo "Unzip grid software." `date`
#echo "******************************************************************************"
#cd ${GRID_HOME}
#unzip -oq /vagrant/software/${GRID_SOFTWARE}

#scp ${GRID_HOME}/cv/rpm/cvuqdisk-1.0.10-1.rpm oracle@${NODE2_HOSTNAME}:/tmp

# Optional cluster verification.
#${GRID_HOME}/runcluvfy.sh stage -pre crsinst -n "${NODE1_HOSTNAME},${NODE2_HOSTNAME}"

