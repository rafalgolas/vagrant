. /vagrant_config/install.env

sh /vagrant_scripts/prepare_u01_disk.sh

sh /vagrant_scripts/install_os_packages.sh

# tylko pod OMS 11.2.0.4
yum install -y glibc-devel.i686
yum install -y oracle-rdbms-server-11gR2-preinstall

echo "******************************************************************************"
echo "Set root and oracle password and change ownership of /u01." `date`
echo "******************************************************************************"
echo -e "${ROOT_PASSWORD}\n${ROOT_PASSWORD}" | passwd
echo -e "${ORACLE_PASSWORD}\n${ORACLE_PASSWORD}" | passwd oracle
chown -R oracle:oinstall /u01
chmod -R 775 /u01

sh /vagrant_scripts/configure_hosts_base.sh

sh /vagrant_scripts/configure_resolv.sh

#sh /vagrant_scripts/configure_chrony.sh

su - oracle -c 'sh /vagrant/scripts/oracle_user_environment_setup.sh'
. /home/oracle/setEnv.sh

sh /vagrant_scripts/configure_hostname.sh

su - oracle -c 'sh  /vagrant/scripts/oracle_db_software_installation.sh'

sh ${ORA_INVENTORY}/orainstRoot.sh
sh ${ORACLE_BASE}/${DB_HOME_OMS}/root.sh

su - oracle -c 'sh  /vagrant/scripts/oracle_db_create.sh'

su - oracle -c 'sh  /vagrant/scripts/oracle_oms_software_installation.sh'


