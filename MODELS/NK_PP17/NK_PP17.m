%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'NK_PP17';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_PP17.log');
M_.exo_names = 'eta_a';
M_.exo_names_tex = 'eta\_a';
M_.exo_names_long = 'eta_a';
M_.exo_names = char(M_.exo_names, 'eta_m');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_m');
M_.exo_names_long = char(M_.exo_names_long, 'eta_m');
M_.exo_names = char(M_.exo_names, 'eta_n');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_n');
M_.exo_names_long = char(M_.exo_names_long, 'eta_n');
M_.exo_names = char(M_.exo_names, 'eta_l');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_l');
M_.exo_names_long = char(M_.exo_names_long, 'eta_l');
M_.exo_names = char(M_.exo_names, 'interest_');
M_.exo_names_tex = char(M_.exo_names_tex, 'interest\_');
M_.exo_names_long = char(M_.exo_names_long, 'interest_');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'yg');
M_.endo_names_tex = char(M_.endo_names_tex, 'yg');
M_.endo_names_long = char(M_.endo_names_long, 'yg');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'phi');
M_.endo_names_tex = char(M_.endo_names_tex, 'phi');
M_.endo_names_long = char(M_.endo_names_long, 'phi');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'del');
M_.endo_names_tex = char(M_.endo_names_tex, 'del');
M_.endo_names_long = char(M_.endo_names_long, 'del');
M_.endo_names = char(M_.endo_names, 'S');
M_.endo_names_tex = char(M_.endo_names_tex, 'S');
M_.endo_names_long = char(M_.endo_names_long, 'S');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'yf');
M_.endo_names_tex = char(M_.endo_names_tex, 'yf');
M_.endo_names_long = char(M_.endo_names_long, 'yf');
M_.endo_names = char(M_.endo_names, 'ygf');
M_.endo_names_tex = char(M_.endo_names_tex, 'ygf');
M_.endo_names_long = char(M_.endo_names_long, 'ygf');
M_.endo_names = char(M_.endo_names, 'Rf');
M_.endo_names_tex = char(M_.endo_names_tex, 'Rf');
M_.endo_names_long = char(M_.endo_names_long, 'Rf');
M_.endo_names = char(M_.endo_names, 'phif');
M_.endo_names_tex = char(M_.endo_names_tex, 'phif');
M_.endo_names_long = char(M_.endo_names_long, 'phif');
M_.endo_names = char(M_.endo_names, 'nf');
M_.endo_names_tex = char(M_.endo_names_tex, 'nf');
M_.endo_names_long = char(M_.endo_names_long, 'nf');
M_.endo_names = char(M_.endo_names, 'delf');
M_.endo_names_tex = char(M_.endo_names_tex, 'delf');
M_.endo_names_long = char(M_.endo_names_long, 'delf');
M_.endo_names = char(M_.endo_names, 'Sf');
M_.endo_names_tex = char(M_.endo_names_tex, 'Sf');
M_.endo_names_long = char(M_.endo_names_long, 'Sf');
M_.endo_names = char(M_.endo_names, 'zf');
M_.endo_names_tex = char(M_.endo_names_tex, 'zf');
M_.endo_names_long = char(M_.endo_names_long, 'zf');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'ns');
M_.endo_names_tex = char(M_.endo_names_tex, 'ns');
M_.endo_names_long = char(M_.endo_names_long, 'ns');
M_.endo_names = char(M_.endo_names, 'eps_m');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_m');
M_.endo_names_long = char(M_.endo_names_long, 'eps_m');
M_.endo_names = char(M_.endo_names, 'lam');
M_.endo_names_tex = char(M_.endo_names_tex, 'lam');
M_.endo_names_long = char(M_.endo_names_long, 'lam');
M_.endo_names = char(M_.endo_names, 'interest');
M_.endo_names_tex = char(M_.endo_names_tex, 'interest');
M_.endo_names_long = char(M_.endo_names_long, 'interest');
M_.endo_names = char(M_.endo_names, 'inflation');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflation');
M_.endo_names_long = char(M_.endo_names_long, 'inflation');
M_.endo_names = char(M_.endo_names, 'inflationq');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflationq');
M_.endo_names_long = char(M_.endo_names_long, 'inflationq');
M_.endo_names = char(M_.endo_names, 'outputgap');
M_.endo_names_tex = char(M_.endo_names_tex, 'outputgap');
M_.endo_names_long = char(M_.endo_names_long, 'outputgap');
M_.endo_names = char(M_.endo_names, 'output');
M_.endo_names_tex = char(M_.endo_names_tex, 'output');
M_.endo_names_long = char(M_.endo_names_long, 'output');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_75');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_75');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_75');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_79');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_79');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_79');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_83');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_83');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_83');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_110');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_110');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_110');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_114');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_114');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_114');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_118');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_118');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_118');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_145');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_145');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_145');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_149');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_149');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_149');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_153');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_153');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_153');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_3_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_3\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_3_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_3_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_3\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_3_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_25_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_25\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_25_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_25_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_25\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_25_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_25_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_25\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_25_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_24_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_24\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_24_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_24_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_24\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_24_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_24_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_24\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_24_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_21_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_21\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_21_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_21_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_21\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_21_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_21_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_21\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_21_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_23_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_23\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_23_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_23_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_23\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_23_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_23_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_23\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_23_3');
M_.param_names = 'cofintintb1';
M_.param_names_tex = 'cofintintb1';
M_.param_names_long = 'cofintintb1';
M_.param_names = char(M_.param_names, 'cofintintb2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintintb2');
M_.param_names_long = char(M_.param_names_long, 'cofintintb2');
M_.param_names = char(M_.param_names, 'cofintintb3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintintb3');
M_.param_names_long = char(M_.param_names_long, 'cofintintb3');
M_.param_names = char(M_.param_names, 'cofintintb4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintintb4');
M_.param_names_long = char(M_.param_names_long, 'cofintintb4');
M_.param_names = char(M_.param_names, 'cofintinf0');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinf0');
M_.param_names_long = char(M_.param_names_long, 'cofintinf0');
M_.param_names = char(M_.param_names, 'cofintinfb1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinfb1');
M_.param_names_long = char(M_.param_names_long, 'cofintinfb1');
M_.param_names = char(M_.param_names, 'cofintinfb2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinfb2');
M_.param_names_long = char(M_.param_names_long, 'cofintinfb2');
M_.param_names = char(M_.param_names, 'cofintinfb3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinfb3');
M_.param_names_long = char(M_.param_names_long, 'cofintinfb3');
M_.param_names = char(M_.param_names, 'cofintinfb4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinfb4');
M_.param_names_long = char(M_.param_names_long, 'cofintinfb4');
M_.param_names = char(M_.param_names, 'cofintinff1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinff1');
M_.param_names_long = char(M_.param_names_long, 'cofintinff1');
M_.param_names = char(M_.param_names, 'cofintinff2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinff2');
M_.param_names_long = char(M_.param_names_long, 'cofintinff2');
M_.param_names = char(M_.param_names, 'cofintinff3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinff3');
M_.param_names_long = char(M_.param_names_long, 'cofintinff3');
M_.param_names = char(M_.param_names, 'cofintinff4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinff4');
M_.param_names_long = char(M_.param_names_long, 'cofintinff4');
M_.param_names = char(M_.param_names, 'cofintout');
M_.param_names_tex = char(M_.param_names_tex, 'cofintout');
M_.param_names_long = char(M_.param_names_long, 'cofintout');
M_.param_names = char(M_.param_names, 'cofintoutb1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutb1');
M_.param_names_long = char(M_.param_names_long, 'cofintoutb1');
M_.param_names = char(M_.param_names, 'cofintoutb2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutb2');
M_.param_names_long = char(M_.param_names_long, 'cofintoutb2');
M_.param_names = char(M_.param_names, 'cofintoutb3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutb3');
M_.param_names_long = char(M_.param_names_long, 'cofintoutb3');
M_.param_names = char(M_.param_names, 'cofintoutb4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutb4');
M_.param_names_long = char(M_.param_names_long, 'cofintoutb4');
M_.param_names = char(M_.param_names, 'cofintoutf1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutf1');
M_.param_names_long = char(M_.param_names_long, 'cofintoutf1');
M_.param_names = char(M_.param_names, 'cofintoutf2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutf2');
M_.param_names_long = char(M_.param_names_long, 'cofintoutf2');
M_.param_names = char(M_.param_names, 'cofintoutf3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutf3');
M_.param_names_long = char(M_.param_names_long, 'cofintoutf3');
M_.param_names = char(M_.param_names, 'cofintoutf4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutf4');
M_.param_names_long = char(M_.param_names_long, 'cofintoutf4');
M_.param_names = char(M_.param_names, 'cofintoutp');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutp');
M_.param_names_long = char(M_.param_names_long, 'cofintoutp');
M_.param_names = char(M_.param_names, 'cofintoutpb1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpb1');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpb1');
M_.param_names = char(M_.param_names, 'cofintoutpb2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpb2');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpb2');
M_.param_names = char(M_.param_names, 'cofintoutpb3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpb3');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpb3');
M_.param_names = char(M_.param_names, 'cofintoutpb4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpb4');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpb4');
M_.param_names = char(M_.param_names, 'cofintoutpf1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpf1');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpf1');
M_.param_names = char(M_.param_names, 'cofintoutpf2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpf2');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpf2');
M_.param_names = char(M_.param_names, 'cofintoutpf3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpf3');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpf3');
M_.param_names = char(M_.param_names, 'cofintoutpf4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpf4');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpf4');
M_.param_names = char(M_.param_names, 'std_r_');
M_.param_names_tex = char(M_.param_names_tex, 'std\_r\_');
M_.param_names_long = char(M_.param_names_long, 'std_r_');
M_.param_names = char(M_.param_names, 'std_r_quart');
M_.param_names_tex = char(M_.param_names_tex, 'std\_r\_quart');
M_.param_names_long = char(M_.param_names_long, 'std_r_quart');
M_.param_names = char(M_.param_names, 'coffispol');
M_.param_names_tex = char(M_.param_names_tex, 'coffispol');
M_.param_names_long = char(M_.param_names_long, 'coffispol');
M_.param_names = char(M_.param_names, 'betta');
M_.param_names_tex = char(M_.param_names_tex, '\beta');
M_.param_names_long = char(M_.param_names_long, 'betta');
M_.param_names = char(M_.param_names, 'sig');
M_.param_names_tex = char(M_.param_names_tex, '\sigma');
M_.param_names_long = char(M_.param_names_long, 'sig');
M_.param_names = char(M_.param_names, 'alfa');
M_.param_names_tex = char(M_.param_names_tex, '\alpha');
M_.param_names_long = char(M_.param_names_long, 'alfa');
M_.param_names = char(M_.param_names, 'thet');
M_.param_names_tex = char(M_.param_names_tex, '\thet');
M_.param_names_long = char(M_.param_names_long, 'thet');
M_.param_names = char(M_.param_names, 'eps');
M_.param_names_tex = char(M_.param_names_tex, '\epsilon');
M_.param_names_long = char(M_.param_names_long, 'eps');
M_.param_names = char(M_.param_names, 'del_ss');
M_.param_names_tex = char(M_.param_names_tex, '\delta_{ss}');
M_.param_names_long = char(M_.param_names_long, 'del_ss');
M_.param_names = char(M_.param_names, 'phi_ss');
M_.param_names_tex = char(M_.param_names_tex, '\phi_{ss}');
M_.param_names_long = char(M_.param_names_long, 'phi_ss');
M_.param_names = char(M_.param_names, 'varphi');
M_.param_names_tex = char(M_.param_names_tex, '\varphi');
M_.param_names_long = char(M_.param_names_long, 'varphi');
M_.param_names = char(M_.param_names, 'b');
M_.param_names_tex = char(M_.param_names_tex, 'b');
M_.param_names_long = char(M_.param_names_long, 'b');
M_.param_names = char(M_.param_names, 'kap');
M_.param_names_tex = char(M_.param_names_tex, '\kappa');
M_.param_names_long = char(M_.param_names_long, 'kap');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, '\rho_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_m');
M_.param_names_tex = char(M_.param_names_tex, '\rho_m');
M_.param_names_long = char(M_.param_names_long, 'rho_m');
M_.param_names = char(M_.param_names, 'rho_n');
M_.param_names_tex = char(M_.param_names_tex, '\rho_n');
M_.param_names_long = char(M_.param_names_long, 'rho_n');
M_.param_names = char(M_.param_names, 'rho_R');
M_.param_names_tex = char(M_.param_names_tex, '\rho_R');
M_.param_names_long = char(M_.param_names_long, 'rho_R');
M_.param_names = char(M_.param_names, 'rho_l');
M_.param_names_tex = char(M_.param_names_tex, '\rho_l');
M_.param_names_long = char(M_.param_names_long, 'rho_l');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, '\tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'tau_g');
M_.param_names_tex = char(M_.param_names_tex, '\tau_g');
M_.param_names_long = char(M_.param_names_long, 'tau_g');
M_.exo_det_nbr = 0;
M_.exo_nbr = 5;
M_.endo_nbr = 49;
M_.param_nbr = 51;
M_.orig_endo_nbr = 26;
M_.aux_vars(1).endo_index = 27;
M_.aux_vars(1).type = 0;
M_.aux_vars(2).endo_index = 28;
M_.aux_vars(2).type = 0;
M_.aux_vars(3).endo_index = 29;
M_.aux_vars(3).type = 0;
M_.aux_vars(4).endo_index = 30;
M_.aux_vars(4).type = 0;
M_.aux_vars(5).endo_index = 31;
M_.aux_vars(5).type = 0;
M_.aux_vars(6).endo_index = 32;
M_.aux_vars(6).type = 0;
M_.aux_vars(7).endo_index = 33;
M_.aux_vars(7).type = 0;
M_.aux_vars(8).endo_index = 34;
M_.aux_vars(8).type = 0;
M_.aux_vars(9).endo_index = 35;
M_.aux_vars(9).type = 0;
M_.aux_vars(10).endo_index = 36;
M_.aux_vars(10).type = 1;
M_.aux_vars(10).orig_index = 4;
M_.aux_vars(10).orig_lead_lag = -1;
M_.aux_vars(11).endo_index = 37;
M_.aux_vars(11).type = 1;
M_.aux_vars(11).orig_index = 4;
M_.aux_vars(11).orig_lead_lag = -2;
M_.aux_vars(12).endo_index = 38;
M_.aux_vars(12).type = 1;
M_.aux_vars(12).orig_index = 26;
M_.aux_vars(12).orig_lead_lag = -1;
M_.aux_vars(13).endo_index = 39;
M_.aux_vars(13).type = 1;
M_.aux_vars(13).orig_index = 26;
M_.aux_vars(13).orig_lead_lag = -2;
M_.aux_vars(14).endo_index = 40;
M_.aux_vars(14).type = 1;
M_.aux_vars(14).orig_index = 26;
M_.aux_vars(14).orig_lead_lag = -3;
M_.aux_vars(15).endo_index = 41;
M_.aux_vars(15).type = 1;
M_.aux_vars(15).orig_index = 25;
M_.aux_vars(15).orig_lead_lag = -1;
M_.aux_vars(16).endo_index = 42;
M_.aux_vars(16).type = 1;
M_.aux_vars(16).orig_index = 25;
M_.aux_vars(16).orig_lead_lag = -2;
M_.aux_vars(17).endo_index = 43;
M_.aux_vars(17).type = 1;
M_.aux_vars(17).orig_index = 25;
M_.aux_vars(17).orig_lead_lag = -3;
M_.aux_vars(18).endo_index = 44;
M_.aux_vars(18).type = 1;
M_.aux_vars(18).orig_index = 22;
M_.aux_vars(18).orig_lead_lag = -1;
M_.aux_vars(19).endo_index = 45;
M_.aux_vars(19).type = 1;
M_.aux_vars(19).orig_index = 22;
M_.aux_vars(19).orig_lead_lag = -2;
M_.aux_vars(20).endo_index = 46;
M_.aux_vars(20).type = 1;
M_.aux_vars(20).orig_index = 22;
M_.aux_vars(20).orig_lead_lag = -3;
M_.aux_vars(21).endo_index = 47;
M_.aux_vars(21).type = 1;
M_.aux_vars(21).orig_index = 24;
M_.aux_vars(21).orig_lead_lag = -1;
M_.aux_vars(22).endo_index = 48;
M_.aux_vars(22).type = 1;
M_.aux_vars(22).orig_index = 24;
M_.aux_vars(22).orig_lead_lag = -2;
M_.aux_vars(23).endo_index = 49;
M_.aux_vars(23).type = 1;
M_.aux_vars(23).orig_index = 24;
M_.aux_vars(23).orig_lead_lag = -3;
M_.Sigma_e = zeros(5, 5);
M_.Correlation_matrix = eye(5, 5);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('NK_PP17_static');
erase_compiled_function('NK_PP17_dynamic');
M_.lead_lag_incidence = [
 0 34 0;
 0 35 83;
 1 36 0;
 2 37 84;
 3 38 0;
 4 39 0;
 5 40 85;
 6 41 0;
 0 42 0;
 0 43 0;
 0 44 86;
 7 45 0;
 8 46 0;
 9 47 0;
 10 48 87;
 11 49 0;
 0 50 0;
 12 51 88;
 13 52 0;
 14 53 0;
 15 54 89;
 16 55 0;
 0 56 0;
 17 57 90;
 18 58 91;
 19 59 92;
 0 60 93;
 0 61 94;
 0 62 95;
 0 63 96;
 0 64 97;
 0 65 98;
 0 66 99;
 0 67 100;
 0 68 101;
 20 69 0;
 21 70 0;
 22 71 0;
 23 72 0;
 24 73 0;
 25 74 0;
 26 75 0;
 27 76 0;
 28 77 0;
 29 78 0;
 30 79 0;
 31 80 0;
 32 81 0;
 33 82 0;]';
