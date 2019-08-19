. /vagrant_config/install.env

echo "******************************************************************************"
echo "Do grid configuration." `date`
echo "******************************************************************************"

cat > /vagrant/scripts/cfgrsp.properties <<EOF
oracle.assistants.asm|S_ASMPASSWORD=${SYS_PASSWORD} 
oracle.assistants.asm|S_ASMMONITORPASSWORD=${SYS_PASSWORD} 
EOF

${GRID_HOME}/cfgtoollogs/configToolAllCommands RESPONSE_FILE=/vagrant/scripts/cfgrsp.properties

rm -rf /vagrant/scripts/cfgrsp.properties

echo "******************************************************************************"
echo "Check cluster configuration." `date`
echo "******************************************************************************"
${GRID_HOME}/bin/crsctl stat res -t
