. /vagrant_config/install.env

su - oracle -c 'sh /vagrant/scripts/oracle_grid_software_installation.sh'

echo "******************************************************************************"
echo "Run grid root scripts." `date`
echo "******************************************************************************"
sh ${ORA_INVENTORY}/orainstRoot.sh
ssh root@${NODE2_HOSTNAME} sh ${ORA_INVENTORY}/orainstRoot.sh
sh ${GRID_HOME}/root.sh
ssh root@${NODE2_HOSTNAME} sh ${GRID_HOME}/root.sh

su - oracle -c 'sh /vagrant/scripts/oracle_grid_software_config.sh'

## bez instalacji
##su - oracle -c 'sh /vagrant/scripts/oracle_grid_software_installation.sh'
##
##echo "******************************************************************************"
##echo "Run grid root scripts." `date`
##echo "******************************************************************************"
##sh ${ORA_INVENTORY}/orainstRoot.sh
##ssh root@${NODE2_HOSTNAME} sh ${ORA_INVENTORY}/orainstRoot.sh
##sh ${GRID_HOME}/root.sh
##ssh root@${NODE2_HOSTNAME} sh ${GRID_HOME}/root.sh
##
##su - oracle -c 'sh /vagrant/scripts/oracle_grid_software_config.sh'
##
##su - oracle -c 'sh /vagrant/scripts/oracle_db_software_installation.sh'
##
##echo "******************************************************************************"
##echo "Run DB root scripts." `date` 
##echo "******************************************************************************"
##sh ${ORACLE_HOME}/root.sh
##ssh root@${NODE2_HOSTNAME} sh ${ORACLE_HOME}/root.sh
##
##su - oracle -c 'sh /vagrant/scripts/oracle_create_database.sh'


