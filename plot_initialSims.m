
% Plot sims0
CF = 1; % capacity factor of use of PHPS
LCOH = 0.02; % gas cost €/kWh

Tem_var = [700 1600 2500];
CPA_tpv_var = [10 70]; % €/cm2
% Germanium
green1 = '#BBFCC0';
green2 = '#0AC724';
green3 = '#066F14';

subplot(2,4,1)
hold on;
% Plot the lines with specified styles
% Ge, Tem = 700 ºC, CPA_tpv = 10 €/cm2
cellType = 'Ge';
Tem = Tem_var(1);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, LCOE_disc(:,1).*1000, '-o', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '-x', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '-^', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, LCOE_disc(:,1).*1000, '--o', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '--x', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '--^', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% Ge, Tem = 1600 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(2);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, LCOE_disc(:,1).*1000, '-o', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '-x', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '-^', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, LCOE_disc(:,1).*1000, '--o', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '--x', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '--^', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% Ge, Tem = 2500 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(3);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, LCOE_disc(:,1).*1000, '-o', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '-x', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '-^', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, LCOE_disc(:,1).*1000, '--o', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '--x', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '--^', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
hold off;
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('LCOEdisc (€/MWh)');
% Add legend
legend('show');
% Display the grid
grid off;
set(gcf, 'Color', 'w');
% Optional: Set axis limits for better visualization
% ylim([0 100]); % Adjust according to your data
xlim([Ttpv(1) Ttpv(end)]);
% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 12); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);

% InGaAs
orange1 = '#FFC88A';
orange2 = '#FF8A00';
orange3 = '#753F00';

subplot(2,4,5)
hold on;
% Plot the lines with specified styles
% Ge, Tem = 700 ºC, CPA_tpv = 10 €/cm2
cellType = 'In';
Tem = Tem_var(1);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, LCOE_disc(:,1).*1000, '-o', 'Color', orange1, 'MarkerFaceColor', orange1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '-x', 'Color', orange1, 'MarkerFaceColor', orange1,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '-^', 'Color', orange1, 'MarkerFaceColor', orange1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, LCOE_disc(:,1).*1000, '--o', 'Color', orange1, 'MarkerFaceColor', orange1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '--x', 'Color', orange1, 'MarkerFaceColor', orange1,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '--^', 'Color', orange1, 'MarkerFaceColor', orange1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% Ge, Tem = 1600 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(2);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, LCOE_disc(:,1).*1000, '-o', 'Color', orange2, 'MarkerFaceColor', orange2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '-x', 'Color', orange2, 'MarkerFaceColor', orange2,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '-^', 'Color', orange2, 'MarkerFaceColor', orange2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, LCOE_disc(:,1).*1000, '--o', 'Color', orange2, 'MarkerFaceColor', orange2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '--x', 'Color', orange2, 'MarkerFaceColor', orange2,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '--^', 'Color', orange2, 'MarkerFaceColor', orange2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% Ge, Tem = 2500 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(3);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, LCOE_disc(:,1).*1000, '-o', 'Color', orange3, 'MarkerFaceColor', orange3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '-x', 'Color', orange3, 'MarkerFaceColor', orange3,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '-^', 'Color', orange3, 'MarkerFaceColor', orange3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, LCOE_disc(:,1).*1000, '--o', 'Color', orange3, 'MarkerFaceColor', orange3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '--x', 'Color', orange3, 'MarkerFaceColor', orange3,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '--^', 'Color', orange3, 'MarkerFaceColor', orange3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
hold off;
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('LCOEdisc (€/MWh)');
% Add legend
legend('show');
% Display the grid
grid off;
set(gcf, 'Color', 'w');
% Optional: Set axis limits for better visualization
% ylim([0 100]); % Adjust according to your data
xlim([Ttpv(1) Ttpv(end)]);
% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 12); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);

subplot(2,4,2)
hold on;
% Plot the lines with specified styles
% In, Tem = 700 ºC, CPA_tpv = 10 €/cm2
cellType = 'Ge';
Tem = Tem_var(1);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, Pdens_tpv(:), '-', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, Pdens_tpv(:), '--', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% In, Tem = 1600 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(2);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, Pdens_tpv(:), '-', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, Pdens_tpv(:), '--', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% In, Tem = 2500 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(3);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, Pdens_tpv(:), '-', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, Pdens_tpv(:), '--', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
hold off;
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('TPV Power density (W/cm2)');
% Add legend
legend('show');
% Display the grid
grid off;
set(gcf, 'Color', 'w');
% Optional: Set axis limits for better visualization
% ylim([0 100]); % Adjust according to your data
xlim([Ttpv(1) Ttpv(end)]);
% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 12); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);

