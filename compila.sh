# Script para compilar un único arquivo fonte Pro*C 
# Uso: ./compila.sh arquivo_fonte
# (non debe incluirse a extensión .pc)

proc config=ora-fic.cfg common_parser=yes iname=$1
gcc  -O2  -D_REENTRANT -DPRECOMP  -I. -I$ORACLE_HOME/precomp/public \
   -I$ORACLE_HOME/rdbms/public -I$ORACLE_HOME/rdbms/demo \
   -I$ORACLE_HOME/plsql/public -I$ORACLE_HOME/network/public \
   -DSLMXMX_ENABLE -DSLTS_ENABLE -Wno-unused-result  -Wno-implicit-int \
   -c $1.c
gcc -o $1 $1.o -L$ORACLE_HOME/lib/ -lclntsh 
