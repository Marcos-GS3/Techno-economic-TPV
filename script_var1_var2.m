% Input techno-economic assumptions
%Datos TPV cell
if strcmp(cellType,'In')
    e1 = 0.74;
    nint = 0.5;
elseif strcmp(cellType,'Ge')
    e1=0.67;
    nint=0.000005;
end
% Common data cells
BR=0.98;
em=0.5;
Rs=0;

var1 = (20:5:79); % TPV temperature in ºC
Ttpv = var1;
var2 = (0.02:0.02:0.3);
Cgrid = var2;
% Economic parameters
% CPA_tpv = 10; % €/cm2
CPP_hp = 900; % €/kWth
d = 0.05; % discount rate
n = 25; % installation lifetime (y)
% Cgrid = 0.17;
inf_el = 0.02;
% LCOH = 0.07; % gas cost
% LCOrH = (1/(n_th*n_st*n_ht))*(CPE_*n_ht + (CPP_ht_/(Nd*td)) + LCOE_in); %(CAPEX_storage + OPEX_input_el)/Etot_rad_phot
% LCOrH = [0 0.025 0.05]; % €/kWh
% for j=14
for j = 1:1:length(var2)
    % data for LHTPV or PHPS
    % CF = 1; % capacity factor of use of PHPS
    % Heating data
    Tout = 80; % output heat temperature, in ºC
    for i = 1:1:length(var1)
    % for i=11
        TemK = Tem + 273; % Temperatura de emisor
        TtpvK(i,j) = Ttpv(i) + 273; % Temperatura de célula
        data_cell = TPVcell (em,e1,BR,nint,Rs,TemK,TtpvK(i,j));
        % n_tpv(i) = max(data_cell(1),0);
        % Pdens_tpv(i) = max(data_cell(2),0); % in W/cm2
        n_tpv(i,j) =data_cell(1);
        Pdens_tpv(i,j) = data_cell(2); % in W/cm2
        CPP_tpv(i,j) = CPA_tpv*1000/Pdens_tpv(i,j); % €/kWel TPV cell
        nb_h_year = 365*24;
        teq = CF*nb_h_year;
        
        % Capital costs
        CRF = (d*(1+d)^n)/((1+d)^n-1);
        CPP_tpv_(i,j) = CPP_tpv(i,j)*CRF;
        if (Ttpv(i) < Tout) % need heat pump
            COP_hp(i,j) = COP_function(Ttpv(i),Tout);
            CPP_hp_(i,j) = CPP_hp*CRF/COP_hp(i,j);
            CAPEX_tot(i,j) = CPP_tpv_(i,j) + CPP_hp_(i,j)*(1 - n_tpv(i,j))/(n_tpv(i,j)*(COP_hp(i,j) - 1)); % CAPEXtpv + CAPEXhp => Pel_hp = Pel_tpv*(1 - n_tpv)/(n_tpv*(COP_hp - 1))
            OPEX_sold_heat(i,j) = LCOH*teq*(1 - n_tpv(i,j))*COP_hp(i,j)/(n_tpv(i,j)*(COP_hp(i,j) - 1)); % Qdem = Pel_hp * COP_hp
            Etot(i,j) = (n_tpv(i)*COP_hp(i,j) - 1)*teq/(n_tpv(i,j)*(COP_hp(i,j) - 1)); % Pel_use = Pel_tpv*(n_tpv*COP_hp - 1)/(n_tpv*(COP_hp - 1))
            Cgrid_tot_ref(i,j) = Cgrid(j)*teq*(n_tpv(i,j)*COP_hp(i,j) - 1)/(n_tpv(i,j)*(COP_hp(i,j) - 1)); % multiplied by Pel_use
        else    
            COP_hp(i,j) = NaN;
            CPP_hp_(i,j) = CPP_hp*CRF/COP_hp(i,j);
            CAPEX_tot(i,j) = CPP_tpv_(i,j); 
            OPEX_sold_heat(i,j) = LCOH*teq*(1 - n_tpv(i,j))/n_tpv(i,j);
            Etot(i,j) = teq;
            Cgrid_tot_ref(i,j) = teq; % multiplied by Pel_use
        end
        if (COP_hp(i,j) < 1/n_tpv(i,j)) % then Etot negative
            Etot(i,j) = NaN;
            Cgrid_tot_ref(i,j) = NaN;
        end
        % LCOEdiscounted
        OPEX_in_rad(i,j) = LCOrH*teq/n_tpv(i,j); % radiated photons cost, either from waste heat or from LHTPV battery
        LCOE_disc(i,j) = (CAPEX_tot(i,j) + OPEX_in_rad(i,j) - OPEX_sold_heat(i,j))/Etot(i,j); % previous parameters are multiplied by Pel_tpv as common factor
        
        Cgrid_tot_ye(i,j) = OPEX_in_rad(i,j) - OPEX_sold_heat(i,j);
        NetSaves(1) = (Cgrid_tot_ref(i,j) - Cgrid_tot_ye(i,j))/((1+d)^(1));
        Ctot = CAPEX_tot(i,j)/CRF;
        Ctot_ref = 0;
        CumCashFlow(1) =  -Ctot + Ctot_ref + NetSaves(1);
        if(isnan(NetSaves(1)))
            PayBack(i,j) = NaN;
        else
            margen = 200;
            for xx=2:n+margen
                NetSaves(xx) = (Cgrid_tot_ref(i,j) - Cgrid_tot_ye(i,j))*((1+inf_el)^(xx))/((1+d)^(xx));
                CumCashFlow(xx) = CumCashFlow(xx-1) + NetSaves(xx);
                if (xx>=n+margen)&&(CumCashFlow(xx)>0)
                    break;
                end
            end
            if CumCashFlow(1)>0
                year_pbt(i,j)=0;
            else
               year_pbt(i,j)=find(CumCashFlow<0,1,'last');
            end
            if year_pbt(i,j) == 0
                PayBack(i,j)=abs(Ctot - Ctot_ref)/NetSaves(1);
                ROI_=100*CumCashFlow(n)/Ctot;           %return on investment (%)  
            elseif year_pbt(i,j)<(n+margen)
                PayBack(i,j)=year_pbt(i,j)+abs(CumCashFlow(year_pbt(i,j)))/NetSaves(year_pbt(i,j)+1);
                ROI_=100*CumCashFlow(n)/Ctot;           %return on investment (%)  
            else 
                %disp('Error 1 HP: Payback time es demasiado alto: hay que aumentar el valor del parámetro "margen"');
                year_pbt(i,j);
                PayBack(i,j)=NaN;
                ROI_=NaN;%100*CumCashFlow(DURATION)/Cap_cost
                LCOE_elec=inf;
                ValidResult=false;
            end
        end
    end
end

fname = sprintf('sim0_CF%d_CPA%d_LCOH%d_%s_Tem%d_LCOrH%d_varTc_Cgrid.mat', CF*100, round(CPA_tpv), round(LCOH*100), cellType, Tem, round(LCOrH*1000));
save(fname)

function COP_hp = COP_function(Ttpv,Tout)
    eff = 0.35;
    COP_hp = eff*(Tout + 273)/(Tout - Ttpv); % T in K
end