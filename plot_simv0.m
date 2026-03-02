% plot simple results
% Gernmanium
green1 = '#3BF553';
green2 = '#0AC724';
green3 = '#066F14';
% InGaAs
orange1 = '#FFC88A';
orange2 = '#FF8A00';
orange3 = '#753F00';
subplot(2,4,1)
hold on;

% Plot the lines with specified styles
load('sim0_Ge_Tem700.mat')
plot(Ttpv, LCOE_disc(:,1).*1000, '-o', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '-*', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '-^', 'Color', green1, 'MarkerFaceColor', green1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
load('sim0_Ge_Tem1600.mat')
plot(Ttpv, LCOE_disc(:,1).*1000, '-o', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '-*', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '-^', 'Color', green2, 'MarkerFaceColor', green2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
load('sim0_Ge_Tem2500.mat')
plot(Ttpv, LCOE_disc(:,1).*1000, '-o', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '-*', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '-^', 'Color', green3, 'MarkerFaceColor', green3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
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
ylim([0 100]); % Adjust according to your data
xlim([Ttpv(1) Ttpv(end)]);

% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 8); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);

subplot(2,3,2)
% InGaAs
hold on
load('sim0_In_Tem700.mat')
plot(Ttpv, LCOE_disc(:,1).*1000, '-o', 'Color', orange1, 'MarkerFaceColor', orange1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '-*', 'Color', orange1, 'MarkerFaceColor', orange1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '-^', 'Color', orange1, 'MarkerFaceColor', orange1,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
load('sim0_In_Tem1600.mat')
plot(Ttpv, LCOE_disc(:,1).*1000, '-o', 'Color', orange2, 'MarkerFaceColor', orange2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '-*', 'Color', orange2, 'MarkerFaceColor', orange2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '-^', 'Color', orange2, 'MarkerFaceColor', orange2,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
load('sim0_In_Tem2500.mat')
plot(Ttpv, LCOE_disc(:,1).*1000, '-o', 'Color', orange3, 'MarkerFaceColor', orange3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=0 €/MWh'); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '-*', 'Color', orange3, 'MarkerFaceColor', orange3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=25 €/MWh');         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '-^', 'Color', orange3, 'MarkerFaceColor', orange3,'MarkerSize', 5, 'LineWidth', 1.5, 'DisplayName', 'LCOrH=50 €/MWh'); % Custom yellow with filled circle markers
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
ylim([0 100]); % Adjust according to your data
xlim([Ttpv(1) Ttpv(end)]);

% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 8); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);
