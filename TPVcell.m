
function [OUT] = TPVcell (em,e1,BR,nint,Rs,Te,Tc)

% e1: bandgap (eV)
% BR: BSR reflectivity
% nint: internal photoluminscent efficiency of the cell
% Rs: Series resistance (ohm*cm2)
% Te: emitter temperature (K?)
% la emisividad (=f(e)) viene dada en las funciones de abajo del flujo de fotones.

%CONSTANTS
q=1.602177e-19;     %Electron charge (C)
k=1.3807e-23;       %Boltzmann constant (J/K)
h=6.6262e-34;       %Plank Constant (J.seg)
c=2.99792458e8;     %Speed of light (m/seg)

%inicializar
ef_TPV=0;
J1=0;
NRR_ratio=0;

%parameters
%ae=0.2;            %emitter emissivity
%em=0.7;             %emitter emissivity
NRR=(1-nint)/nint;
%Constant parameters
ece=0;
Fe_env=0;

%EPV=1/(1-Fe_env); %asumption Fcc=0 y Fcenv=0
EPV = 1; %emitter-to-cells  area ratio (Ae/Ac)

%PARAMETERS
%ne=1;              %Refraction index of the medium in between the cells and the emitter
npv=3.5;            %Refraction index of the semiconductor
Tenv=Tc;            %Environment temperature (K)
Fec=1-Fe_env;       %Emitter-Cells View Factor (no units)
Fcc=1-EPV*Fec;      %Cells-to-cells View Factor (no units), we assume that Fc_env=0 (the cells doesn't "see" the open cavity holes noted as "env") 

%parameters to obtain radiative energy/photon fluxes (I've check that these
%values are enough for STPV systems)
pasos=5000;         %Number of steps for the spectral integration of energy fluxes
x_inferior=1e-2;    %inferior limit for the integration (x=kT/(E-qV))
x_superior=5e2;     %superior limit for the integration (x=kT/(E-qV))

opts_fminbnd = optimset('Display','off');

Vmpp = fminbnd(@JV,0,e1,opts_fminbnd); %Vmpp es la tensión internal de la célula (antes de Rs) que maximiza la potencia considerando las pérdidas en Rs.
[Qemit, J1, ef_TPV, Pd] = TPV(e1,Vmpp,BR,NRR,Te);

%Calculo de Jsc
%[~, Jsc, ~, ~] = TPV(e1,0,BR,NRR,Te);

Pd=1e-4*Pd; %paso a W/cm2
Qemit=1e-4*Qemit; %paso a W/cm2
Vmpp_out=Vmpp-J1*Rs;   

%OUT=[ef_TPV, Pd, Vmpp, J1, Qemit, NRR_ratio];
OUT=[ef_TPV, Pd, Vmpp_out, J1, Qemit];

function invPd = JV(V1)
    J1=q*pi*(EPV*Fec*N_em(max(e1,ece),inf,Te,0)-(1-Fcc)*N(e1,inf,Tenv,V1)-2*NRR*(npv^2)*N(e1,inf,Tenv,V1)-(1-BR)*(npv^2)*N(e1,inf,Tenv,V1)+EPV*(Fec^2)*(N(e1,inf,Tenv,V1)-N_em(e1,inf,Tenv,V1)));     
    NRR_ratio=(2*NRR*(npv^2)*N(e1,inf,Tenv,V1))/((1-Fcc)*N(e1,inf,Tenv,V1)+(1-BR)*(npv^2)*N(e1,inf,Tenv,V1));
    %invPd=-(J1*V1-Rs*(1e-4)*(J1^2));
    invPd=-(J1*V1-Rs*(1e-4)*(J1^2)); %Rs in ohm*cm2, J1 in A/m2
end


function [Qemit, J1, ef_TPV, Pd] = TPV(e1,Vmpp,BR,NRR,Te)

%Radiative energy balance
Qemit=-pi*(Fec*E_em1(e1,inf,Tenv,Vmpp)+E_em2(ece,e1,Te,0)-E_em1(ece,inf,Te,0));

%Current density (A/m2)
J1=q*pi*(EPV*Fec*N_em(max(e1,ece),inf,Te,0)-(1-Fcc)*N(e1,inf,Tenv,Vmpp)-2*NRR*(npv^2)*N(e1,inf,Tenv,Vmpp)-(1-BR)*(npv^2)*N(e1,inf,Tenv,Vmpp)+EPV*(Fec^2)*(N(e1,inf,Tenv,Vmpp)-N_em(e1,inf,Tenv,Vmpp))); 

%TPV efficiency and power density
Pd=J1*Vmpp-Rs*(1e-4)*(J1^2);
ef_TPV=(1/EPV)*Pd/(abs(Qemit));

% %TPV efficiency and power density
% ef_TPV=(1/EPV)*(J1*Vmpp)/(abs(Qemit));
% Pd=J1*Vmpp;

J1=(1e-4)*J1; %convert to A/cm2

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTIONS USED TO CALCULATE PHOTON AND ENERGY FLUXES
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculation of radiative fluxes and its derivatives making the variable 
% change x=kT/(E-qV). This variable change is explained in Ref:
% M.Levy,C.Honsberg,"Rapid and precise calculations of energy and particle
% flux for detailed-balance photovoltaic applications"
% Solid-StateElectronics 50, (2006) 1400�1405.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function valor = N(emin,emax,T,V)
%Calculation of the photon flux for the spectral band emin-emax (eV) of a
%body at temperature T and with chemical potential q*V.

%convert from eV to J
eminj=q*emin;
emaxj=q*emax;
mu=q*V; %chemical potential

%variable change
xmin=k*T/(emaxj-mu);
xmax=k*T/(eminj-mu);

%set integration limits
x_inf=max(x_inferior,xmin);
x_sup=min(x_superior,xmax);
x=logspace(log10(x_inf),log10(x_sup),pasos);

%integrate using trapz
integrand=(((k*T./x)+mu).^2).*(1./((x.^2).*((exp(1./x))-1)));
photons=(2*k*T)/((c^2)*(h^3))*integrand;
photons_int=trapz(x,photons);
valor=photons_int;
end

function valor = N_em(emin,emax,T,V) %incluye la emisividad
%Calculation of the photon flux for the spectral band emin-emax (eV) of a
%body at temperature T and with chemical potential q*V.

%convert from eV to J
eminj=q*emin;
emaxj=q*emax;
mu=q*V; %chemical potential

%variable change
xmin=k*T/(emaxj-mu);
xmax=k*T/(eminj-mu);

%set integration limits
x_inf=max(x_inferior,xmin);
x_sup=min(x_superior,xmax);
x=logspace(log10(x_inf),log10(x_sup),pasos);

%emissivity
%a=217.349; %tántalo
%b=0.948; %tántalo
%em=a*(1e9*h*c./((k*T./x)+mu)).^(-b); %emissivity =f(x);
%em=0.7; %black body

%integrate using trapz
integrand=em.*(((k*T./x)+mu).^2).*(1./((x.^2).*((exp(1./x))-1)));
photons=(2*k*T)/((c^2)*(h^3))*integrand;
photons_int=trapz(x,photons);
valor=photons_int;
end


function valor = E(emin,emax,T,V)
%Calculation of the energy flux for the spectral band emin-emax (eV) of a
%body at temperature T and with chemical potential q*V.

%convert from eV to J
eminj=q*emin;
emaxj=q*emax;
mu=q*V; %chemical potential

%variable change
xmin=k*T/(emaxj-mu);
xmax=k*T/(eminj-mu);

% set integration limits
x_inf=max(x_inferior,xmin);
x_sup=min(x_superior,xmax);
x=logspace(log10(x_inf),log10(x_sup),pasos);

% integrate using trapz
integrand=(((k*T./x)+mu).^3).*(1./((x.^2).*((exp(1./x))-1)));
energy=(2*k*T)/((c^2)*(h^3))*integrand;
energy_int=trapz(x,energy);
valor=energy_int;
end

function valor = E_em1(emin,emax,T,V)
%Calculation of the energy flux for the spectral band emin-emax (eV) of a
%body at temperature T and with chemical potential q*V.

%convert from eV to J
eminj=q*emin;
emaxj=q*emax;
mu=q*V; %chemical potential

%variable change
xmin=k*T/(emaxj-mu);
xmax=k*T/(eminj-mu);

% set integration limits
x_inf=max(x_inferior,xmin);
x_sup=min(x_superior,xmax);
x=logspace(log10(x_inf),log10(x_sup),pasos);

%emissivity
%a=217.349; %tántalo
%b=0.948; %tántalo
%em=a*(1e9*h*c./((k*T./x)+mu)).^(-b); %emissivity =f(x);
%em=0.7; %black body

% integrate using trapz
integrand=em.*(((k*T./x)+mu).^3).*(1./((x.^2).*((exp(1./x))-1)));
energy=(2*k*T)/((c^2)*(h^3))*integrand;
energy_int=trapz(x,energy);
valor=energy_int;
end


function valor = E_em2(emin,emax,T,V)
%Calculation of the energy flux for the spectral band emin-emax (eV) of a
%body at temperature T and with chemical potential q*V.

%convert from eV to J
eminj=q*emin;
emaxj=q*emax;
mu=q*V; %chemical potential

%variable change
xmin=k*T/(emaxj-mu);
xmax=k*T/(eminj-mu);

% set integration limits
x_inf=max(x_inferior,xmin);
x_sup=min(x_superior,xmax);
x=logspace(log10(x_inf),log10(x_sup),pasos);

%emissivity
%a=217.349; %tántalo
%b=0.948; %tántalo
%em=a*(1e9*h*c./((k*T./x)+mu)).^(-b); %emissivity =f(x);
%em=0.7; %black body

cavity=BR*EPV.*em.*em.*(Fec^2).*(1./(1-BR.*(Fcc+EPV*(Fec^2).*(1-em)))); %efecto de la cavidad TPV

% integrate using trapz
integrand=cavity.*(((k*T./x)+mu).^3).*(1./((x.^2).*((exp(1./x))-1)));
energy=(2*k*T)/((c^2)*(h^3))*integrand;
energy_int=trapz(x,energy);
valor=energy_int;
end


end
