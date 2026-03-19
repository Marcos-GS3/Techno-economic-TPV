clear
% Plot sims0
CF = 1; % capacity factor of use of PHPS
LCOH = 0.07; % gas cost €/kWh
LCOrH = 0;
Tem = 2500;
CPA_tpv_var = [10 70]; % €/cm2
payback_max = 2;
nb_levels = 10;
subplot(2,3,1)
cellType = 'Ge';
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d_LCOrH%d_varTc_Cgrid.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem, round(LCOrH*1000));
load(fname)
contourf(var1, var2, PayBack', nb_levels);
colorbar
xlabel('TPV cell temperature (ºC)');
ylabel('Electricity Grid cost (€/kWh)');
clim([0 payback_max]);
set(gca, 'FontSize', 12);
colormap('Sky')
set(gcf, 'Color', 'w');

subplot(2,3,4)
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d_LCOrH%d_varTc_Cgrid.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem, round(LCOrH*1000));
load(fname)
contourf(var1, var2, PayBack', nb_levels);
colorbar
xlabel('TPV cell temperature (ºC)');
ylabel('Electricity Grid cost (€/kWh)');
clim([0 payback_max]);
set(gca, 'FontSize', 12);
colormap('Sky')

subplot(2,3,2)
cellType = 'In';
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d_LCOrH%d_varTc_Cgrid.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem, round(LCOrH*1000));
load(fname)
contourf(var1, var2, PayBack', nb_levels);
colorbar
xlabel('TPV cell temperature (ºC)');
ylabel('Electricity Grid cost (€/kWh)');
clim([0 payback_max]);
set(gca, 'FontSize', 12);
colormap('Sky')

subplot(2,3,5)
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d_LCOrH%d_varTc_Cgrid.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem, round(LCOrH*1000));
load(fname)
contourf(var1, var2, PayBack', nb_levels);
colorbar
xlabel('TPV cell temperature (ºC)');
ylabel('Electricity Grid cost (€/kWh)');
clim([0 payback_max]);
set(gca, 'FontSize', 12);
colormap('Sky')


