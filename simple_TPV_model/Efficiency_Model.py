# %%
import numpy as np
from scipy.integrate import trapz
from scipy.optimize import minimize_scalar

class TPVCell:
    def __init__(self, em, eg_ref, dEg_dT, BR, nint, Rs, Te, Tc_ref):
        # Constantes físicas
        self.q = 1.602177e-19    # C
        self.k = 1.3807e-23      # J/K
        self.h = 6.6262e-34      # J.s
        self.c = 2.99792458e8    # m/s
        
        # Parámetros de la célula
        self.em = em
        self.eg_ref = eg_ref     # Bandgap a temperatura de referencia (eV)
        self.dEg_dT = dEg_dT     # Coeficiente de temperatura del bandgap (eV/K)
        self.Tc_ref = Tc_ref     # Temperatura de referencia para el bandgap (K)
        self.BR = BR
        self.Rs = Rs             # ohm*cm2
        self.Te = Te             # Temperatura del emisor (K)
        
        # Óptica y geometría
        self.npv = 3.5  #Cell refractive index
        self.EPV = 1.0  #Area ratio: A_e/A_c
        self.Fec = 1.0
        self.Fcc = 0.0
        
        # Recombinación base
        self.NRR = (1 - nint) / nint  #nint: internal photoluminscent efficiency of the cell
        
        # Parámetros de integración
        self.pasos = 5000
        self.x_inferior = 1e-2
        self.x_superior = 5e2

    def calculate_bandgap(self, Tc):
        return self.eg_ref + self.dEg_dT * (Tc - self.Tc_ref)

    def N_flux(self, emin, emax, T, V):
        """Flujo de fotones"""
        eminj = self.q * emin
        emaxj = self.q * emax
        mu = self.q * V
        
        xmin = self.k * T / (emaxj - mu) if emaxj != np.inf else 0
        xmax = self.k * T / (eminj - mu)
        
        x_inf = max(self.x_inferior, xmin)
        x_sup = min(self.x_superior, xmax)
        x = np.logspace(np.log10(x_inf), np.log10(x_sup), self.pasos)
        
        # Integrando
        termino1 = ((self.k * T / x) + mu)**2 #E^2
        termino2 = 1 / ((x**2) * (np.exp(1/x) - 1)) #dE y denominador de la distribución de Planck
        integrand = termino1 * termino2
        
        photons = (2 * self.k * T) / ((self.c**2) * (self.h**3)) * integrand
        return trapz(photons, x)
    
    def calculate_J(self, V, Tc):
        """Calcula la densidad de corriente J (A/m²) para un voltaje V dado."""
        e1_T = self.calculate_bandgap(Tc)
        
        # 1. Corriente de fotogeneración (fotones que llegan del emisor Te)
        N_gen = self.N_flux(e1_T, np.inf, self.Te, V=0)
        J_gen = self.q * N_gen * self.em * self.EPV
        
        # 2. Recombinación radiativa (fotones re-emitidos por la célula a Tc)
        N_rec = self.N_flux(e1_T, np.inf, Tc, V=V)
        J_rec_rad = self.q * N_rec
        
        # 3. Corriente neta considerando recombinaciones no radiativas (NRR)
        J_rec_total = J_rec_rad * (1 + self.NRR)
        J = J_gen - J_rec_total
        
        return J
    
    def optimize_Vmpp(self, Tc):
        """Encuentra el voltaje que maximiza la potencia."""
        e1_T = self.calculate_bandgap(Tc)
        
        # Función objetivo a minimizar (negativo de la potencia)
        def objective_JV(V):
            J = self.calculate_J(V, Tc)
            
            # Si el diodo entra en corriente negativa, la potencia es cero
            if J <= 0:
                return 0.0
                
            Pd = J * V  # Densidad de Potencia (W/m²)
            
            # ¡CLAVE! Devolvemos -Pd porque scipy solo sabe MINIMIZAR.
            # Minimizar el negativo de la potencia es equivalente a MAXIMIZAR la potencia.
            return -Pd

        # Buscamos el voltaje óptimo entre 0 y el Bandgap en eV
        res = minimize_scalar(objective_JV, bounds=(0, e1_T), method='bounded')
        
        Vmpp = res.x
        Pd_max = -res.fun  # Volvemos a cambiar el signo para tener la potencia positiva real
        
        return Vmpp, Pd_max
        
    def solve(self, Tc):
        """Resuelve el balance radiativo y eléctrico para una temperatura dada Tc."""
        e1_T = self.calculate_bandgap(Tc)
        Vmpp, Pd_max = self.optimize_Vmpp(Tc)
        
        # Lógica de cálculo de Qemit, Pd, J1, ef_TPV usando e1_T
        # ...
        
        return {"ef_TPV": 0, "Pd": Pd_max, "Vmpp_out": Vmpp, "J1": 0, "Qemit": 0}

# Ejemplo de uso en el bucle térmico:
# cell = TPVCell(em=0.7, eg_ref=0.73, dEg_dT=-0.0003, BR=0.9, nint=0.95, Rs=0.1, Te=1500, Tc_ref=300)
# out = cell.solve(Tc=350)

