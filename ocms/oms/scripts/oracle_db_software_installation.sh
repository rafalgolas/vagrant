. /vagrant_config/install.env

echo "******************************************************************************"
echo "Unzip database software." `date`
echo "******************************************************************************"
mkdir -p ${ORACLE_BASE}/software
cd ${ORACLE_BASE}/software
unzip -oq /vagrant/software/${DB_SOFTWAREOMS1}
unzip -oq /vagrant/software/${DB_SOFTWAREOMS2}
cd database



echo "******************************************************************************"
echo "Do database software-only installation." `date`
echo "******************************************************************************"
./runInstaller -ignorePrereq -waitforcompletion -silent \
        -responseFile /vagrant/scripts/omsdb11g.rsp \
        oracle.install.option=INSTALL_DB_SWONLY \
        ORACLE_HOSTNAME=${ORACLE_HOSTNAME} \
        UNIX_GROUP_NAME=oinstall \
        INVENTORY_LOCATION=${ORA_INVENTORY} \
        SELECTED_LANGUAGES=${ORA_LANGUAGES} \
        oracle.install.db.InstallEdition=EE 


##create db

## startup listener