subplot(2,4,3)
hold on;
% Plot the lines with specified styles
% In, Tem = 700 ºC, CPA_tpv = 10 €/cm2
cellType = 'Ge';
Tem = Tem_var(1);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, n_tpv(:).*100, '-', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, n_tpv(:).*100, '--', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% In, Tem = 1600 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(2);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, n_tpv(:).*100, '-', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, n_tpv(:).*100, '--', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% In, Tem = 2500 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(3);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, n_tpv(:).*100, '-', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, n_tpv(:).*100, '--', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
hold off;
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('TPV Efficency (%)');
% Add legend
legend('show');
% Display the grid
grid off;
set(gcf, 'Color', 'w');
% Optional: Set axis limits for better visualization
% ylim([0 100]); % Adjust according to your data
xlim([Ttpv(1) Ttpv(end)]);
% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 12); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);

subplot(2,4,4)
hold on;
% Plot the lines with specified styles
% Ge, Tem = 700 ºC, CPA_tpv = 10 €/cm2
cellType = 'Ge';
Tem = Tem_var(1);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, PayBack(:,1), '-o', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, PayBack(:,2), '-x', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, PayBack(:,3), '-^', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, PayBack(:,1), '--o', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, PayBack(:,2), '--x', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, PayBack(:,3), '--^', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% Ge, Tem = 1600 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(2);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, PayBack(:,1), '-o', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, PayBack(:,2), '-x', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, PayBack(:,3), '-^', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, PayBack(:,1), '--o', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, PayBack(:,2), '--x', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, PayBack(:,3), '--^', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% Ge, Tem = 2500 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(3);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, PayBack(:,1), '-o', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, PayBack(:,2), '-x', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, PayBack(:,3), '-^', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, PayBack(:,1), '--o', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, PayBack(:,2), '--x', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 7, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, PayBack(:,3), '--^', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
hold off;
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('Payback (y)');
% Add legend
legend('show');
% Display the grid
grid off;
set(gcf, 'Color', 'w');
% Optional: Set axis limits for better visualization
% ylim([0 100]); % Adjust according to your data
xlim([Ttpv(1) Ttpv(end)]);
% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 12); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);


subplot(2,4,7)
hold on;
% Plot the lines with specified styles
% In, Tem = 700 ºC, CPA_tpv = 10 €/cm2
cellType = 'In';
Tem = Tem_var(1);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, Pdens_tpv(:), '-', 'Color', orange1, 'MarkerFaceColor', orange1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, Pdens_tpv(:), '--', 'Color', orange1, 'MarkerFaceColor', orange1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% In, Tem = 1600 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(2);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, Pdens_tpv(:), '-', 'Color', orange2, 'MarkerFaceColor', orange2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, Pdens_tpv(:), '--', 'Color', orange2, 'MarkerFaceColor', orange2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% In, Tem = 2500 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(3);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, Pdens_tpv(:), '-', 'Color', orange3, 'MarkerFaceColor', orange3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, Pdens_tpv(:), '--', 'Color', orange3, 'MarkerFaceColor', orange3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
hold off;
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('TPV Power density (W/cm2)');
% Add legend
legend('show');
% Display the grid
grid off;
set(gcf, 'Color', 'w');
% Optional: Set axis limits for better visualization
% ylim([0 100]); % Adjust according to your data
xlim([Ttpv(1) Ttpv(end)]);
% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 12); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);

subplot(2,4,5)
hold on;
% Plot the lines with specified styles
% In, Tem = 700 ºC, CPA_tpv = 10 €/cm2
cellType = 'In';
Tem = Tem_var(1);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, n_tpv(:).*100, '-', 'Color', orange1, 'MarkerFaceColor', orange1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, n_tpv(:).*100, '--', 'Color', orange1, 'MarkerFaceColor', orange1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% In, Tem = 1600 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(2);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, n_tpv(:).*100, '-', 'Color', orange2, 'MarkerFaceColor', orange2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, n_tpv(:).*100, '--', 'Color', orange2, 'MarkerFaceColor', orange2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% In, Tem = 2500 ºC, CPA_tpv = 10 €/cm2
Tem = Tem_var(3);
CPA_tpv = CPA_tpv_var(1);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, n_tpv(:).*100, '-', 'Color', orange3, 'MarkerFaceColor', orange3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
% CPA_tpv = 70 €/cm2
CPA_tpv = CPA_tpv_var(2);
fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem);
load(fname)
plot(Ttpv, n_tpv(:).*100, '--', 'Color', orange3, 'MarkerFaceColor', orange3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
hold off;
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('TPV Efficency (%)');
% Add legend
legend('show');
% Display the grid
grid off;
set(gcf, 'Color', 'w');
% Optional: Set axis limits for better visualization
% ylim([0 100]); % Adjust according to your data
xlim([Ttpv(1) Ttpv(end)]);
% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 12); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);
