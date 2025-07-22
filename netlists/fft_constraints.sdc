###################################################################

# Created by write_sdc on Tue Jul 22 15:32:08 2025

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_max_capacitance 0.1 [get_ports in_stall]
set_max_capacitance 0.1 [get_ports out_push_F]
set_max_capacitance 0.1 [get_ports {out_real_F[15]}]
set_max_capacitance 0.1 [get_ports {out_real_F[14]}]
set_max_capacitance 0.1 [get_ports {out_real_F[13]}]
set_max_capacitance 0.1 [get_ports {out_real_F[12]}]
set_max_capacitance 0.1 [get_ports {out_real_F[11]}]
set_max_capacitance 0.1 [get_ports {out_real_F[10]}]
set_max_capacitance 0.1 [get_ports {out_real_F[9]}]
set_max_capacitance 0.1 [get_ports {out_real_F[8]}]
set_max_capacitance 0.1 [get_ports {out_real_F[7]}]
set_max_capacitance 0.1 [get_ports {out_real_F[6]}]
set_max_capacitance 0.1 [get_ports {out_real_F[5]}]
set_max_capacitance 0.1 [get_ports {out_real_F[4]}]
set_max_capacitance 0.1 [get_ports {out_real_F[3]}]
set_max_capacitance 0.1 [get_ports {out_real_F[2]}]
set_max_capacitance 0.1 [get_ports {out_real_F[1]}]
set_max_capacitance 0.1 [get_ports {out_real_F[0]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[15]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[14]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[13]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[12]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[11]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[10]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[9]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[8]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[7]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[6]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[5]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[4]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[3]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[2]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[1]}]
set_max_capacitance 0.1 [get_ports {out_imag_F[0]}]
set_max_fanout 16 [get_ports clk]
set_max_fanout 16 [get_ports reset]
set_max_fanout 16 [get_ports in_push]
set_max_fanout 16 [get_ports {in_real[15]}]
set_max_fanout 16 [get_ports {in_real[14]}]
set_max_fanout 16 [get_ports {in_real[13]}]
set_max_fanout 16 [get_ports {in_real[12]}]
set_max_fanout 16 [get_ports {in_real[11]}]
set_max_fanout 16 [get_ports {in_real[10]}]
set_max_fanout 16 [get_ports {in_real[9]}]
set_max_fanout 16 [get_ports {in_real[8]}]
set_max_fanout 16 [get_ports {in_real[7]}]
set_max_fanout 16 [get_ports {in_real[6]}]
set_max_fanout 16 [get_ports {in_real[5]}]
set_max_fanout 16 [get_ports {in_real[4]}]
set_max_fanout 16 [get_ports {in_real[3]}]
set_max_fanout 16 [get_ports {in_real[2]}]
set_max_fanout 16 [get_ports {in_real[1]}]
set_max_fanout 16 [get_ports {in_real[0]}]
set_max_fanout 16 [get_ports {in_imag[15]}]
set_max_fanout 16 [get_ports {in_imag[14]}]
set_max_fanout 16 [get_ports {in_imag[13]}]
set_max_fanout 16 [get_ports {in_imag[12]}]
set_max_fanout 16 [get_ports {in_imag[11]}]
set_max_fanout 16 [get_ports {in_imag[10]}]
set_max_fanout 16 [get_ports {in_imag[9]}]
set_max_fanout 16 [get_ports {in_imag[8]}]
set_max_fanout 16 [get_ports {in_imag[7]}]
set_max_fanout 16 [get_ports {in_imag[6]}]
set_max_fanout 16 [get_ports {in_imag[5]}]
set_max_fanout 16 [get_ports {in_imag[4]}]
set_max_fanout 16 [get_ports {in_imag[3]}]
set_max_fanout 16 [get_ports {in_imag[2]}]
set_max_fanout 16 [get_ports {in_imag[1]}]
set_max_fanout 16 [get_ports {in_imag[0]}]
set_max_fanout 16 [get_ports out_stall]
create_clock [get_ports clk]  -name MYCLK  -period 10  -waveform {0 5}
set_clock_uncertainty -setup 1  [get_clocks MYCLK]
set_clock_uncertainty -hold 0.2  [get_clocks MYCLK]
set_clock_transition -max -rise 0.1 [get_clocks MYCLK]
set_clock_transition -max -fall 0.1 [get_clocks MYCLK]
set_clock_transition -min -rise 0.1 [get_clocks MYCLK]
set_clock_transition -min -fall 0.1 [get_clocks MYCLK]
set_false_path   -from [get_ports reset]  -to [list [get_cells out_push_F_reg] [get_cells -hsc @                        \
{butterfly_0/Zrb_F_reg[0]}] [get_cells -hsc @ {butterfly_0/Zrb_F_reg[1]}]      \
[get_cells -hsc @ {butterfly_0/Zrb_F_reg[2]}] [get_cells -hsc @                \
{butterfly_0/Zrb_F_reg[3]}] [get_cells -hsc @ {butterfly_0/Zrb_F_reg[4]}]      \
[get_cells -hsc @ {butterfly_0/Zrb_F_reg[5]}] [get_cells -hsc @                \
{butterfly_0/Zrb_F_reg[6]}] [get_cells -hsc @ {butterfly_0/Zrb_F_reg[7]}]      \
[get_cells -hsc @ {butterfly_0/Zrb_F_reg[8]}] [get_cells -hsc @                \
{butterfly_0/Zrb_F_reg[9]}] [get_cells -hsc @ {butterfly_0/Zrb_F_reg[10]}]     \
[get_cells -hsc @ {butterfly_0/Zrb_F_reg[11]}] [get_cells -hsc @               \
{butterfly_0/Zrb_F_reg[12]}] [get_cells -hsc @ {butterfly_0/Zrb_F_reg[13]}]    \
[get_cells -hsc @ {butterfly_0/Zrb_F_reg[14]}] [get_cells -hsc @               \
{butterfly_0/Zrb_F_reg[15]}] [get_cells -hsc @ {butterfly_0/Zrb_F_reg[16]}]    \
[get_cells -hsc @ {butterfly_0/Zrb_F_reg[17]}] [get_cells -hsc @               \
{butterfly_0/Zrb_F_reg[18]}] [get_cells -hsc @ {butterfly_0/Zrb_F_reg[19]}]    \
[get_cells -hsc @ {butterfly_0/Zrb_F_reg[20]}] [get_cells -hsc @               \
{butterfly_0/Zrb_F_reg[21]}] [get_cells -hsc @ {butterfly_0/Zrb_F_reg[22]}]    \
[get_cells -hsc @ {butterfly_0/Zrb_F_reg[23]}] [get_cells -hsc @               \
{butterfly_0/Zrb_F_reg[24]}] [get_cells -hsc @ {butterfly_0/Zrb_F_reg[25]}]    \
[get_cells -hsc @ {butterfly_0/Zrb_F_reg[26]}] [get_cells -hsc @               \
{butterfly_0/Zrb_F_reg[27]}] [get_cells -hsc @ {butterfly_0/Zra_F_reg[0]}]     \
[get_cells -hsc @ {butterfly_0/Zra_F_reg[1]}] [get_cells -hsc @                \
{butterfly_0/Zra_F_reg[2]}] [get_cells -hsc @ {butterfly_0/Zra_F_reg[3]}]      \
[get_cells -hsc @ {butterfly_0/Zra_F_reg[4]}] [get_cells -hsc @                \
{butterfly_0/Zra_F_reg[5]}] [get_cells -hsc @ {butterfly_0/Zra_F_reg[6]}]      \
[get_cells -hsc @ {butterfly_0/Zra_F_reg[7]}] [get_cells -hsc @                \
{butterfly_0/Zra_F_reg[8]}] [get_cells -hsc @ {butterfly_0/Zra_F_reg[9]}]      \
[get_cells -hsc @ {butterfly_0/Zra_F_reg[10]}] [get_cells -hsc @               \
{butterfly_0/Zra_F_reg[11]}] [get_cells -hsc @ {butterfly_0/Zra_F_reg[12]}]    \
[get_cells -hsc @ {butterfly_0/Zra_F_reg[13]}] [get_cells -hsc @               \
{butterfly_0/Zra_F_reg[14]}] [get_cells -hsc @ {butterfly_0/Zra_F_reg[15]}]    \
[get_cells -hsc @ {butterfly_0/Zra_F_reg[16]}] [get_cells -hsc @               \
{butterfly_0/Zra_F_reg[17]}] [get_cells -hsc @ {butterfly_0/Zra_F_reg[18]}]    \
[get_cells -hsc @ {butterfly_0/Zra_F_reg[19]}] [get_cells -hsc @               \
{butterfly_0/Zra_F_reg[20]}] [get_cells -hsc @ {butterfly_0/Zra_F_reg[21]}]    \
[get_cells -hsc @ {butterfly_0/Zra_F_reg[22]}] [get_cells -hsc @               \
{butterfly_0/Zra_F_reg[23]}] [get_cells -hsc @ {butterfly_0/Zra_F_reg[24]}]    \
[get_cells -hsc @ {butterfly_0/Zra_F_reg[25]}] [get_cells -hsc @               \
{butterfly_0/Zra_F_reg[26]}] [get_cells -hsc @ {butterfly_0/Zra_F_reg[27]}]    \
[get_cells -hsc @ {butterfly_0/Yi_F_reg[0]}] [get_cells -hsc @                 \
{butterfly_0/Yi_F_reg[1]}] [get_cells -hsc @ {butterfly_0/Yi_F_reg[2]}]        \
[get_cells -hsc @ {butterfly_0/Yi_F_reg[3]}] [get_cells -hsc @                 \
{butterfly_0/Yi_F_reg[4]}] [get_cells -hsc @ {butterfly_0/Yi_F_reg[5]}]        \
[get_cells -hsc @ {butterfly_0/Yi_F_reg[6]}] [get_cells -hsc @                 \
{butterfly_0/Yi_F_reg[7]}] [get_cells -hsc @ {butterfly_0/Yi_F_reg[8]}]        \
[get_cells -hsc @ {butterfly_0/Yi_F_reg[9]}] [get_cells -hsc @                 \
{butterfly_0/Yi_F_reg[10]}] [get_cells -hsc @ {butterfly_0/Yi_F_reg[11]}]      \
[get_cells -hsc @ {butterfly_0/Yi_F_reg[12]}] [get_cells -hsc @                \
{butterfly_0/Yi_F_reg[13]}] [get_cells -hsc @ {butterfly_0/Yi_F_reg[14]}]      \
[get_cells -hsc @ {butterfly_0/Yi_F_reg[15]}] [get_cells -hsc @                \
{butterfly_0/Yr_F_reg[0]}] [get_cells -hsc @ {butterfly_0/Yr_F_reg[1]}]        \
[get_cells -hsc @ {butterfly_0/Yr_F_reg[2]}] [get_cells -hsc @                 \
{butterfly_0/Yr_F_reg[3]}] [get_cells -hsc @ {butterfly_0/Yr_F_reg[4]}]        \
[get_cells -hsc @ {butterfly_0/Yr_F_reg[5]}] [get_cells -hsc @                 \
{butterfly_0/Yr_F_reg[6]}] [get_cells -hsc @ {butterfly_0/Yr_F_reg[7]}]        \
[get_cells -hsc @ {butterfly_0/Yr_F_reg[8]}] [get_cells -hsc @                 \
{butterfly_0/Yr_F_reg[9]}] [get_cells -hsc @ {butterfly_0/Yr_F_reg[10]}]       \
[get_cells -hsc @ {butterfly_0/Yr_F_reg[11]}] [get_cells -hsc @                \
{butterfly_0/Yr_F_reg[12]}] [get_cells -hsc @ {butterfly_0/Yr_F_reg[13]}]      \
[get_cells -hsc @ {butterfly_0/Yr_F_reg[14]}] [get_cells -hsc @                \
{butterfly_0/Yr_F_reg[15]}] [get_cells -hsc @ {butterfly_0/Xi_F_reg[0]}]       \
[get_cells -hsc @ {butterfly_0/Xi_F_reg[1]}] [get_cells -hsc @                 \
{butterfly_0/Xi_F_reg[2]}] [get_cells -hsc @ {butterfly_0/Xi_F_reg[3]}]        \
[get_cells -hsc @ {butterfly_0/Xi_F_reg[4]}] [get_cells -hsc @                 \
{butterfly_0/Xi_F_reg[5]}] [get_cells -hsc @ {butterfly_0/Xi_F_reg[6]}]        \
[get_cells -hsc @ {butterfly_0/Xi_F_reg[7]}] [get_cells -hsc @                 \
{butterfly_0/Xi_F_reg[8]}] [get_cells -hsc @ {butterfly_0/Xi_F_reg[9]}]        \
[get_cells -hsc @ {butterfly_0/Xi_F_reg[10]}] [get_cells -hsc @                \
{butterfly_0/Xi_F_reg[11]}] [get_cells -hsc @ {butterfly_0/Xi_F_reg[12]}]      \
[get_cells -hsc @ {butterfly_0/Xi_F_reg[13]}] [get_cells -hsc @                \
{butterfly_0/Xi_F_reg[14]}] [get_cells -hsc @ {butterfly_0/Xi_F_reg[15]}]      \
[get_cells -hsc @ {butterfly_0/Xi_full_F_reg[13]}] [get_cells -hsc @           \
{butterfly_0/Xi_full_F_reg[14]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[15]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[16]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[17]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[18]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[19]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[20]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[21]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[22]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[23]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[24]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[25]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[26]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[27]}] [get_cells -hsc @                             \
{butterfly_0/Xi_full_F_reg[28]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[13]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[14]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[15]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[16]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[17]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[18]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[19]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[20]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[21]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[22]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[23]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[24]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[25]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[26]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[27]}] [get_cells -hsc @                             \
{butterfly_0/Yr_full_F_reg[28]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[13]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[14]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[15]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[16]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[17]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[18]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[19]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[20]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[21]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[22]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[23]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[24]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[25]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[26]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[27]}] [get_cells -hsc @                             \
{butterfly_0/Yi_full_F_reg[28]}] [get_cells -hsc @ {butterfly_0/Wi_F_reg[0]}]  \
[get_cells -hsc @ {butterfly_0/Wi_F_reg[1]}] [get_cells -hsc @                 \
{butterfly_0/Wi_F_reg[6]}] [get_cells -hsc @ {butterfly_0/Wi_F_reg[9]}]        \
[get_cells -hsc @ {butterfly_0/Wi_F_reg[10]}] [get_cells -hsc @                \
{butterfly_0/Wi_F_reg[12]}] [get_cells -hsc @ {butterfly_0/Wi_F_reg[13]}]      \
[get_cells -hsc @ {butterfly_0/Wi_F_reg[14]}] [get_cells -hsc @                \
{butterfly_0/Ai_Fd2_reg[0]}] [get_cells -hsc @ {butterfly_0/Ai_Fd2_reg[1]}]    \
[get_cells -hsc @ {butterfly_0/Ai_Fd2_reg[2]}] [get_cells -hsc @               \
{butterfly_0/Ai_Fd2_reg[3]}] [get_cells -hsc @ {butterfly_0/Ai_Fd2_reg[4]}]    \
[get_cells -hsc @ {butterfly_0/Ai_Fd2_reg[5]}] [get_cells -hsc @               \
{butterfly_0/Ai_Fd2_reg[6]}] [get_cells -hsc @ {butterfly_0/Ai_Fd2_reg[7]}]    \
[get_cells -hsc @ {butterfly_0/Ai_Fd2_reg[8]}] [get_cells -hsc @               \
{butterfly_0/Ai_Fd2_reg[9]}] [get_cells -hsc @ {butterfly_0/Ai_Fd2_reg[10]}]   \
[get_cells -hsc @ {butterfly_0/Ai_Fd2_reg[11]}] [get_cells -hsc @              \
{butterfly_0/Ai_Fd2_reg[12]}] [get_cells -hsc @ {butterfly_0/Ai_Fd2_reg[13]}]  \
[get_cells -hsc @ {butterfly_0/Ai_Fd2_reg[14]}] [get_cells -hsc @              \
{butterfly_0/Ai_Fd2_reg[15]}] [get_cells -hsc @                                \
{butterfly_0/Xr_full_F_reg[13]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[14]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[15]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[16]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[17]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[18]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[19]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[20]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[21]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[22]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[23]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[24]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[25]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[26]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[27]}] [get_cells -hsc @                             \
{butterfly_0/Xr_full_F_reg[28]}] [get_cells -hsc @                             \
{butterfly_0/Ar_Fd2_reg[0]}] [get_cells -hsc @ {butterfly_0/Ar_Fd2_reg[1]}]    \
[get_cells -hsc @ {butterfly_0/Ar_Fd2_reg[2]}] [get_cells -hsc @               \
{butterfly_0/Ar_Fd2_reg[3]}] [get_cells -hsc @ {butterfly_0/Ar_Fd2_reg[4]}]    \
[get_cells -hsc @ {butterfly_0/Ar_Fd2_reg[5]}] [get_cells -hsc @               \
{butterfly_0/Ar_Fd2_reg[6]}] [get_cells -hsc @ {butterfly_0/Ar_Fd2_reg[7]}]    \
[get_cells -hsc @ {butterfly_0/Ar_Fd2_reg[8]}] [get_cells -hsc @               \
{butterfly_0/Ar_Fd2_reg[9]}] [get_cells -hsc @ {butterfly_0/Ar_Fd2_reg[10]}]   \
[get_cells -hsc @ {butterfly_0/Ar_Fd2_reg[11]}] [get_cells -hsc @              \
{butterfly_0/Ar_Fd2_reg[12]}] [get_cells -hsc @ {butterfly_0/Ar_Fd2_reg[13]}]  \
[get_cells -hsc @ {butterfly_0/Ar_Fd2_reg[14]}] [get_cells -hsc @              \
{butterfly_0/Ar_Fd2_reg[15]}] [get_cells -hsc @ {butterfly_0/Xr_F_reg[0]}]     \
[get_cells -hsc @ {butterfly_0/Xr_F_reg[1]}] [get_cells -hsc @                 \
{butterfly_0/Xr_F_reg[2]}] [get_cells -hsc @ {butterfly_0/Xr_F_reg[3]}]        \
[get_cells -hsc @ {butterfly_0/Xr_F_reg[4]}] [get_cells -hsc @                 \
{butterfly_0/Xr_F_reg[5]}] [get_cells -hsc @ {butterfly_0/Xr_F_reg[6]}]        \
[get_cells -hsc @ {butterfly_0/Xr_F_reg[7]}] [get_cells -hsc @                 \
{butterfly_0/Xr_F_reg[8]}] [get_cells -hsc @ {butterfly_0/Xr_F_reg[9]}]        \
[get_cells -hsc @ {butterfly_0/Xr_F_reg[10]}] [get_cells -hsc @                \
{butterfly_0/Xr_F_reg[11]}] [get_cells -hsc @ {butterfly_0/Xr_F_reg[12]}]      \
[get_cells -hsc @ {butterfly_0/Xr_F_reg[13]}] [get_cells -hsc @                \
{butterfly_0/Xr_F_reg[14]}] [get_cells -hsc @ {butterfly_0/Xr_F_reg[15]}]      \
[get_cells -hsc @ {butterfly_0/Ar_F_reg[0]}] [get_cells -hsc @                 \
{butterfly_0/Ar_F_reg[1]}] [get_cells -hsc @ {butterfly_0/Ar_F_reg[2]}]        \
[get_cells -hsc @ {butterfly_0/Ar_F_reg[3]}] [get_cells -hsc @                 \
{butterfly_0/Ar_F_reg[4]}] [get_cells -hsc @ {butterfly_0/Ar_F_reg[5]}]        \
[get_cells -hsc @ {butterfly_0/Ar_F_reg[6]}] [get_cells -hsc @                 \
{butterfly_0/Ar_F_reg[7]}] [get_cells -hsc @ {butterfly_0/Ar_F_reg[8]}]        \
[get_cells -hsc @ {butterfly_0/Ar_F_reg[9]}] [get_cells -hsc @                 \
{butterfly_0/Ar_F_reg[10]}] [get_cells -hsc @ {butterfly_0/Ar_F_reg[11]}]      \
[get_cells -hsc @ {butterfly_0/Ar_F_reg[12]}] [get_cells -hsc @                \
{butterfly_0/Ar_F_reg[13]}] [get_cells -hsc @ {butterfly_0/Ar_F_reg[14]}]      \
[get_cells -hsc @ {butterfly_0/Ar_F_reg[15]}] [get_cells -hsc @                \
{butterfly_0/Ai_F_reg[0]}] [get_cells -hsc @ {butterfly_0/Ai_F_reg[1]}]        \
[get_cells -hsc @ {butterfly_0/Ai_F_reg[2]}] [get_cells -hsc @                 \
{butterfly_0/Ai_F_reg[3]}] [get_cells -hsc @ {butterfly_0/Ai_F_reg[4]}]        \
[get_cells -hsc @ {butterfly_0/Ai_F_reg[5]}] [get_cells -hsc @                 \
{butterfly_0/Ai_F_reg[6]}] [get_cells -hsc @ {butterfly_0/Ai_F_reg[7]}]        \
[get_cells -hsc @ {butterfly_0/Ai_F_reg[8]}] [get_cells -hsc @                 \
{butterfly_0/Ai_F_reg[9]}] [get_cells -hsc @ {butterfly_0/Ai_F_reg[10]}]       \
[get_cells -hsc @ {butterfly_0/Ai_F_reg[11]}] [get_cells -hsc @                \
{butterfly_0/Ai_F_reg[12]}] [get_cells -hsc @ {butterfly_0/Ai_F_reg[13]}]      \
[get_cells -hsc @ {butterfly_0/Ai_F_reg[14]}] [get_cells -hsc @                \
{butterfly_0/Ai_F_reg[15]}] [get_cells -hsc @ {butterfly_0/Br_F_reg[0]}]       \
[get_cells -hsc @ {butterfly_0/Br_F_reg[1]}] [get_cells -hsc @                 \
{butterfly_0/Br_F_reg[2]}] [get_cells -hsc @ {butterfly_0/Br_F_reg[3]}]        \
[get_cells -hsc @ {butterfly_0/Br_F_reg[4]}] [get_cells -hsc @                 \
{butterfly_0/Br_F_reg[5]}] [get_cells -hsc @ {butterfly_0/Br_F_reg[6]}]        \
[get_cells -hsc @ {butterfly_0/Br_F_reg[7]}] [get_cells -hsc @                 \
{butterfly_0/Br_F_reg[8]}] [get_cells -hsc @ {butterfly_0/Br_F_reg[9]}]        \
[get_cells -hsc @ {butterfly_0/Br_F_reg[10]}] [get_cells -hsc @                \
{butterfly_0/Br_F_reg[11]}] [get_cells -hsc @ {butterfly_0/Br_F_reg[12]}]      \
[get_cells -hsc @ {butterfly_0/Br_F_reg[13]}] [get_cells -hsc @                \
{butterfly_0/Br_F_reg[14]}] [get_cells -hsc @ {butterfly_0/Br_F_reg[15]}]      \
[get_cells -hsc @ {butterfly_0/Bi_F_reg[0]}] [get_cells -hsc @                 \
{butterfly_0/Bi_F_reg[1]}] [get_cells -hsc @ {butterfly_0/Bi_F_reg[2]}]        \
[get_cells -hsc @ {butterfly_0/Bi_F_reg[3]}] [get_cells -hsc @                 \
{butterfly_0/Bi_F_reg[4]}] [get_cells -hsc @ {butterfly_0/Bi_F_reg[5]}]        \
[get_cells -hsc @ {butterfly_0/Bi_F_reg[6]}] [get_cells -hsc @                 \
{butterfly_0/Bi_F_reg[7]}] [get_cells -hsc @ {butterfly_0/Bi_F_reg[8]}]        \
[get_cells -hsc @ {butterfly_0/Bi_F_reg[9]}] [get_cells -hsc @                 \
{butterfly_0/Bi_F_reg[10]}] [get_cells -hsc @ {butterfly_0/Bi_F_reg[11]}]      \
[get_cells -hsc @ {butterfly_0/Bi_F_reg[12]}] [get_cells -hsc @                \
{butterfly_0/Bi_F_reg[13]}] [get_cells -hsc @ {butterfly_0/Bi_F_reg[14]}]      \
[get_cells -hsc @ {butterfly_0/Bi_F_reg[15]}] [get_cells -hsc @                \
{butterfly_0/Wr_F_reg[1]}] [get_cells -hsc @ {butterfly_0/Wr_F_reg[2]}]        \
[get_cells -hsc @ {butterfly_0/Wr_F_reg[6]}] [get_cells -hsc @                 \
{butterfly_0/Wr_F_reg[9]}] [get_cells -hsc @ {butterfly_0/Wr_F_reg[10]}]       \
[get_cells -hsc @ {butterfly_0/Wr_F_reg[11]}] [get_cells -hsc @                \
{butterfly_0/Wr_F_reg[12]}] [get_cells -hsc @ {butterfly_0/Wr_F_reg[13]}]      \
[get_cells -hsc @ {butterfly_0/Wr_F_reg[14]}] [get_cells -hsc @                \
{butterfly_0/Wr_F_reg[15]}] [get_cells -hsc @ {butterfly_0/Zib_F_reg[0]}]      \
[get_cells -hsc @ {butterfly_0/Zib_F_reg[1]}] [get_cells -hsc @                \
{butterfly_0/Zib_F_reg[2]}] [get_cells -hsc @ {butterfly_0/Zib_F_reg[3]}]      \
[get_cells -hsc @ {butterfly_0/Zib_F_reg[4]}] [get_cells -hsc @                \
{butterfly_0/Zib_F_reg[5]}] [get_cells -hsc @ {butterfly_0/Zib_F_reg[6]}]      \
[get_cells -hsc @ {butterfly_0/Zib_F_reg[7]}] [get_cells -hsc @                \
{butterfly_0/Zib_F_reg[8]}] [get_cells -hsc @ {butterfly_0/Zib_F_reg[9]}]      \
[get_cells -hsc @ {butterfly_0/Zib_F_reg[10]}] [get_cells -hsc @               \
{butterfly_0/Zib_F_reg[11]}] [get_cells -hsc @ {butterfly_0/Zib_F_reg[12]}]    \
[get_cells -hsc @ {butterfly_0/Zib_F_reg[13]}] [get_cells -hsc @               \
{butterfly_0/Zib_F_reg[14]}] [get_cells -hsc @ {butterfly_0/Zib_F_reg[15]}]    \
[get_cells -hsc @ {butterfly_0/Zib_F_reg[16]}] [get_cells -hsc @               \
{butterfly_0/Zib_F_reg[17]}] [get_cells -hsc @ {butterfly_0/Zib_F_reg[18]}]    \
[get_cells -hsc @ {butterfly_0/Zib_F_reg[19]}] [get_cells -hsc @               \
{butterfly_0/Zib_F_reg[20]}] [get_cells -hsc @ {butterfly_0/Zib_F_reg[21]}]    \
[get_cells -hsc @ {butterfly_0/Zib_F_reg[22]}] [get_cells -hsc @               \
{butterfly_0/Zib_F_reg[23]}] [get_cells -hsc @ {butterfly_0/Zib_F_reg[24]}]    \
[get_cells -hsc @ {butterfly_0/Zib_F_reg[25]}] [get_cells -hsc @               \
{butterfly_0/Zib_F_reg[26]}] [get_cells -hsc @ {butterfly_0/Zib_F_reg[27]}]    \
[get_cells -hsc @ {butterfly_0/Zia_F_reg[0]}] [get_cells -hsc @                \
{butterfly_0/Zia_F_reg[1]}] [get_cells -hsc @ {butterfly_0/Zia_F_reg[2]}]      \
[get_cells -hsc @ {butterfly_0/Zia_F_reg[3]}] [get_cells -hsc @                \
{butterfly_0/Zia_F_reg[4]}] [get_cells -hsc @ {butterfly_0/Zia_F_reg[5]}]      \
[get_cells -hsc @ {butterfly_0/Zia_F_reg[6]}] [get_cells -hsc @                \
{butterfly_0/Zia_F_reg[7]}] [get_cells -hsc @ {butterfly_0/Zia_F_reg[8]}]      \
[get_cells -hsc @ {butterfly_0/Zia_F_reg[9]}] [get_cells -hsc @                \
{butterfly_0/Zia_F_reg[10]}] [get_cells -hsc @ {butterfly_0/Zia_F_reg[11]}]    \
[get_cells -hsc @ {butterfly_0/Zia_F_reg[12]}] [get_cells -hsc @               \
{butterfly_0/Zia_F_reg[13]}] [get_cells -hsc @ {butterfly_0/Zia_F_reg[14]}]    \
[get_cells -hsc @ {butterfly_0/Zia_F_reg[15]}] [get_cells -hsc @               \
{butterfly_0/Zia_F_reg[16]}] [get_cells -hsc @ {butterfly_0/Zia_F_reg[17]}]    \
[get_cells -hsc @ {butterfly_0/Zia_F_reg[18]}] [get_cells -hsc @               \
{butterfly_0/Zia_F_reg[19]}] [get_cells -hsc @ {butterfly_0/Zia_F_reg[20]}]    \
[get_cells -hsc @ {butterfly_0/Zia_F_reg[21]}] [get_cells -hsc @               \
{butterfly_0/Zia_F_reg[22]}] [get_cells -hsc @ {butterfly_0/Zia_F_reg[23]}]    \
[get_cells -hsc @ {butterfly_0/Zia_F_reg[24]}] [get_cells -hsc @               \
{butterfly_0/Zia_F_reg[25]}] [get_cells -hsc @ {butterfly_0/Zia_F_reg[26]}]    \
[get_cells -hsc @ {butterfly_0/Zia_F_reg[27]}] [get_cells                      \
{mem_32x16_0/mem_array_reg[0][0]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[0][1]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[0][2]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[0][3]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[0][4]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[0][5]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[0][6]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[0][7]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[0][8]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[0][9]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[0][10]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][11]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][12]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][13]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][14]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][15]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][16]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][17]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][18]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][19]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][20]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][21]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][22]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][23]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][24]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][25]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][26]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][27]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][28]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][29]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][30]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[0][31]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][0]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[1][1]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[1][2]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[1][3]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[1][4]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[1][5]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[1][6]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[1][7]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[1][8]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[1][9]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[1][10]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][11]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][12]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][13]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][14]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][15]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][16]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][17]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][18]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][19]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][20]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][21]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][22]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][23]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][24]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][25]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][26]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][27]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][28]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][29]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][30]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[1][31]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][0]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[2][1]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[2][2]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[2][3]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[2][4]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[2][5]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[2][6]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[2][7]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[2][8]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[2][9]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[2][10]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][11]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][12]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][13]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][14]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][15]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][16]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][17]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][18]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][19]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][20]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][21]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][22]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][23]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][24]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][25]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][26]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][27]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][28]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][29]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][30]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[2][31]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][0]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[3][1]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[3][2]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[3][3]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[3][4]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[3][5]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[3][6]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[3][7]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[3][8]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[3][9]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[3][10]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][11]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][12]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][13]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][14]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][15]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][16]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][17]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][18]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][19]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][20]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][21]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][22]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][23]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][24]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][25]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][26]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][27]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][28]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][29]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][30]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[3][31]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][0]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[4][1]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[4][2]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[4][3]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[4][4]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[4][5]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[4][6]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[4][7]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[4][8]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[4][9]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[4][10]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][11]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][12]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][13]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][14]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][15]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][16]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][17]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][18]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][19]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][20]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][21]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][22]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][23]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][24]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][25]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][26]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][27]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][28]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][29]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][30]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[4][31]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][0]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[5][1]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[5][2]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[5][3]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[5][4]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[5][5]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[5][6]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[5][7]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[5][8]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[5][9]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[5][10]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][11]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][12]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][13]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][14]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][15]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][16]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][17]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][18]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][19]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][20]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][21]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][22]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][23]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][24]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][25]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][26]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][27]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][28]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][29]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][30]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[5][31]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][0]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[6][1]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[6][2]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[6][3]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[6][4]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[6][5]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[6][6]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[6][7]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[6][8]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[6][9]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[6][10]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][11]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][12]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][13]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][14]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][15]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][16]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][17]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][18]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][19]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][20]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][21]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][22]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][23]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][24]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][25]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][26]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][27]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][28]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][29]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][30]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[6][31]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][0]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[7][1]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[7][2]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[7][3]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[7][4]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[7][5]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[7][6]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[7][7]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[7][8]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[7][9]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[7][10]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][11]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][12]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][13]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][14]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][15]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][16]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][17]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][18]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][19]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][20]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][21]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][22]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][23]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][24]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][25]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][26]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][27]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][28]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][29]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][30]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[7][31]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][0]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[8][1]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[8][2]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[8][3]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[8][4]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[8][5]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[8][6]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[8][7]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[8][8]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[8][9]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[8][10]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][11]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][12]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][13]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][14]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][15]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][16]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][17]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][18]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][19]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][20]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][21]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][22]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][23]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][24]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][25]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][26]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][27]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][28]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][29]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][30]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[8][31]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][0]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[9][1]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[9][2]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[9][3]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[9][4]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[9][5]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[9][6]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[9][7]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[9][8]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[9][9]}] [get_cells                                  \
{mem_32x16_0/mem_array_reg[9][10]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][11]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][12]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][13]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][14]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][15]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][16]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][17]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][18]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][19]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][20]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][21]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][22]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][23]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][24]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][25]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][26]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][27]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][28]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][29]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][30]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[9][31]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[10][0]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[10][1]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[10][2]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[10][3]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[10][4]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[10][5]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[10][6]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[10][7]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[10][8]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[10][9]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[10][10]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][11]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][12]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][13]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][14]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][15]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][16]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][17]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][18]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][19]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][20]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][21]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][22]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][23]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][24]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][25]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][26]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][27]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][28]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][29]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][30]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[10][31]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][0]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[11][1]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[11][2]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[11][3]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[11][4]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[11][5]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[11][6]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[11][7]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[11][8]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[11][9]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[11][10]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][11]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][12]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][13]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][14]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][15]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][16]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][17]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][18]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][19]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][20]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][21]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][22]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][23]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][24]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][25]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][26]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][27]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][28]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][29]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][30]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[11][31]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][0]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[12][1]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[12][2]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[12][3]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[12][4]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[12][5]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[12][6]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[12][7]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[12][8]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[12][9]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[12][10]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][11]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][12]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][13]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][14]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][15]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][16]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][17]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][18]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][19]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][20]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][21]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][22]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][23]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][24]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][25]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][26]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][27]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][28]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][29]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][30]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[12][31]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][0]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[13][1]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[13][2]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[13][3]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[13][4]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[13][5]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[13][6]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[13][7]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[13][8]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[13][9]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[13][10]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][11]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][12]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][13]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][14]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][15]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][16]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][17]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][18]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][19]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][20]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][21]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][22]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][23]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][24]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][25]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][26]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][27]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][28]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][29]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][30]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[13][31]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][0]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[14][1]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[14][2]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[14][3]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[14][4]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[14][5]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[14][6]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[14][7]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[14][8]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[14][9]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[14][10]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][11]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][12]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][13]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][14]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][15]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][16]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][17]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][18]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][19]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][20]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][21]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][22]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][23]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][24]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][25]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][26]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][27]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][28]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][29]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][30]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[14][31]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][0]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[15][1]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[15][2]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[15][3]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[15][4]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[15][5]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[15][6]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[15][7]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[15][8]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[15][9]}] [get_cells                                 \
{mem_32x16_0/mem_array_reg[15][10]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][11]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][12]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][13]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][14]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][15]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][16]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][17]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][18]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][19]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][20]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][21]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][22]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][23]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][24]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][25]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][26]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][27]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][28]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][29]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][30]}] [get_cells                                \
{mem_32x16_0/mem_array_reg[15][31]}] [get_cells -hsc @                         \
{fft_ctrl_sm_0/B_addr_F_reg[0]}] [get_cells -hsc @                             \
{fft_ctrl_sm_0/B_addr_F_reg[1]}] [get_cells -hsc @                             \
{fft_ctrl_sm_0/B_addr_F_reg[2]}] [get_cells -hsc @                             \
{fft_ctrl_sm_0/B_addr_F_reg[3]}] [get_cells -hsc @                             \
{fft_ctrl_sm_0/B_addr_Fd2_reg[0]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/B_addr_Fd2_reg[1]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/B_addr_Fd2_reg[2]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/B_addr_Fd2_reg[3]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/B_addr_Fd3_reg[0]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/B_addr_Fd3_reg[1]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/B_addr_Fd3_reg[2]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/B_addr_Fd3_reg[3]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/butterfly_F_reg[0]}] [get_cells -hsc @                          \
{fft_ctrl_sm_0/butterfly_F_reg[1]}] [get_cells -hsc @                          \
{fft_ctrl_sm_0/butterfly_F_reg[2]}] [get_cells -hsc @                          \
{fft_ctrl_sm_0/stage_F_reg[0]}] [get_cells -hsc @                              \
{fft_ctrl_sm_0/stage_F_reg[1]}] [get_cells -hsc @                              \
{fft_ctrl_sm_0/counter_F_reg[0]}] [get_cells -hsc @                            \
{fft_ctrl_sm_0/counter_F_reg[1]}] [get_cells -hsc @                            \
{fft_ctrl_sm_0/counter_F_reg[2]}] [get_cells -hsc @                            \
{fft_ctrl_sm_0/counter_F_reg[3]}] [get_cells -hsc @                            \
fft_ctrl_sm_0/out_push_F_reg] [get_cells -hsc @                                \
fft_ctrl_sm_0/write_back_F_reg] [get_cells -hsc @                              \
fft_ctrl_sm_0/write_en_2_F_reg] [get_cells -hsc @                              \
{fft_ctrl_sm_0/write_addr_2_F_reg[0]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_addr_2_F_reg[1]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_addr_2_F_reg[2]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_addr_2_F_reg[3]}] [get_cells -hsc @                       \
fft_ctrl_sm_0/write_en_1_F_reg] [get_cells -hsc @                              \
{fft_ctrl_sm_0/write_data_1_F_reg[0]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_data_1_F_reg[1]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_data_1_F_reg[2]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_data_1_F_reg[3]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_data_1_F_reg[4]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_data_1_F_reg[5]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_data_1_F_reg[6]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_data_1_F_reg[7]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_data_1_F_reg[8]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_data_1_F_reg[9]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_data_1_F_reg[10]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[11]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[12]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[13]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[14]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[15]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[16]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[17]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[18]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[19]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[20]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[21]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[22]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[23]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[24]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[25]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[26]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[27]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[28]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[29]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[30]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_data_1_F_reg[31]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/write_addr_1_F_reg[0]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_addr_1_F_reg[1]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_addr_1_F_reg[2]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/write_addr_1_F_reg[3]}] [get_cells -hsc @                       \
{fft_ctrl_sm_0/W_addr_F_reg[0]}] [get_cells -hsc @                             \
{fft_ctrl_sm_0/W_addr_F_reg[1]}] [get_cells -hsc @                             \
{fft_ctrl_sm_0/W_addr_F_reg[2]}] [get_cells -hsc @                             \
{fft_ctrl_sm_0/read_addr_2_F_reg[0]}] [get_cells -hsc @                        \
{fft_ctrl_sm_0/read_addr_2_F_reg[1]}] [get_cells -hsc @                        \
{fft_ctrl_sm_0/read_addr_2_F_reg[2]}] [get_cells -hsc @                        \
{fft_ctrl_sm_0/read_addr_2_F_reg[3]}] [get_cells -hsc @                        \
{fft_ctrl_sm_0/read_addr_1_F_reg[0]}] [get_cells -hsc @                        \
{fft_ctrl_sm_0/read_addr_1_F_reg[1]}] [get_cells -hsc @                        \
{fft_ctrl_sm_0/read_addr_1_F_reg[2]}] [get_cells -hsc @                        \
{fft_ctrl_sm_0/read_addr_1_F_reg[3]}] [get_cells -hsc @                        \
fft_ctrl_sm_0/in_stall_F_reg] [get_cells -hsc @                                \
{fft_ctrl_sm_0/current_state_F_reg[0]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/current_state_F_reg[1]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/current_state_F_reg[2]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/current_state_F_reg[3]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/current_state_F_reg[4]}] [get_cells -hsc @                      \
{fft_ctrl_sm_0/B_addr_Fd4_reg[0]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/B_addr_Fd4_reg[1]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/B_addr_Fd4_reg[2]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/B_addr_Fd4_reg[3]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/A_addr_Fd2_reg[0]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/A_addr_Fd2_reg[1]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/A_addr_Fd2_reg[2]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/A_addr_Fd2_reg[3]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/A_addr_Fd4_reg[0]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/A_addr_Fd4_reg[1]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/A_addr_Fd4_reg[2]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/A_addr_Fd4_reg[3]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/A_addr_F_reg[0]}] [get_cells -hsc @                             \
{fft_ctrl_sm_0/A_addr_F_reg[1]}] [get_cells -hsc @                             \
{fft_ctrl_sm_0/A_addr_F_reg[2]}] [get_cells -hsc @                             \
{fft_ctrl_sm_0/A_addr_F_reg[3]}] [get_cells -hsc @ fft_ctrl_sm_0/skip_Fd3_reg] \
[get_cells -hsc @ fft_ctrl_sm_0/skip_F_reg] [get_cells -hsc @                  \
fft_ctrl_sm_0/skip_Fd2_reg] [get_cells -hsc @                                  \
{fft_ctrl_sm_0/A_addr_Fd3_reg[0]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/A_addr_Fd3_reg[1]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/A_addr_Fd3_reg[2]}] [get_cells -hsc @                           \
{fft_ctrl_sm_0/A_addr_Fd3_reg[3]}] [get_cells -hsc @                           \
fft_ctrl_sm_0/skip_Fd4_reg]]
set_input_delay -clock MYCLK  0  [get_ports reset]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[15]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[15]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[14]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[14]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[13]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[13]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[12]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[12]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[11]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[11]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[10]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[10]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[9]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[9]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[8]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[8]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[7]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[7]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[6]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[6]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[5]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[5]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[4]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[4]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[3]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[3]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[2]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[2]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[1]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[1]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_real[0]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_real[0]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[15]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[15]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[14]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[14]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[13]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[13]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[12]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[12]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[11]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[11]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[10]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[10]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[9]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[9]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[8]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[8]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[7]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[7]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[6]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[6]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[5]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[5]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[4]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[4]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[3]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[3]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[2]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[2]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[1]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[1]}]
set_input_delay -clock MYCLK  -max 2  [get_ports {in_imag[0]}]
set_input_delay -clock MYCLK  -min 0.1  [get_ports {in_imag[0]}]
set_input_delay -clock MYCLK  -max 1.5  [get_ports in_push]
set_input_delay -clock MYCLK  -min 0.1  [get_ports in_push]
set_input_delay -clock MYCLK  -max 1.5  [get_ports out_stall]
set_input_delay -clock MYCLK  -min 0.1  [get_ports out_stall]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[15]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[15]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[14]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[14]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[13]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[13]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[12]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[12]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[11]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[11]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[10]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[10]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[9]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[9]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[8]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[8]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[7]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[7]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[6]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[6]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[5]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[5]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[4]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[4]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[3]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[3]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[2]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[2]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[1]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[1]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_real_F[0]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_real_F[0]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[15]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[15]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[14]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[14]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[13]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[13]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[12]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[12]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[11]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[11]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[10]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[10]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[9]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[9]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[8]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[8]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[7]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[7]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[6]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[6]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[5]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[5]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[4]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[4]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[3]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[3]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[2]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[2]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[1]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[1]}]
set_output_delay -clock MYCLK  -max 2  [get_ports {out_imag_F[0]}]
set_output_delay -clock MYCLK  -min 0.1  [get_ports {out_imag_F[0]}]
set_output_delay -clock MYCLK  -max 1.5  [get_ports out_push_F]
set_output_delay -clock MYCLK  -min 0.1  [get_ports out_push_F]
set_output_delay -clock MYCLK  -max 1.5  [get_ports in_stall]
set_output_delay -clock MYCLK  -min 0.1  [get_ports in_stall]