M_.nstatic = 5;
M_.nfwrd   = 11;
M_.npred   = 25;
M_.nboth   = 8;
M_.nsfwrd   = 19;
M_.nspred   = 33;
M_.ndynamic   = 44;
M_.equations_tags = {
  7 , 'name' , '(22) Phillips curve' ;
  8 , 'name' , '(23) Euler equation' ;
  9 , 'name' , '(24) Net worth evolution' ;
  10 , 'name' , '(25) Firms labor demand and bank sector' ;
  11 , 'name' , '(26) Incentive compatability constraint' ;
  12 , 'name' , 'Macroprudential policy' ;
  13 , 'name' , 'Output gap' ;
  14 , 'name' , 'Marginal costs' ;
  15 , 'name' , 'Output gap and credit friction' ;
  16 , 'name' , '(23) Euler equation' ;
  17 , 'name' , '(24) Net worth evolution' ;
  18 , 'name' , '(25) Firms labor demand and bank sector' ;
  19 , 'name' , '(26) Incentive compatability constraint' ;
  20 , 'name' , 'Macroprudential policy' ;
  21 , 'name' , 'Output gap' ;
  22 , 'name' , 'marginal costs' ;
  23 , 'name' , 'Technology' ;
  24 , 'name' , 'Mark-up shock' ;
  25 , 'name' , 'Net worth shock' ;
  26 , 'name' , 'Moral hazard shock' ;
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:5];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(49, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(5, 1);
M_.params = NaN(51, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 176;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
M_.params( 35 ) = 0.99;
betta = M_.params( 35 );
M_.params( 36 ) = 1;
sig = M_.params( 36 );
M_.params( 37 ) = 0.50;
alfa = M_.params( 37 );
M_.params( 38 ) = 0.47;
thet = M_.params( 38 );
M_.params( 39 ) = 10;
eps = M_.params( 39 );
M_.params( 40 ) = 9;
del_ss = M_.params( 40 );
M_.params( 41 ) = 0.02;
phi_ss = M_.params( 41 );
M_.params( 42 ) = 211;
varphi = M_.params( 42 );
M_.params( 43 ) = 1/(1+M_.params(41));
b = M_.params( 43 );
M_.params( 44 ) = (M_.params(39)-1)/M_.params(42);
kap = M_.params( 44 );
M_.params( 45 ) = 0.95;
rho_a = M_.params( 45 );
M_.params( 46 ) = 0.95;
rho_m = M_.params( 46 );
M_.params( 47 ) = 0;
rho_n = M_.params( 47 );
M_.params( 48 ) = 0.5;
rho_R = M_.params( 48 );
M_.params( 49 ) = 0.5;
rho_l = M_.params( 49 );
M_.params( 50 ) = 1.5;
tau = M_.params( 50 );
M_.params( 51 ) = 0.125;
tau_g = M_.params( 51 );
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:33                                                               
deep_parameter_name = M_.param_names(i,:);                           
eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath);  
M_.params( 32 ) = 100;
std_r_ = M_.params( 32 );
M_.params( 34 ) = 1;
coffispol = M_.params( 34 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.5)^2;
M_.Sigma_e(2, 2) = (0.5)^2;
M_.Sigma_e(3, 3) = (4.3)^2;
M_.Sigma_e(4, 4) = (1)^2;
M_.Sigma_e(5, 5) = (1)^2;
close all;
save('NK_PP17_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_PP17_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_PP17_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_PP17_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_PP17_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
