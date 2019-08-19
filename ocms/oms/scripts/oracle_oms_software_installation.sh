. /vagrant_config/install.env

echo "******************************************************************************"
echo "Unzip OMS software." `date`
echo "******************************************************************************"
mkdir -p ${ORACLE_BASE}/software
cd ${ORACLE_BASE}/software
rm -rf database
unzip -oq /vagrant/software/${OMS_SOFTWARE1}
unzip -oq /vagrant/software/${OMS_SOFTWARE2}
unzip -oq /vagrant/software/${OMS_SOFTWARE3}

mkdir -p ${OMS_HOME}
mkdir -p ${OMS_MIDDLEWARE_HOME}
mkdir -p ${AGENT_HOME}

echo "******************************************************************************"
echo "Do OMS installation." `date`
echo "******************************************************************************"
./runInstaller -silent -waitforcompletion \
-responseFile ${ORACLE_BASE}/software/response/new_install.rsp \
SECURITY_UPDATES_VIA_MYORACLESUPPORT=false \
DECLINE_SECURITY_UPDATES=true \
ORACLE_INSTANCE_HOME_LOCATION=${OMS_HOME} \
ORACLE_MIDDLEWARE_HOME_LOCATION=${OMS_MIDDLEWARE_HOME} \
AGENT_BASE_DIR=${AGENT_HOME} \
WLS_ADMIN_SERVER_USERNAME=weblogic \
WLS_ADMIN_SERVER_PASSWORD=${SYS_PASSWORD} \
WLS_ADMIN_SERVER_CONFIRM_PASSWORD=${SYS_PASSWORD} \
NODE_MANAGER_PASSWORD=${SYS_PASSWORD} \
NODE_MANAGER_CONFIRM_PASSWORD=${SYS_PASSWORD} \
DATABASE_HOSTNAME=localhost \
LISTENER_PORT=1521 \
SERVICENAME_OR_SID=emrep \
SYS_PASSWORD=${SYS_PASSWORD} \
SYSMAN_PASSWORD=${SYS_PASSWORD} \
SYSMAN_CONFIRM_PASSWORD=${SYS_PASSWORD} \
DEPLOYMENT_SIZE="SMALL" \
AGENT_REGISTRATION_PASSWORD=${SYS_PASSWORD} \
AGENT_REGISTRATION_CONFIRM_PASSWORD=${SYS_PASSWORD}
