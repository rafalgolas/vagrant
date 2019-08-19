. /vagrant_config/install.env

sh /vagrant_scripts/prepare_u01_disk.sh

sh /vagrant_scripts/install_os_packages.sh

echo "******************************************************************************"
echo "Set root and oracle password and change ownership of /u01." `date`
echo "******************************************************************************"
echo -e "${ROOT_PASSWORD}\n${ROOT_PASSWORD}" | passwd
echo -e "${ORACLE_PASSWORD}\n${ORACLE_PASSWORD}" | passwd oracle
chown -R oracle:oinstall /u01
chmod -R 775 /u01

sh /vagrant_scripts/configure_hosts_base.sh

#sh /vagrant_scripts/configure_chrony.sh

sh /vagrant_scripts/configure_shared_disks.sh

su - oracle -c 'sh /vagrant/scripts/oracle_user_environment_setup.sh'

. /home/oracle/setEnv.sh

sh /vagrant_scripts/configure_hostname.sh

echo "******************************************************************************"
echo "Passwordless SSH Setup for root." `date`
echo "******************************************************************************"
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
rm -f *
cat /dev/zero | ssh-keygen -t dsa -q -N "" > /dev/null
cat id_dsa.pub >> authorized_keys
ssh ${NODE1_HOSTNAME} date
echo "${ROOT_PASSWORD}" > /tmp/temp1.txt

ssh-keyscan -H ${NODE1_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE2_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE3_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE4_HOSTNAME} >> ~/.ssh/known_hosts
sshpass -f /tmp/temp1.txt ssh-copy-id -i ~/.ssh/id_dsa.pub  ${NODE2_HOSTNAME}
sshpass -f /tmp/temp1.txt ssh-copy-id -i ~/.ssh/id_dsa.pub  ${NODE3_HOSTNAME}
sshpass -f /tmp/temp1.txt ssh-copy-id -i ~/.ssh/id_dsa.pub  ${NODE4_HOSTNAME}

cat > /tmp/ssh-setup.sh <<EOF
ssh-keyscan -H ${NODE1_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE2_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE3_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE4_HOSTNAME} >> ~/.ssh/known_hosts
sshpass -f /tmp/temp1.txt ssh-copy-id -i ~/.ssh/id_dsa.pub ${NODE1_HOSTNAME}
EOF

ssh ${NODE2_HOSTNAME} 'bash -s' < /tmp/ssh-setup.sh
ssh ${NODE3_HOSTNAME} 'bash -s' < /tmp/ssh-setup.sh
ssh ${NODE4_HOSTNAME} 'bash -s' < /tmp/ssh-setup.sh

su - oracle -c 'sh /vagrant/scripts/oracle_grid_software_unzip.sh'

echo "******************************************************************************"
echo "Install cvuqdisk package." `date`
echo "******************************************************************************"
yum install -y ${ORACLE_BASE}/software/grid/rpm/cvuqdisk-1.0.9-1.rpm
ssh root@${NODE2_HOSTNAME} yum install -y /tmp/cvuqdisk-1.0.9-1.rpm

sh /vagrant_scripts/configure_resolv.sh
