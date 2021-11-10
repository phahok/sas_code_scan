# Declaracao de variaveis
SAS_HOME=/sasbin
PROG_HOME=/sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos
QTD_DIAS_LOG=365

DATA=`date "+%y%m%d_%H%M"`

PROG_LOGDIR=$PROG_HOME/log_RODA_FCM
PROG_LOG=$PROG_LOGDIR/START_RODA_FCM_"$DATA".log

find $PROG_LOGDIR -name '*.log' -mtime +$QTD_DIAS_LOG -exec rm -f {} \;

$SAS_HOME/SASFoundation/9.4/bin/sas_u8 $PROG_HOME/RODA_FCM.sas -log $PROG_LOG -sysparm $PROG_HOME

RC=$?

if [ $RC = 1 ]; then
        RC=0
fi

exit $RC

