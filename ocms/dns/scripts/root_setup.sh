. /vagrant_config/install.env

echo "******************************************************************************"
echo "Prepare yum with the latest repos." `date`
echo "******************************************************************************"
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
#cd /etc/yum.repos.d
#rm -f public-yum-ol7.repo
#wget https://yum.oracle.com/public-yum-ol7.repo

echo "******************************************************************************"
echo "Set Hostname." `date`
echo "******************************************************************************"
hostname ${ORACLE_HOSTNAME}
cat > /etc/hostname <<EOF
dns.localdomain
EOF

sh /vagrant_scripts/configure_hosts_base.sh
sh /vagrant_scripts/configure_hosts_scan.sh

echo "******************************************************************************"
echo "Install dnsmasq." `date`
echo "******************************************************************************"
yum install -y dnsmasq
chkconfig  dnsmasq on
service dnsmasq start
