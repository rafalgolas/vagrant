echo "******************************************************************************"
echo "Unzip AUDIT data" `date`
echo "******************************************************************************"

export AUDITPKG=`ls /vagrant/audit_pkg_*.tar` 
echo $AUDITPKG

cd /vagrant/audit
##tar xvf $AUDITPKG

for gz in `find ./* |grep .gz`  
do
 echo "gunzip $gz"
## gunzip $gz
done

for zip in `find ./* |grep .zip`
do
 echo "unzip $zip"
## unzip -q $zip
done

echo "******************************************************************************"
echo " Load AWR data" `date`
echo "******************************************************************************"

echo $PWD
cd /vagrant/audit/awr_dump
AWRDMP=`ls *.dmp| cut -d'.' -f 1`
cd -

echo $AWRDMP

echo $PWD

sqlplus "/ as sysdba" << EOF
prompt drop  directory AWR
drop  directory AWR;
prompt create directory AWR as '/vagrant/audit/awr_dump'
create directory AWR as '/vagrant/audit/awr_dump';
define directory_name = 'AWR'
define file_name = $AWRDMP
define schema_name= 'AWR_STAGE'
define default_tablespace='USERS'
define temporary_tablespace='TEMP'
@?/rdbms/admin/awrload
EOF
