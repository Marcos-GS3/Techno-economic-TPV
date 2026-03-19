%% LCOH calculations
CPP_hp = 900; % €/kWth
d = 0.05; % discount rate
n = 20; % installation lifetime (y)
COP = 3;
CF = (0.1:0.1:1)';
nb_h_year = 365*24;
teq = CF*nb_h_year;
CRF = (d*(1+d)^n)/((1+d)^n-1);
CPP_hp_ = CPP_hp * CRF/COP;
Cgrid = (0.02:0.02:0.3);
LCOH = (CPP_hp_ + Cgrid.*teq)./(COP.*teq);

contourf(Cgrid, CF, LCOH);
colorbar
xlabel('Electricity cost (€/kWh)');
ylabel('Capacity Factor');
set(gca, 'FontSize', 12);
colormap('Hot')