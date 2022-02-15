#!/bin/bash

export PROJECTNAME="."

# TO DO : test $PROJECTNAME
echo "the project location is : $PROJECTNAME"
echo "removing libs"
vdel -lib $PROJECTNAME/LIB/LIB_AES -all
vdel -lib $PROJECTNAME/LIB/LIB_RTL -all
vdel -lib $PROJECTNAME/LIB/LIB_BENCH -all

echo "creating library "
vlib $PROJECTNAME/LIB/LIB_AES
vmap LIB_AES $PROJECTNAME/LIB/LIB_AES
vlib $PROJECTNAME/LIB/LIB_RTL
vmap LIB_RTL $PROJECTNAME/LIB/LIB_RTL
vlib $PROJECTNAME/LIB/LIB_BENCH
vmap LIB_BENCH $PROJECTNAME/LIB/LIB_BENCH

echo "compile third party library"
vcom -work LIB_AES $PROJECTNAME/SRC/THIRDPARTY/state_definition_package.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/Utility_package.vhd

echo "compile vhdl sources"
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/Counter.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/KeyExpansion_table.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/InvShiftRows.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/AddRoundKey.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/InvSBox.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/InvSubBytes.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/InvMixColumns.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/InvMixTable.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/Multiplexeur.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/Registre.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/InvAESRound.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/FSM_invAES.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/InvAES.vhd

echo "compile vhdl conf files"
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/InvMixColumns_conf.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/InvSubBytes_conf.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/InvAESRound_conf.vhd
vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/InvAES_conf.vhd

echo "compile vhdl test bench"
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/Counter_tb.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/KeyExpansion_table_tb.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvShiftRows_tb.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/AddRoundKey_tb.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvSBox_tb.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvSubBytes_tb.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvMixColumns_tb.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvMixTable_tb.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvAESRound_tb.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/FSM_invAES_tb.vhd
vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvAES_tb.vhd

echo "compile vhdl test bench conf files"
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/Counter_tb_conf.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/KeyExpansion_table_tb_conf.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvShiftRows_tb_conf.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/AddRoundKey_tb_conf.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvSBox_tb_conf.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvSubBytes_tb_conf.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvMixTable_tb_conf.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvMixColumns_tb_conf.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvAESRound_tb_conf.vhd
# vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/FSM_invAES_tb_conf.vhd
vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/InvAES_tb_conf.vhd

echo "compilation finished"

echo "start simulation..."
# ATTENTION un seul VSIM decommenté à la fois!
# vsim  LIB_BENCH.Counter_tb_conf
# vsim	LIB_BENCH.KeyExpansion_table_tb_conf
# vsim	LIB_BENCH.InvShiftRows_tb_conf
# vsim	LIB_BENCH.AddRoundKey_tb_conf
# vsim  LIB_BENCH.InvSBox_tb_conf
# vsim  LIB_BENCH.InvSubBytes_tb_conf
# vsim  LIB_BENCH.InvMixTable_tb_conf
# vsim  LIB_BENCH.InvMixColumns_tb_conf
# vsim  LIB_BENCH.InvAESRound_tb_conf
# vsim  LIB_BENCH.FSM_invAES_tb_conf
vsim  LIB_BENCH.InvAES_tb_conf
