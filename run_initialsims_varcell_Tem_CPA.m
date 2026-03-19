clear

% initial simulations varying: 
% TPV cell type
% CPA high low
% Temitter

CF = 1; % capacity factor of use of PHPS
LCOH = 0.07; % gas cost €/kWh

Tem_var = [700 1600 2500];
CPA_tpv_var = [10 70]; % €/cm2

% Ge, Tem = 700 ºC, CPA_tpv = 10 €/cm2
cellType = 'Ge';
Tem = Tem_var(1);
CPA_tpv = CPA_tpv_var(1);
run script_sim0
% Ge, Tem = 1600 ºC, CPA_tpv = 10 €/cm2
cellType = 'Ge';
Tem = Tem_var(2);
CPA_tpv = CPA_tpv_var(1);
run script_sim0
% Ge, Tem = 1500 ºC, CPA_tpv = 10 €/cm2
cellType = 'Ge';
Tem = Tem_var(3);
CPA_tpv = CPA_tpv_var(1);
run script_sim0
% Ge, Tem = 700 ºC, CPA_tpv = 70 €/cm2
cellType = 'Ge';
Tem = Tem_var(1);
CPA_tpv = CPA_tpv_var(2);
run script_sim0
% Ge, Tem = 1600 ºC, CPA_tpv = 70 €/cm2
cellType = 'Ge';
Tem = Tem_var(2);
CPA_tpv = CPA_tpv_var(2);
run script_sim0
% Ge, Tem = 1500 ºC, CPA_tpv = 70 €/cm2
cellType = 'Ge';
Tem = Tem_var(3);
CPA_tpv = CPA_tpv_var(2);
run script_sim0

% InGaAs, Tem = 700 ºC, CPA_tpv = 10 €/cm2
cellType = 'In';
Tem = Tem_var(1);
CPA_tpv = CPA_tpv_var(1);
run script_sim0
% InGaAs, Tem = 1600 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(2);
CPA_tpv = CPA_tpv_var(1);
run script_sim0
% InGaAs, Tem = 1500 ºC, CPA_tpv = 10 €/cm2
cellType = 'In';
Tem = Tem_var(3);
CPA_tpv = CPA_tpv_var(1);
run script_sim0
% InGaAs, Tem = 700 ºC, CPA_tpv = 70 €/cm2
cellType = 'In';
Tem = Tem_var(1);
CPA_tpv = CPA_tpv_var(2);
run script_sim0
% InGaAs, Tem = 1600 ºC, CPA_tpv = 70 €/cm2
cellType = 'In';
Tem = Tem_var(2);
CPA_tpv = CPA_tpv_var(2);
run script_sim0
% InGaAs, Tem = 1500 ºC, CPA_tpv = 70 €/cm2
cellType = 'In';
Tem = Tem_var(3);
CPA_tpv = CPA_tpv_var(2);
run script_sim0