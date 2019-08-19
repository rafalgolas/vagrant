. /vagrant_config/install.env


echo "******************************************************************************"
echo "Create environment scripts." `date`
echo "******************************************************************************"

cat > /home/oracle/setEnv.sh <<EOF
# Oracle Settings
export TMP=/tmp
export TMPDIR=\$TMP

export ORACLE_HOSTNAME=${SRV1_FQ_HOSTNAME}
export ORACLE_UNQNAME=${ORACLE_UNQNAME}
export ORACLE_BASE=${ORACLE_BASE}
export ORA_INVENTORY=${ORA_INVENTORY}
export GRID_HOME=${GRID_HOME}
export DB_HOME=\$ORACLE_BASE/${DB_HOME_EXT}
export ORACLE_HOME=\$DB_HOME
export ORACLE_SID=${SRV1_ORACLE_SID}
export ORACLE_TERM=xterm
export BASE_PATH=/usr/sbin:\$PATH
export PATH=\$ORACLE_HOME/bin:\$BASE_PATH

export LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/lib:/usr/lib
export CLASSPATH=\$ORACLE_HOME/JRE:\$ORACLE_HOME/jlib:\$ORACLE_HOME/rdbms/jlib

alias cdoh='cd $ORACLE_HOME' 
alias dba='sqlplus / as sysdba' 
alias grid='. ~/grid.env; echo Grid Infrastructure env.' 
alias db='. /home/oracle/db.env; echo Database env.' 
export PS1="\$ORACLE_SID \[\e[31;1m\]\u\[\e[32;1m\]@\h:\[\e[33;1m\]\W\[\e[0m\]\\$ " 
EOF

cat >> /home/oracle/.bash_profile <<EOF
. /home/oracle/setEnv.sh
EOF

cat > /home/oracle/grid.env <<EOF
export ORACLE_SID=+ASM1
export ORACLE_HOME=\$GRID_HOME
export PATH=\$ORACLE_HOME/bin:\$BASE_PATH

export LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/lib:/usr/lib
export CLASSPATH=\$ORACLE_HOME/JRE:\$ORACLE_HOME/jlib:\$ORACLE_HOME/rdbms/jlib
export PS1="\$ORACLE_SID \[\e[31;1m\]\u\[\e[32;1m\]@\h:\[\e[33;1m\]\W\[\e[0m\]\\$ "
EOF

cat > /home/oracle/db.env <<EOF
export ORACLE_SID=${SRV1_ORACLE_SID}
export ORACLE_HOME=\$DB_HOME
export PATH=\$ORACLE_HOME/bin:\$BASE_PATH

export LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/lib:/usr/lib
export CLASSPATH=\$ORACLE_HOME/JRE:\$ORACLE_HOME/jlib:\$ORACLE_HOME/rdbms/jlib
export PS1="\$ORACLE_SID \[\e[31;1m\]\u\[\e[32;1m\]@\h:\[\e[33;1m\]\W\[\e[0m\]\\$ "
EOF

echo "******************************************************************************"
echo "Create directories." `date`
echo "******************************************************************************"
. /home/oracle/setEnv.sh
mkdir -p ${GRID_HOME}
mkdir -p ${DB_HOME}


