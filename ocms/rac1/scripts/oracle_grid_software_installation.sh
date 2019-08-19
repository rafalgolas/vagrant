. /vagrant_config/install.env

echo "******************************************************************************"
echo "Do grid software-only installation." `date`
echo "******************************************************************************"
#${ORACLE_BASE}/software/grid/runInstaller  -ignorePrereq -silent -responseFile ${ORACLE_BASE}/software/grid/response/grid_install.rsp \
#        INVENTORY_LOCATION=${ORA_INVENTORY} \

${ORACLE_BASE}/software/grid/runInstaller  -ignorePrereq  -waitforcompletion  -silent -responseFile  /vagrant/scripts/grid.rsp  \
        SELECTED_LANGUAGES=${ORA_LANGUAGES} \
        oracle.install.option=CRS_CONFIG \
        ORACLE_BASE=${ORACLE_BASE} \
        ORACLE_HOME=${GRID_HOME} \
        oracle.install.asm.OSDBA=dba \
        oracle.install.asm.OSASM=dba \
        oracle.install.crs.config.gpnp.scanName=${SCAN_NAME} \
        oracle.install.crs.config.gpnp.scanPort=${SCAN_PORT} \
        oracle.install.crs.config.ClusterType=STANDARD \
        oracle.install.crs.config.clusterName=${CLUSTER_NAME} \
        oracle.install.crs.config.gpnp.configureGNS=false \
        oracle.install.crs.config.autoConfigureClusterNodeVIP=false \
        oracle.install.crs.config.clusterNodes=${NODE1_FQ_HOSTNAME}:${NODE1_FQ_VIPNAME},${NODE2_FQ_HOSTNAME}:${NODE2_FQ_VIPNAME} \
        oracle.install.crs.config.networkInterfaceList=${NET_DEVICE1}:${PUBLIC_SUBNET}:1,${NET_DEVICE2}:${PRIVATE_SUBNET}:5 \
        oracle.install.crs.config.useIPMI=false \
        oracle.install.asm.storageOption=FLEX_ASM_STORAGE \
        oracle.install.asm.SYSASMPassword=${SYS_PASSWORD} \
        oracle.install.asm.diskGroup.name=data \
        oracle.install.asm.diskGroup.redundancy=EXTERNAL \
        oracle.install.crs.config.sharedFileSystemStorage.ocrRedundancy=1 \
        oracle.install.asm.diskGroup.AUSize=4 \
        oracle.install.asm.diskGroup.disks=/dev/oracleasm/asm-disk1,/dev/oracleasm/asm-disk2,/dev/oracleasm/asm-disk3,/dev/oracleasm/asm-disk4 \
        oracle.install.asm.diskGroup.diskDiscoveryString=/dev/oracleasm/* \
        oracle.install.asm.monitorPassword=${SYS_PASSWORD} \
        oracle.install.crs.config.ignoreDownNodes=false \
        oracle.install.config.managementOption=NONE \
        oracle.install.config.omsPort=0 \
        oracle.install.crs.rootconfig.executeRootScript=false
