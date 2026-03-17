
subplot(2,4,1)
hold on
plot(Ttpv, LCOE_disc(:,1).*1000, '-o', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
plot(Ttpv, LCOE_disc(:,2).*1000, '-x', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 7, 'LineWidth', 1.5);         % Custom red with filled circle markers
plot(Ttpv, LCOE_disc(:,3).*1000, '-^', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('LCOEdisc (€/MWh)');
% Add legend
% legend('show');
hold off
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
hold on
CAPEX_hp = CPP_hp_.*(1 - n_tpv)./(n_tpv.*(COP_hp - 1));
plot(Ttpv, CAPEX_tot, '-o', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
plot(Ttpv, CPP_tpv_, '--o', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
plot(Ttpv, CAPEX_hp, '.', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('CAPEX (€)');
% Add legend
% legend('show');
% Display the grid
grid off;
set(gcf, 'Color', 'w');
% Optional: Set axis limits for better visualization
ylim([0 max(CAPEX_tot)]); % Adjust according to your data
xlim([Ttpv(1) Ttpv(end)]);
% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 12); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);

subplot(2,4,3)
hold on
plot(Ttpv, OPEX_in_rad(:,1), '-o', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
plot(Ttpv, OPEX_in_rad(:,2), '-x', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
plot(Ttpv, OPEX_in_rad(:,3), '-^', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('OPEX radiated photons (€/y)');
% Add legend
% legend('show');
% Display the grid
grid off;
set(gcf, 'Color', 'w');
% Optional: Set axis limits for better visualization
ylim([0 max(max(OPEX_in_rad))]); % Adjust according to your dataxlim([Ttpv(1) Ttpv(end)]);
% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 12); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);

subplot(2,4,4)
hold on
plot(Ttpv, OPEX_sold_heat, '-o', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('OPEX sold heat (€/y)');
% Add legend
% legend('show');
% Display the grid
grid off;
set(gcf, 'Color', 'w');
% Optional: Set axis limits for better visualization
ylim([0 max(OPEX_sold_heat)]); % Adjust according to your dataxlim([Ttpv(1) Ttpv(end)]);
xlim([Ttpv(1) Ttpv(end)]);
% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 12); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);

subplot(2,4,5)
hold on
plot(Ttpv, n_tpv.*100, '-o', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('TPV efficiency (%)');
% Add legend
% legend('show');
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

subplot(2,4,6)
hold on
plot(Ttpv, COP_hp, '-o', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('COP');
% Add legend
% legend('show');
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
hold on
plot(Ttpv, Etot, '-o', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('Total Energy');
% Add legend
% legend('show');
% Display the grid
grid off;
set(gcf, 'Color', 'w');
% Optional: Set axis limits for better visualization
ylim([0 max(Etot)]); % Adjust according to your dataxlim([Ttpv(1) Ttpv(end)]);
xlim([Ttpv(1) Ttpv(end)]);
% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 12); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);

subplot(2,4,8)
hold on
plot(Ttpv, CAPEX_tot + OPEX_in_rad(:,1)' - OPEX_sold_heat, '-o', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
plot(Ttpv, CAPEX_tot + OPEX_in_rad(:,2)' - OPEX_sold_heat, '-x', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
plot(Ttpv, CAPEX_tot + OPEX_in_rad(:,3)' - OPEX_sold_heat, '-^', 'Color', 'k', 'MarkerFaceColor', 'k','MarkerSize', 5, 'LineWidth', 1.5); % Custom yellow with filled circle markers
% Add labels and title
xlabel('TPV cell temperature (ºC)');
ylabel('Numerator');
% Add legend
% legend('show');
% Display the grid
grid off;
set(gcf, 'Color', 'w');
% Optional: Set axis limits for better visualization
ylim([0 max(max(CAPEX_tot + OPEX_in_rad' - OPEX_sold_heat))]); % Adjust according to your dataxlim([Ttpv(1) Ttpv(end)]);
% Optional: Customize the appearance of the plot
set(gca, 'FontSize', 12); % Increase font size for better readability
set(gca, 'LineWidth', 1.5); 
set(gca, 'Box', 'on', 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.5);
