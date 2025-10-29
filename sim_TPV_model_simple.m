% simple model used to simulate electricity generation through TPV 
% being its conversion efficiency dependent on the TPV temperature
Ttpv = 40; % TPV temperature in ºC
Tem = 1400; % emitter temperature in ºC
n_tpv = n_tpv_function(Ttpv);
n_st = 0.95; % storage efficiency, accounts for insulation losses
n_ht = 0.95; % P2H conversion efficiency
n_th = 0.8; % thermal efficiency, related to the losses from the 

CF = 0.5; % capacity factor of use of PHPS
td = 20;  % discharge time in h
nb_h_year = 365*24;
Nd = CF*nb_h_year/td;

Tout = 80; % output heat temperature, in ºC
COP_hp = COP_function(Ttpv,Tout);

% Economic parameters
CPA_tpv = 10; % €/cm2
Pdens_tpv = Pdens_function(Tem)/1000; % in kW/m2
CPP_tpv = CPA_tpv*10000/Pdens_tpv; % €/kWel TPV cell
CPP_ht = 20; % €/kWel P2H converter
CPP_hp = 900; % €/kWth
CPE = 10; % /kWhth
CPP_em  = 0; % emiter cost, included in CPE
d = 0.05; % discount rate
n = 20; % installation lifetime
CRF = (d*(1+d)^n)/((1+d)^n-1);
LCOE_in = 0.01; % in €/kWh cost of the input electricity: eg., grid, PV
LCOH = 0.2; % gas cost

% Capital costs
CPE_ = CPE*CRF;
CPP_ht_ = CPP_ht*CRF;
CPP_em_ = CPP_em*CRF;
CPP_tpv_ = CPP_tpv*CRF;
CPP_hp_ = CPP_hp*CRF;

% LCOrH
LCOrH = (1/(n_th*n_st*n_ht))*(CPE_*n_ht + (CPP_ht_/(Nd*td)) + LCOE_in); %(CAPEX_storage + OPEX_input_el)/Etot_rad_phot
% LCOrH = 0.1; % change with formula


% LCOEdiscounted
CAPEX_tot = CPP_tpv_ + CPP_hp_*(1 - n_tpv)/(n_tpv*(COP_hp - 1)); % CAPEXtpv + CAPEXhp => Pel_hp = Pel_tpv*(1 - n_tpv)/(n_tpv*(COP_hp - 1))
OPEX_in_rad = LCOrH*Nd*td/n_tpv; % radiated photons cost, either from waste heat or from LHTPV battery
OPEX_sold_heat = LCOH*Nd*td*(1 - n_tpv)*COP_hp/(n_tpv*(COP_hp - 1)); % Qdem = Pel_hp * COP_hp
Etot = (n_tpv*COP_hp - 1)*Nd*td/(n_tpv*(COP_hp - 1)); % Pel_use = Pel_tpv*(n_tpv*COP_hp - 1)/(n_tpv*(COP_hp - 1))
LCOE_disc = (CAPEX_tot + OPEX_in_rad - OPEX_sold_heat)/Etot; % all these parameters are divided into Pel_tpv

function n_tpv = n_tpv_function(Ttpv)
    n_tpv = Ttpv/5;
end

function Pdens_tpv = Pdens_function(Tem)
    Pdens_tpv = Tem*2/Tem; % in W/cm2, depends as well on the type of TPV cell gap
end

function COP_hp = COP_function(Ttpv,Tout)
    eff = 0.35;
    COP_hp = eff*(Tout + 273)/(Tout - Ttpv); % T in K
end