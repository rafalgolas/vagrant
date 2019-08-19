echo "******************************************************************************"
echo "Amend hosts file with public, private and virtual IPs." `date`
echo "******************************************************************************"
cat >> /etc/hosts <<EOF
# Cluster servers
# Public
${NODE1_PUBLIC_IP}  ${NODE1_FQ_HOSTNAME}  ${NODE1_HOSTNAME}
${NODE2_PUBLIC_IP}  ${NODE2_FQ_HOSTNAME}  ${NODE2_HOSTNAME}
${NODE3_PUBLIC_IP}  ${NODE3_FQ_HOSTNAME}  ${NODE3_HOSTNAME}
${NODE4_PUBLIC_IP}  ${NODE4_FQ_HOSTNAME}  ${NODE4_HOSTNAME}
# Private
${NODE1_PRIV_IP}  ${NODE1_FQ_PRIVNAME}   ${NODE1_PRIVNAME}
${NODE2_PRIV_IP}  ${NODE2_FQ_PRIVNAME}   ${NODE2_PRIVNAME}
${NODE3_PRIV_IP}  ${NODE3_FQ_PRIVNAME}   ${NODE3_PRIVNAME}
${NODE4_PRIV_IP}  ${NODE4_FQ_PRIVNAME}   ${NODE4_PRIVNAME}
# Virtual
${NODE1_VIP_IP}  ${NODE1_FQ_VIPNAME}    ${NODE1_VIPNAME}
${NODE2_VIP_IP}  ${NODE2_FQ_VIPNAME}    ${NODE2_VIPNAME}
${NODE3_VIP_IP}  ${NODE3_FQ_VIPNAME}    ${NODE3_VIPNAME}
${NODE4_VIP_IP}  ${NODE4_FQ_VIPNAME}    ${NODE4_VIPNAME}

# Single servers
${SRV1_PUBLIC_IP}  ${SRV1_FQ_HOSTNAME}  ${SRV1_HOSTNAME}
${SRV2_PUBLIC_IP}  ${SRV2_FQ_HOSTNAME}  ${SRV2_HOSTNAME}
${OMS_PUBLIC_IP}  ${OMS_FQ_HOSTNAME}  ${OMS_HOSTNAME}
EOF
