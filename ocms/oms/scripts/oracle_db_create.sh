. /vagrant_config/install.env

echo "******************************************************************************"
echo "Unzip database software." `date`
echo "******************************************************************************"

. /home/oracle/db.env


echo "******************************************************************************"
echo "Startup listener." `date`
echo "******************************************************************************"
lsnrctl start
lsnrctl status

echo "******************************************************************************"
echo "Create database ." `date`
echo "******************************************************************************"
dbca -silent -createDatabase -gdbName ${OMS_ORACLE_SID} \
-templateName /vagrant/scripts/emrep.dbt \
-characterSet AL32UTF8 \
-emConfiguration NONE \
-sysPassword ${SYS_PASSWORD} \
-systemPassword  ${SYS_PASSWORD} \
-redoLogFileSize 300 \
-initParams processes=500,job_queue_processes=20,session_cached_cursors=300 \
-totalMemory 4096

echo "******************************************************************************"
echo "Listener status." `date`
echo "******************************************************************************"

lsnrctl status