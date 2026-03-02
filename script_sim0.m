
% Input techno-economic assumptions
%Datos TPV cell: InGaAs
e1 = 0.74;
nint = 0.5;

%Datos Ge
% e1=0.67;
% nint=0.000005;

% Common data cells
BR=0.98;
em=0.5;
Rs=0;

% Ttpv = 40; % TPV temperature in ºC
Ttpv = (20:5:120); % TPV temperature in ºC
Tem = 1400; % emitter temperature in ºC


% Economic parameters
CPA_tpv = 10; % €/cm2
CPP_ht = 20; % €/kWel P2H converter
CPP_hp = 900; % €/kWth
CPE = 10; % /kWhth
CPP_em  = 0; % emiter cost, included in CPE
d = 0.05; % discount rate
n = 20; % installation lifetime y
LCOE_in = 0.01; % in €/kWh cost of the input electricity: eg., grid, PV
LCOH = 0.07; % gas cost
% LCOrH
% LCOrH = (1/(n_th*n_st*n_ht))*(CPE_*n_ht + (CPP_ht_/(Nd*td)) + LCOE_in); %(CAPEX_storage + OPEX_input_el)/Etot_rad_phot
LCOrH = [0 0.025 0.05]; % €/kWh
% for j=1
for j = 1:1:length(LCOrH)
    % data for LHTPV or PHPS
    CF = 0.5; % capacity factor of use of PHPS
    td = 20;  % discharge time in h
    % Heating data
    Tout = 80; % output heat temperature, in ºC
    for i = 1:1:length(Ttpv)
    % for i = 2
        TemK = Tem + 273; % Temperatura de emisor
        TtpvK(i) = Ttpv(i) + 273; % Temperatura de célula
        % n_tpv = n_tpv_function(Ttpv,Tem);
        data_cell = TPVcell (em,e1,BR,nint,Rs,TemK,TtpvK(i));
        n_tpv(i) = max(data_cell(1),0);
        Pdens_tpv(i) = max(data_cell(2),0); % in kW/m2
        % Pdens_tpv = Pdens_function(Tem)/1000; % in kW/m2
        CPP_tpv = CPA_tpv*10000/Pdens_tpv(i); % €/kWel TPV cell
        nb_h_year = 365*24;
        % Nd = CF*nb_h_year/td;
        teq = CF*nb_h_year;
        
        % Capital costs
        CRF = (d*(1+d)^n)/((1+d)^n-1);
        CPE_ = CPE*CRF;
        CPP_ht_ = CPP_ht*CRF;
        CPP_em_ = CPP_em*CRF;
        CPP_tpv_ = CPP_tpv*CRF;
        if (Ttpv(i) < Tout) % need heat pump
            COP_hp(i) = COP_function(Ttpv(i),Tout);
            CPP_hp_ = CPP_hp*CRF*COP_hp(i);
            CAPEX_tot(i) = CPP_tpv_ + CPP_hp_*(1 - n_tpv(i))/(n_tpv(i)*(COP_hp(i) - 1)); % CAPEXtpv + CAPEXhp => Pel_hp = Pel_tpv*(1 - n_tpv)/(n_tpv*(COP_hp - 1))
            OPEX_sold_heat(i) = LCOH*teq*(1 - n_tpv(i))*COP_hp(i)/(n_tpv(i)*(COP_hp(i) - 1)); % Qdem = Pel_hp * COP_hp
            Etot(i) = (n_tpv(i)*COP_hp(i) - 1)*teq/(n_tpv(i)*(COP_hp(i) - 1)); % Pel_use = Pel_tpv*(n_tpv*COP_hp - 1)/(n_tpv*(COP_hp - 1))
        else    
            COP_hp(i) = NaN;
            CPP_hp_ = CPP_hp*CRF*COP_hp(i);
            CAPEX_tot(i) = CPP_tpv_; 
            OPEX_sold_heat(i) = LCOH*teq*(1 - n_tpv(i))/n_tpv(i);
            Etot(i) = teq;
        end
        if (COP_hp(i) < 1/n_tpv(i)) % then Etot negative
            Etot(i) = NaN;
        end
        % LCOEdiscounted
        OPEX_in_rad(i) = LCOrH(j)*teq/n_tpv(i); % radiated photons cost, either from waste heat or from LHTPV battery
        LCOE_disc(i,j) = (CAPEX_tot(i) + OPEX_in_rad(i) - OPEX_sold_heat(i))/Etot(i); % previous parameters are multiplied by Pel_tpv as common factor
    end
end

% save('sim0_Ge_Tem2500.mat')

function COP_hp = COP_function(Ttpv,Tout)
    eff = 0.35;
    COP_hp = eff*(Tout + 273)/(Tout - Ttpv); % T in K
end