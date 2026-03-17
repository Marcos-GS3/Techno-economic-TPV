%Datos InGaAs
% em=0.5;
% e1=0.74;
% BR=0.98;
% nint=0.5;
% Rs=0;
% Tc=300;

%Datos Ge
em=0.5;
e1=0.67;
BR=0.98;
nint=0.000005;
Rs=0;
Tc=55 + 273;

%%%%%%% Calculo de la matriz
Te_minC=600;
Te_maxC=2500;
Tc_minC=20;
Tc_maxC=120;

i=0;
j=0;
for TeC=Te_minC:50:Te_maxC
    i=i+1;
    for TcC=Tc_minC:5:Tc_maxC
        j=j+1;
        TeK=TeC+273; % Temperatura de emisor
        TcK=TcC+273; % Temperatura de célula
        OUT= TPVcell (em,e1,BR,nint,Rs,TeK,TcK);
        ef_TPV(i,j)=OUT(1);
        Pd(i,j)=OUT(2);
    end
    j=0;
end




    
