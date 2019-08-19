. /vagrant_config/install.env

echo "******************************************************************************"
echo "Setup resolv file." `date`
echo "******************************************************************************"
cat > /etc/resolv.conf <<EOF
search localdomain
nameserver ${DNS_PUBLIC_IP}
EOF
