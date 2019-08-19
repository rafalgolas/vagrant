. /vagrant_config/install.env

echo "******************************************************************************"
echo "Unzip grid software." `date`
echo "******************************************************************************"

mkdir -p ${ORACLE_BASE}/software
cd ${ORACLE_BASE}/software
unzip -oq /vagrant/software/${GRID_SOFTWARE1}
unzip -oq /vagrant/software/${GRID_SOFTWARE2}
cd grid


scp ${ORACLE_BASE}/software/grid/rpm/cvuqdisk-1.0.9-1.rpm oracle@${NODE2_HOSTNAME}:/tmp
