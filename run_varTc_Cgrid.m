clear

% initial simulations varying: 
% TPV cell type
% CPA high low
% Temitter

CF = 1; % capacity factor of use of PHPS
LCOH = 0.07; % gas cost €/kWh
% Tem_var = [700 1600 2500]
Tem = 2500;
CPA_tpv_var = [10 70]; % €/cm2
LCOrH = 0; % €/kWh

% Ge, CPA_tpv = 10 €/cm2
cellType = 'Ge';
CPA_tpv = CPA_tpv_var(1);
run script_var1_var2.m
% Ge, CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
run script_var1_var2.m

% In, CPA_tpv = 10 €/cm2
cellType = 'In';
CPA_tpv = CPA_tpv_var(1);
run script_var1_var2.m
% In, CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
run script_var1_var2.m