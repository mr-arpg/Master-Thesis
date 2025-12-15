#import "@preview/thesist:1.0.2": flex-caption, subfigure-grid
#show figure: set block(breakable: true)

= Modelling of $N_2-H_2$ Plasmas <modelling-nh3-plasmas>


While experimental diagnostics provide invaluable macroscopic data on species concentrations and electrical parameters, a microscopic description is required to deepen the understanding of $N_2-H_2$ plasmas across the vast range of working conditions. This is the domain of plasma modeling, a powerful method that simulates the complex interplay of hundreds of chemical reactions occurring over disparate timescales.

As introduced in the @state-of-the-art review, a plasma chemical model can be described by a large system of coupled differential equations to calculate the particle densities of every species in the plasma. The predictive power of such a model is not determined by the sophistication of the numerical solver, but by the quality of the physical and chemical data it is fed. At the heart of these data lies the chemical scheme: a comprehensive collection of all relevant reactions and their rate coefficients. Model accuracy is exquisitely sensitive to these coefficients; errors or uncertainties cascade through the simulation, particularly in complex networks like $N_2-H_2$ where $N H_3$ results from long, competing chains of volume and surface reactions. The final predicted $N H_3$ concentration is only as accurate as the weakest link in this kinetic chain. 
Therefore, compiling a chemical kinetic database is not a simple act of data collection. It is a critical research step involving an extensive and systematic review of published literature to identify not only the relevant reactions but also the various, often conflicting, rate coefficients proposed for them.

For several crucial reactions, a comparison of different literature sources shows rate coefficients that can differ by a factor of ten or more at similar electron temperatures or gas temperatures. This is not a minor numerical discrepancy; it represents a fundamental disagreement on the importance of a given reaction pathway. This discovery shaped the entire modeling strategy of the project team, this thesis in particular. It became clear that simply selecting one kinetic set from a single publication would be arbitrary and scientifically unsound. It was necessary to treat the choice of the chemical scheme as a variable to be investigated. To this end, a comprehensive database was created, cataloging multiple proposed rate coefficients for each key reaction, each based on the data from a different literature source or a combination thereof.

== Chemical Model Development

The development of the chemical model was based essentially on the chemical scheme of Redondo _et al._ @chatain_2020@redondo2 complemented with the mesoscopic surface model of Gordiets _et al._ @gordiets_1998. In this work, this chemical scheme was updated to include information from the the work of Capitelli _et al._ @capitelli_ferreira_gordiets_osipov_2019, NIST Chemical Kinetics Database @NIST_Kinetics, and recent publication by Bang _et al._ @bang2023kinetic. Tables @table-k-plus and @table-k-minus summarize the rate coefficients data from these sources for direct and reverse reactions, respectively. For comparison, the tables show also data used by the PSI.COM project @psi2022project. Whenever available, formula are specified, and in these cases the values are calculations at the reference temperature of 300 K.

The reactions and rate coefficients were harmonized to the Arrhenius form $k = A (T/300)^n exp(-E_a/T)$, with units converted to $m^3 s^(-1)$ and $m^6 s^(-1)$, for two-body and three-body processes, respectively. The tables do not specify the state configuration of its species since this information was absent in Capitelli _et al._ @capitelli_ferreira_gordiets_osipov_2019. The table show disparate values for the rate coefficients proposed by the different sources. In particular, the values by Bang _et al._ @bang2023kinetic are often very different by several orders of magnitude, probably due to sign errors in the exponential factor. For this reason, preference was given to the expressions proposed by Capitelli _et al._ using NIST for cross-checking. Regarding NIST data, theoretical values were only used when experimental data were unavailable. Note that Capitelli's data were derived at atmospheric pressure and high gas temperatures, typically above 1000 K. Therefore, the values of $A$ and $E_a$ in Capitelli's expressions were adjusted in some cases. After the assessement of the data showed in the tables, a final set of rate coefficients was selected, marked as green cells. In cases of strong disagreement between the values of rate coefficients from different sources, a range of uncertainty was put on record for future use in uncertainty analysis.

// TABLE 1: Forward rate coefficients (k+)



#figure(
  caption: [Forward rate coefficients for N₂-H₂ chemistry. Table shows both formulas and, when available, values at 300 K. Bang _et al._ adopts the notation "rrr" for some rate coefficients, which means "reverse reaction rate".]  
)[
  #set text(size: 7pt)


  #table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    align: (left, left, left, left, left),
    stroke: 0.5pt,
    inset: 3pt,
    
    [*Reaction*], [*Capitelli*], [*PSI.COM*], [*Bang*], [*NIST*],
    
    // Row 1-2
    [N₂H₄+M ↔ 2NH₂+M], 
    [6.60E-15 \* (T/300)^0 \* EXP(-20600/T)],
    [-],
    [-],
    [1.66E-5\*EXP(-251000/(8.314472\*T))\*1E-6],
    
    [For T=300K],
    [9.95E-45],
    [0],
    [rrr],
    [3.30E-55],
    
    // Row 3-4
    [N₂H₄+M ↔ N₂H₃+H+M],
    [1.70E-15 \* (T/300)^0 \* EXP(-32000/T)],
    [-],
    [4550000000 \* T^-7.69\* EXP(42130 / T)],
    [-],
    
    [For T=300K],
    [8.05E-62],
    [0],
    [3.97E+51],
    [0],
    
    // Row 5-6
    [N₂H₃+M ↔ N₂H₂+H+M],
    [1.70E-16 \* (T/300)^0 \* EXP(-25000/T)],
    [-],
    [2.13E-19 \* T^0.819 \* EXP(24210 / T)],
    [-],
    
    [For T=300K],
    [1.09E-52],
    [0],
    [2.54E+18],
    [0],
    
    // Row 7-8
    [N₂H₃(+M) ↔ NH₂+NH(+M)],
    [1.70E-14 \* (T/300)^0 \* EXP(-21000/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [6.76E-45],
    [0],
    [0],
    [0],
    
    // Row 9-10
    [N₂H₂(+M) ↔ 2NH(+M)],
    [5.20E-14 \* (T/300)^0 \* EXP(-50000/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [2.16E-86],
    [0],
    [0],
    [0],
    
    // Row 11-12
    [N₂H+M ↔ N₂+H+M],
    [3.30E-16 \* (T/300)^0 \* EXP(-10000/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [1.10E-30],
    [0],
    [5.48E+19],
    [0],
    
    // Row 13-14
    [N₂H+M ↔ NH+N+M],
    [1.70E-15 \* (T/300)^0 \* EXP(-35000/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [3.65E-66],
    [0],
    [0],
    [0],
    
    // Row 15-16
    [NH₃+M ↔ NH₂+H+M],
    [4.20E-14 \* (T/300)^0 \* EXP(-47200/T)],
    [-],
    [3.5E-14 \* EXP(47040 / T)],
    [3.65E-8\*EXP(-391000/(8.314472\*T))\*1E-6],
    
    [For T=300K],
    [1.97E-82],
    [1.6E+16],
    [4.38E+54],
    [3.05E-82],
    
    // Row 17-18
    [NH₃+M ↔ NH+H₂+M],
    [1.00E-15 \* (T/300)^0 \* EXP(-47000/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [9.13E-84],
    [0],
    [0],
    [-],
    
    // Row 19-20
    [NH₂+M ↔ NH+H+M],
    [5.80E-12 \* (T/300)^2 \* EXP(-46000/T)],
    [-],
    [1.99E-15 \* EXP(38250 / T)],
    [1.99E-9\*EXP(-318000/(8.314472\*T))],
    
    [For T=300K],
    [1.48E-78],
    [0],
    [4.69E+40],
    [8.54E-65],
    
    // Row 21-22
    [NH+M ↔ N+H+M],
    [5.80E-14 \* (T/300)^2 \* EXP(-42000/T)],
    [-],
    [-],
    [2.99E-10\*EXP(-313000/(8.314472\*T))],
    
    [For T=300K],
    [9.17E-75],
    [0],
    [0],
    [9.52E-65],
    
    // Row 23-24
    [N₂H₄+H ↔ N₂H₃+H₂],
    [2.10E-17 \* (T/300)^0 \* EXP(-1260/T)],
    [1.2E-17 EXP(-1260/T)],
    [4.58E-27 × T^2.56 ×EXP(614.1/T)],
    [-],
    
    [For T=300K],
    [3.15E-19],
    [1.80E-19],
    [7.79E-18],
    [1.59E-19],
    
    // Row 25-26
    [N₂H₄+H ↔ NH₂+NH₃],
    [1.90E-21 \* (T/300)^0 \* EXP(-1560/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [1.05E-23],
    [0],
    [0],
    [0],
    
    // Row 27-28
    [N₂H₃+H ↔ N₂H₂+H₂],
    [1.70E-18 \* (T/300)^0 \* EXP(-1000/T)],
    [-],
    [1.24E-26 \* T^2.796 \* EXP(2356 / T)],
    [-],
    
    [For T=300K],
    [6.06E-20],
    [0],
    [2.69E-16],
    [0],
    
    // Row 29-30
    [N₂H₃+H ↔ 2NH₂],
    [2.60E-18 \* (T/300)^0 \* EXP(-0/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [2.6E-18],
    [2.7E+18],
    [0],
    [2.01E-17],
    
    // Row 31-32
    [N₂H₃+H ↔ NH+NH₃],
    [1.70E-19 \* (T/300)^0 \* EXP(-0/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [1.7E-19],
    [0],
    [1.66E-19],
    [0],
    
    // Row 33-34
    [N₂H₂+H ↔ N₂H+H₂],
    [1.70E-17 \* (T/300)^0 \* EXP(-500/T)],
    [-],
    [8E-22 \* T^1.76 \* EXP(372.1 / T)],
    [-],
    
    [For T=300K],
    [3.21E-18],
    [0],
    [6.33E-17],
    [5.2E-18],
    
    // Row 35-36
    [N₂H+H ↔ N₂+H₂],
    [6.60E-17 \* (T/300)^0 \* EXP(-1500/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [4.45E-19],
    [0],
    [1.66E-16],
    [1.66E-18],
    
    // Row 37-38
    [NH₃+H ↔ NH₂+H₂],
    [2.10E-17 \* (T/300)^0 \* EXP(-10820/T)],
    [8.4E-20\* (T/300)^(4.1)\* EXP(-4760/T)],
    [4.8E-24\*T^2.23\*EXP((5235)/T)],
    [7.8E-13\*(T/298)^2.4\* \ EXP(-41500/(8.314472\*T))\*1E-6],
    
    [For T=300K],
    [4.56E-33],
    [1.08E-26],
    [6.08E-11],
    [4.71E-26],
    
    // Row 39-40
    [NH₂+H ↔ NH+H₂],
    [3.20E-17 \* (T/300)^0 \* EXP(-0/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [3.2E-17],
    [1.43E-19],
    [1.8E-19],
    [1E-17],
    
    // Row 41-42
    [NH+H ↔ N+H₂],
    [8.30E-16 \* (T/300)^0 \* EXP(-1000/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [2.96E-17],
    [3.12E-17],
    [7.5E-17],
    [1.69E-17],
    
    // Row 43-44
    [N₂H₄+NH ↔ NH₂+N₂H₃],
    [2.90E-17 \* (T/300)^0.5 \* EXP(-1000/T)],
    [-],
    [1.66E-18 \* EXP(1001 / T)],
    [8.65E-14\*(T/298)^3.61\* \EXP(-24300/(8.314472\*T))\*1E-6],
    
    [For T=300K],
    [1.03E-18],
    [0],
    [4.67E-17],
    [5.21E-24],
    
    // Row 45-46
    [N₂H₂+NH ↔ N₂H+NH₂],
    [1.70E-17 \* (T/300)^0 \* EXP(-500/T)],
    [-],
    [3.99E-24 \* T^2 \* EXP(-600 / T)],
    [0],
    
    [For T=300K],
    [3.21E-18],
    [0],
    [4.86E-20],
    [0],
    
    // Row 47-48
    [N₂H+NH ↔ N₂+NH₂],
    [5.80E-18 \* (T/300)^0.5 \* EXP(-1000/T)],
    [-],
    [-],
    [0],
    
    [For T=300K],
    [2.07E-19],
    [0],
    [8.3E-17],
    [0],
    
    // Row 49-50
    [NH+NH ↔ NH₂+N],
    [5.80E-18 \* (T/300)^0.5 \* EXP(-1000/T)],
    [-],
    [-],
    [3.74E-15\*(T/298)^3.88\* \EXP(-1430/(8.314472\*T))\*1E-6],
    
    [For T=300K],
    [2.07E-19],
    [1.7E-18],
    [6.86E-21],
    [2.16E-21],
    
    // Row 51-52
    [NH+NH ↔ N₂H+H],
    [2.30E-17 \* (T/300)^0.5 \* EXP(-500/T)],
    [-],
    [-],
    [0],
    
    [For T=300K],
    [4.34E-18],
    [0],
    [0],
    [0],
    
    // Row 53-54
    [N₂H₄+NH₂ ↔ N₂H₃+NH₃],
    [1.10E-17 \* (T/300)^0.5 \* EXP(-1000/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [3.92E-19],
    [5.2E-19],
    [8.15E-17],
    [5.15E-19],
    
    // Row 55-56
    [N₂H₃+NH₂ ↔ N₂H₂+NH₃],
    [2.90E-18 \* (T/300)^0.5 \* EXP(-0/T)],
    [-],
    [1.01E-30 \* T^3.574 \* EXP(599 / T)],
    [8.6E-13\*(T/298)^0.5\*1E-6],
    
    [For T=300K],
    [2.9E-18],
    [0],
    [5.31E-21],
    [8.63E-19],
    
    // Row 57-58
    [N₂H₂+NH₂ ↔ N₂H+NH₃],
    [1.70E-18 \* (T/300)^0 \* EXP(-2000/T)],
    [-],
    [4.5E-25 \* T^2.226 \* EXP(-518.5 / T)],
    [1.53E-15\*(T/298)^4.05\* \EXP(-6735/(8.314472\*T))\*1E-6],
    
    [For T=300K],
    [2.16E-21],
    [0],
    [2.61E-20],
    [1.06E-22],
    
    // Row 59-60
    [N₂H₂+NH₂ ↔ NH+N₂H₃],
    [2.90E-18 \* (T/300)^0.5 \* EXP(-17000/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [7.12E-43],
    [0],
    [rrr],
    [0],
    
    // Row 61-62
    [N₂H+NH₂ ↔ N₂+NH₃],
    [1.70E-17 \* (T/300)^0 \* EXP(-0/T)],
    [-],
    [1.6E-17 \* EXP(5000 / T)],
    [-],
    
    [For T=300K],
    [1.7E-17],
    [0],
    [2.87E-10],
    [0],
    
    // Row 63-64
    [NH₃ + NH₂ ↔ N₂H₃ + H₂],
    [2.30E-17 \* (T/300)^0.5 \* EXP(-10850/T)],
    [-],
    [1.66E-19 \* T^0.5 \* EXP(10900 / T)],
    [-],
    
    [For T=300K],
    [4.52E-33],
    [0],
    [0.0173],
    [0],
    
    // Row 65-66
    [NH₂ + NH₂ ↔ NH + NH₃],
    [1.00E-17 \* (T/300)^0 \* EXP(-5000/T)],
    [1.8E-20 \* (T/300)^2.79 \* EXP(-660 / T)],
    [9.36E-30 \* T^3.53 \* EXP(278.1 / T)],
    [-],
    
    [For T=300K],
    [5.78E-25],
    [1.99E-21],
    [1.31E-20],
    [< 3.32E-21],
    
    // Row 67-68
    [NH₂ + NH₂ ↔ N₂H₂ + H₂],
    [6.60E-17 \* (T/300)^0 \* EXP(-6000/T)],
    [-],
    [2.82E-22 \* T^1.62 \* EXP(8975 / T)],
    [-],
    
    [For T=300K],
    [1.36E-25],
    [1.30E-18],
    [2.86E-05],
    [1.3E-18],
    
    // Row 69-70
    [NH₂ + NH ↔ N₂H₂ + H],
    [5.20E-17 \* (T/300)^0 \* EXP(-500/T)],
    [2.5E-15 \* (300/T)^0.5],
    [2.16E-16 \* T^-0.272 \* EXP(-38.8 / T)],
    [5.33E-15\*(T/298)^1.88\* \EXP(-36800/(8.314472\*T))\*1E-6],
    
    [For T=300K],
    [9.82E-18],
    [2.5E-15],
    [4.02E-17],
    [2.11E-27],
    
    // Row 71-72
    [N₂H₄ + N₂H₂ ↔ 2N₂H₃],
    [7.20E-17 \* (T/300)^0.5 \* EXP(-15000/T)],
    [-],
    [4.15E-20 \* T^0.5 \* EXP(15000 / T)],
    [-],
    
    [For T=300K],
    [1.39E-38],
    [0],
    [3726.77],
    [0],
    
    // Row 73-74
    [N₂H₃ + N₂H₂ ↔ N₂H₄ + N₂H],
    [1.70E-17 \* (T/300)^0 \* EXP(-5000/T)],
    [-],
    [1.66E-17 \* EXP(5003 / T)],
    [-],
    
    [For T=300K],
    [9.82E-25],
    [0],
    [2.90E-10],
    [0],
    
    // Row 75-76
    [N₂H₂ + N₂H₂ ↔ N₂H + N₂H₃],
    [1.70E-17 \* (T/300)^0 \* EXP(-5000/T)],
    [-],
    [1.66E-17 \* EXP(5003 / T)],
    [-],
    
    [For T=300K],
    [9.82E-25],
    [0],
    [2.90E-10],
    [0],
    
    // Row 77-78
    [N₂H + N₂H ↔ N₂H₂ + N₂],
    [1.70E-17 \* (T/300)^0 \* EXP(-5000/T)],
    [-],
    [1.66E-17 \* EXP(5003 / T)],
    [-],
    
    [For T=300K],
    [9.82E-25],
    [0],
    [2.90E-10],
    [0],
    
    // Row 79-80
    [NH + N ↔ N₂ + H],
    [1.80E-17 \* (T/300)^0.5 \* EXP(-0/T)],
    [-],
    [-],
    [1.95E-11\*(T/298)^0.51\* \EXP(-77.32/(8.314472\*T))\*1E-6],
    
    [For T=300K],
    [1.8E-17],
    [5E-17],
    [4.98E-17],
    [1.90E-17],
    
    // Row 81-82
    [N₂H + N ↔ NH + N₂],
    [5.20E-17 \* (T/300)^0 \* EXP(-1000/T)],
    [-],
    [-],
    [-],
    
    [For T=300K],
    [1.86E-18],
    [0],
    [0],
    [0],
  )
]<table-k-plus>
// TABLE 2: Reverse rate coefficients (k-)
#figure(
  caption: [Reverse rate coefficients for N₂-H₂ chemistry.]
)[
  #set text(size: 7pt)
  

#table(
  columns: (auto, 1.2fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr),
  align: (left, left, left, left, left, left),
  stroke: 0.5pt,
  inset: 3pt,
  
  [*Reaction*], [*Capitelli Formula*], [*Capitelli*], [*PSI.COM*], [*Bang*], [*NIST*],
  
  // Row 1-2
  [N₂H₄+M ↔ 2NH₂+M], 
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [6.9E-42],
  [9.80E-23],
  [5.90E-23],
  
  [For T=300K],
  [-],
  [0],
  [6.9E-42],
  [9.80E-23],
  [5.90E-23],
  
  // Row 3-4
  [N₂H₄+M ↔ N₂H₃+H+M],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [0],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [0],
  [0],
  
  // Row 5-6
  [N₂H₃+M ↔ N₂H₂+H+M],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [0],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [0],
  [0],
  
  // Row 7-8
  [N₂H₃(+M) ↔ NH₂+NH(+M)],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [1.2E+16],
  [0],
  [1.16E-16],
  
  [For T=300K],
  [-],
  [0],
  [1.2E+16],
  [0],
  [1.16E-16],
  
  // Row 9-10
  [N₂H₂(+M) ↔ 2NH(+M)],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [3.5E+18],
  [0],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [3.5E+18],
  [0],
  [0],
  
  // Row 11-12
  [N₂H+M ↔ N₂+H+M],
  [5.50E-34 \* (T/300)^1 \* EXP(-6189/T)],
  [6.04E-55],
  [0],
  [rrr],
  [1.42E-27],
  
  [For T=300K],
  [-],
  [6.04E-55],
  [0],
  [rrr],
  [1.42E-27],
  
  // Row 13-14
  [N₂H+M ↔ NH+N+M],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [0],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [0],
  [0],
  
  // Row 15-16
  [NH₃+M ↔ NH₂+H+M],
  [2.20E-32 \* (T/300)^0 \* EXP(-7056/T)],
  [1.34E-54],
  [5.5E+42],
  [0],
  [3.01E-42],
  
  [For T=300K],
  [-],
  [1.34E-54],
  [5.5E+42],
  [0],
  [3.01E-42],
  
  // Row 17-18
  [NH₃+M ↔ NH+H₂+M],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [7.23E-45],
  [0],
  [-],
  
  [For T=300K],
  [-],
  [0],
  [7.23E-45],
  [0],
  [-],
  
  // Row 19-20
  [NH₂+M ↔ NH+H+M],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [rrr],
  [0],
  
  // Row 21-22
  [NH+M ↔ N+H+M],
  [3.20E-32 \* (T/300)^0.5 \* EXP(-0/T)],
  [3.2E-44],
  [5.0E+44],
  [0],
  [5.02E-44],
  
  [For T=300K],
  [-],
  [3.2E-44],
  [5.0E+44],
  [0],
  [5.02E-44],
  
  // Row 23-24
  [N₂H₄+H ↔ N₂H₃+H₂],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [rrr],
  [0],
  
  // Row 25-26
  [N₂H₄+H ↔ NH₂+NH₃],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [0],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [0],
  [0],
  
  // Row 27-28
  [N₂H₃+H ↔ N₂H₂+H₂],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [rrr],
  [0],
  
  // Row 29-30
  [N₂H₃+H ↔ 2NH₂],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [0],
  [< 1E-19],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [0],
  [< 1E-19],
  
  // Row 31-32
  [N₂H₃+H ↔ NH+NH₃],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [rrr],
  [0],
  
  // Row 33-34
  [N₂H₂+H ↔ N₂H+H₂],
  [1.90E-13 \* (T/300)^0.5 \* EXP(-23184/T)],
  [5.21E-53],
  [0],
  [0],
  [0],
  
  [For T=300K],
  [-],
  [5.21E-53],
  [0],
  [0],
  [0],
  
  // Row 35-36
  [N₂H+H ↔ N₂+H₂],
  [7.10E-10 \* (T/300)^0 \* EXP(-56950/T)],
  [2.56E-98],
  [0],
  [0],
  [0],
  
  [For T=300K],
  [-],
  [2.56E-98],
  [0],
  [0],
  [0],
  
  // Row 37-38
  [NH₃+H ↔ NH₂+H₂],
  [2.10E-11 \* (T/300)^0.5 \* EXP(-9274/T)],
  [7.88E-31],
  [2.16E-26],
  [rrr],
  [3.05E-24],
  
  [For T=300K],
  [-],
  [7.88E-31],
  [2.16E-26],
  [rrr],
  [3.05E-24],
  
  // Row 39-40
  [NH₂+H ↔ NH+H₂],
  [2.20E-11 \* (T/300)^0 \* EXP(-3880/T)],
  [5.32E-23],
  [0],
  [0],
  [2.06E-28],
  
  [For T=300K],
  [-],
  [5.32E-23],
  [0],
  [0],
  [2.06E-28],
  
  // Row 41-42
  [NH+H ↔ N+H₂],
  [3.90E-10 \* (T/300)^0 \* EXP(-15775/T)],
  [5.68E-39],
  [1.5E-34],
  [2.5E-20],
  [4.37E-40],
  
  [For T=300K],
  [-],
  [5.68E-39],
  [1.5E-34],
  [2.5E-20],
  [4.37E-40],
  
  // Row 43-44
  [N₂H₄+NH ↔ NH₂+N₂H₃],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [rrr],
  [0],
  
  // Row 45-46
  [N₂H₂+NH ↔ N₂H+NH₂],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [rrr],
  [0],
  
  // Row 47-48
  [N₂H+NH ↔ N₂+NH₂],
  [8.50E-11 \* (T/300)^0.5 \* EXP(-52920/T)],
  [2.09E-93],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [2.09E-93],
  [0],
  [rrr],
  [0],
  
  // Row 49-50
  [NH+NH ↔ NH₂+N],
  [4.00E-11 \* (T/300)^0.5 \* EXP(-11890/T)],
  [2.45E-34],
  [0],
  [0],
  [2.96E-30],
  
  [For T=300K],
  [-],
  [2.45E-34],
  [0],
  [0],
  [2.96E-30],
  
  // Row 51-52
  [NH+NH ↔ N₂H+H],
  [2.90E-10 \* (T/300)^0.5 \* EXP(-43240/T)],
  [7.35E-79],
  [0],
  [0],
  [0],
  
  [For T=300K],
  [-],
  [7.35E-79],
  [0],
  [0],
  [0],
  
  // Row 53-54
  [N₂H₄+NH₂ ↔ N₂H₃+NH₃],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [0],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [0],
  [0],
  
  // Row 55-56
  [N₂H₃+NH₂ ↔ N₂H₂+NH₃],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [rrr],
  [0],
  
  // Row 57-58
  [N₂H₂+NH₂ ↔ N₂H+NH₃],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [rrr],
  [0],
  
  // Row 59-60
  [N₂H₂+NH₂ ↔ NH+N₂H₃],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [3.32E-17],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [3.32E-17],
  [0],
  
  // Row 61-62
  [N₂H+NH₂ ↔ N₂+NH₃],
  [1.70E-09 \* (T/300)^0 \* EXP(-57960/T)],
  [2.11E-99],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [2.11E-99],
  [0],
  [rrr],
  [0],
  
  // Row 63-64
  [NH₃ + NH₂ ↔ N₂H₃ + H₂],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [rrr],
  [0],
  
  // Row 65-66
  [NH₂ + NH₂ ↔ NH + NH₃],
  [7.40E-11 \* (T/300)^0 \* EXP(-15470/T)],
  [2.98E-39],
  [0],
  [rrr],
  [1.66E-35],
  
  [For T=300K],
  [-],
  [2.98E-39],
  [0],
  [rrr],
  [1.66E-35],
  
  // Row 67-68
  [NH₂ + NH₂ ↔ N₂H₂ + H₂],
  [6.20E-09 \* (T/300)^0 \* EXP(-25910/T)],
  [1.92E-52],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [1.92E-52],
  [0],
  [rrr],
  [0],
  
  // Row 69-70
  [NH₂ + NH ↔ N₂H₂ + H],
  [6.80E-09 \* (T/300)^0 \* EXP(-11995/T)],
  [2.94E-32],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [2.94E-32],
  [0],
  [rrr],
  [0],
  
  // Row 71-72
  [N₂H₄ + N₂H₂ ↔ 2N₂H₃],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [2E-17],
  [rrr],
  [0.0000037],
  
  [For T=300K],
  [-],
  [0],
  [2E-17],
  [rrr],
  [0.0000037],
  
  // Row 73-74
  [N₂H₃ + N₂H₂ ↔ N₂H₄ + N₂H],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [rrr],
  [0],
  
  // Row 75-76
  [N₂H₂ + N₂H₂ ↔ N₂H + N₂H₃],
  [0.00E+00 \* (T/300)^0 \* EXP(-0/T)],
  [0],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [0],
  [0],
  [rrr],
  [0],
  
  // Row 77-78
  [N₂H + N₂H ↔ N₂H₂ + N₂],
  [8.30E-11 \* (T/300)^0 \* EXP(-33260/T)],
  [5.89E-65],
  [0],
  [rrr],
  [0],
  
  [For T=300K],
  [-],
  [5.89E-65],
  [0],
  [rrr],
  [0],
  
  // Row 79-80
  [NH + N ↔ N₂ + H],
  [4.70E-10 \* (T/300)^0.5 \* EXP(-75900/T)],
  [6.25E-126],
  [0],
  [rrr],
  [8.87E-124],
  
  [For T=300K],
  [-],
  [6.25E-126],
  [0],
  [rrr],
  [8.87E-124],
  
  // Row 81-82
  [N₂H + N ↔ NH + N₂],
  [1.20E-10 \* (T/300)^0 \* EXP(-41830/T)],
  [3.34E-71],
  [0],
  [0],
  [0],
  
  [For T=300K],
  [-],
  [3.34E-71],
  [0],
  [0],
  [0],
)
]<table-k-minus>

The rate coefficients selected in @table-k-plus and @table-k-minus were used to update and complete the original chemical scheme, as shown in https://github.com/mr-arpg/LoKI-B/blob/variable-energy-grid/Code/Input/N2H2_CS18a.chem, extending it to use in future atmospheric pressure studies.


=== Mesoscopic Surface Model<mesoscopic-surface-model>

In the study of reactive plasmas, particularly those involving nitrogen-hydrogen mixtures for applications like ammonia synthesis, the interaction between the plasma and the reactor surfaces is of paramount importance. The surface is not merely a passive boundary for particle loss; it is an active chemical environment where crucial reaction pathways occur. The modeling of these interactions has evolved from using simplified macroscopic parameters to employing detailed mesoscopic kinetic models, which provide a more fundamental and predictive understanding of the plasma chemistry @guerra_tejero-del-caz_pintassilgo_alves_2019@gordiets_1998@donkó_2001.

Mesoscopic kinetic models treat the surface as a dynamic system with its own set of species, sites, and elementary reactions. This work is inspired by the mesoscopic model proposed by Gordiets _et al._ @gordiets_1998, according to which the synthesis of ammonia ($N H_3$) predominantly occurs on the surface, which acts as a catalyst. The foundations of this model rely on distinguishing between the following components: *physical surface vacant sites* (F(v)), where gas-phase particles are weakly and movably bound by van der Waals forces, and *chemical surface vacant sites* (S(v)), where particles can form strong, immobilizing chemical bonds; *gas-phase atoms* (N, H) and *radicals* (NH, NH$""_2$) formed in the plasma volume, which act as fundamental building blocks that initiate the surface chemistry, via either *physisorbed surface states* (e.g., N(F)) or *chemisorbed surface states* (e.g., N(S)).

The entire lifecycle of a particle on the surface is described by a set of elementary reactions. The initial step involves *adsorption*, where a gas-phase atom weakly binds to a physical vacant site (e.g., N($""^4$S) + F(v) $arrow$ N(F)), or strongly binds to a chemical vacant site (e.g., N($""^4$S) + S(v) $arrow$ N(S)). A mobile physisorbed atom can also transition to a chemisorbed state (N(F) + S(v) $arrow$ N(S) + F(v)). The reverse process, *thermal desorption*, occurs when adsorbed particles gain enough thermal energy to break their bonds and return to the gas phase (e.g., N(F) $arrow$ N($""^4$S) + F(v)), and is naturally favoured when involving physisorbed species.

Subsequently, a series of surface reactions builds $N H_x$ radicals adsorbed at the walls, with $x=1,2$, through sequential hydrogenation reactions. First, an adsorbed nitrogen atom reacts with a gas-phase hydrogen atom to form an adsorbed NH radical $(H(""^1S)$ + $N(S)$ $arrow$ $N H(S)$), which is then further hydrogenated to form NH$""_2$(S) ($H(""^1S$) + $N H(S)$ $arrow$ $N H_2$(S)). The final step is the formation and desorption of ammonia into the gas phase, via two primary recombination mechanisms. In the *Eley-Rideal (ER) mechanism*, a gas-phase hydrogen atom directly strikes and reacts with a chemisorbed species 
$
H(""^1S) + N H_2(S) $arrow$ $N H_3$(X) + S(v)
$
alternatively, in the *Langmuir-Hinshelwood (LH) mechanism*, a physisorbed species diffuses across the surface to encounter a chemisorbed species and react H(F) + NH$""_2$(S) $arrow$ NH$""_3$ + S(v) + F(v). 

A key strength of the mesoscopic model is its ability to self-consistently determine the macroscopic $gamma$-coefficients instead of treating them as input parameters. As shown in @gordiets_1998, even in the case of the complex $N_2$-$H_2$ surface chemistry, the recombination coefficients $gamma_N$ and $gamma_H$ can be calculated from the frequencies of the elementary surface reactions and the fractional surface coverages of adsorbed species. This bridges the two approaches, allowing for a more robust and physically grounded plasma model where the surface response is a calculated output, not an assumption.

The complete set of surface reactions implemented in the model is shown in https://github.com/mr-arpg/LoKI-B/blob/variable-energy-grid/Code/Input/N2H2_CS18a.chem.


=== Implementation in LoKI-B+C

The chemical kinetics data used in LoKI-B+C is parsed from structured `.chem` files, which serve as primary interface between the chemical model and the simulation solver. The `.chem` files specify all species, volume/surface reactions and rate coefficients, and transport models within a standardized format, following the general syntax (Reference Manual LoKI-B+C, to be published):
#v(.3cm)

`Reactants -> Products | Type | Parameters | Notes/References`

#v(.3cm)

where `Reactants -> Products` represent the chemical reactions (including transport processes), `Type` specifies the type of rate coefficient, `Parameters` are the parameters needed to calculate the rate coefficient, and `Notes/References` are complementary information.

A state-specific notation is employed, detailing electronic species, e.g. $N_2(A^3 Sigma_u^+)$, $H(1S)$, $N(2D)$; vibrational species, e.g. $N_2(X, v=0...44)$, $H_2(X, w=0...14)$; and also ions, e.g. $H_3^+(X)$, $H^-("gnd")$ (see @state-of-the-art). 

The field `Type` encompasses temperature-independent rate coefficient `constantRateCoeff` and temperature-dependent rate coefficient expressions, such as `arrheniusGasTemp` ($a exp(b/T_g)$), `modifiedArrheniusGasTemp` ($a T_g^b exp(c/T_g)$), `powerGasTemp` ($a T_g^b$), and `powerElectronTemp` ($a T_e^b$). The parameters `a`, `b`, `c` are specified in the `Parameters` field.

Transport and wall `Type` include `QGMTransport` for the charged-particle transport adopted by QUANTEMOL global-model @stoffels_stoffels_vender_haverlag_kroesen_1995, `multicomponentDiffusion` for multi-component diffusion using Lennard-Jones parameters, and `wallReaction` for wall recombination reactions with specified probabilities. Mesoscopic surface model `Type` encompass `thermalEffusionSurface` for physical and chemical adsorption rate coefficients, `thermalDesorption` for desorption processes, and *`surfaceTransport`* for surface diffusion. More details can be found in the LoKI user manual @loki_manual.

Illustrative snippets from the latest Chemical Scheme (CS) implemented in LoKI-B+C (`N2H2_CS18a.chem`) are shown below:

#figure(
  kind: "algorithm",
  supplement: "Chemical Scheme",
  caption: [Example reactions from `N2H2_CS18a.chem` kinetic scheme.]
)[
  ```
  1: % Header (metadata and changelog)
  2: % - updates cross-section files (e.g., NH3_LXCat_extra.txt)
  3: % - fixes stoichiometry/rates and adds missing reactions
  4: 
  5: % electron-impact (electronic excitation via EEDF)
  6: e + N2(X,v=0) <-> e + N2(A3Su+) | eedf | |

  7: % Direct literature value (constant rate coefficient)
  2: N2(A3Su+) + NH3(X) -> N2(X,v=0) + H(1S) + NH2(X) | constantRateCoeff | 8.5E-17 |
  3: % Comment: modified according to Capitelli; original 1.6E-16
  7: 
  8: % neutral–neutral (Arrhenius in Tg)
  9: H(1S) + NH(X) -> N(4S) + H2(X,v=0) | arrheniusGasTemp | 5.4E-17, -165 |
  10: 
  11: % ion transport at the wall
  12: H3(+,X) + wall -> H2(X,v=0) + H(1S) | QGMTransport | 1, false, diffusion |
  13: 
  14: % mesoscopic surface (Gordiets 1998 inspired)
  15: N(4S) + wall_F(v) -> wall_N(F) | thermalEffusionSurface | 1, 0, gasTemperature |
  ```
]

The `Type` of some rate coefficients use `eedf`. This refers to electron-impact rate coefficients, which are calculated by integrating cross sections over the EEDF.

In LoKI-B+C framework, cross sections are provided in standardized LXCat @lxcat format files, which contain energy-dependent cross-section data for various collision processes. The cross section files include comprehensive coverage of collision processes, encompassing elastic momentum-transfer, vibrational excitation, electronic excitation, ionization and dissociative attachment. @table-cs-1 and @table-cs-2 show snippets of cross section data used in this work for $N H_3$ and $H_2$, respectively.


#figure(
  kind: "algorithm",
  supplement: "Cross-section",
  caption: [NH₃ electronic excitation cross-section snippet taken from LXCat]
)[
  ```
  1: EXCITATION
  2: E + NH3 -> E + NH3(E1)
  3: 5.300000e+0
  4: SPECIES: e / NH3
  5: PROCESS: E + NH3 -> E + NH3(E1)(5.30eV), Excitation
  6: PARAM.:  E = 5.30 eV
  7: COMMENT: [E + NH3(X) -> E + NH3(E1), Excitation] Ramses Snoeckx et al 2023
  8: COLUMNS: Energy (eV) | Cross section (m2)
  9: -----------------------------
  10: 5.3     0.0
  11: 5.31    4.38E-23
  12: 5.32    8.84E-23
  13: 5.5     7.639E-22
  14: 6.0     2.787E-21
  15: 7.0     4.8269E-21
  16: 8.0     5.878E-21
  17: 10.0    3.7986E-21
  18: 15.0    1.8003E-21
  19: 20.0    1.4845E-21
  20: -----------------------------
  ```
]<table-cs-1>

#figure(
  kind: "algorithm",
  supplement: "Cross-section",
  caption: [H₂ vibrational excitation cross-section snippet taken from LXCat]
)[
  ```
  1: EXCITATION
  2: Hydrogen -> Hydrogen (H2(X,v=0) -> H2(X,v=1))
  3: 0.516000e+0
  4: SPECIES: e / Hydrogen
  5: PROCESS: E + Hydrogen -> E + Hydrogen (H2(X,v=0) -> H2(X,v=1)), Excitation
  6: PARAM.:  E = 0.516 eV
  7: COMMENT: [e + H2(X,v=0) -> e + H2(X,v=1), Excitation]
  8: COLUMNS: Energy (eV) | Cross section (m2)
  9: -----------------------------
  10: 0.516   0.0
  11: 0.52    1.2E-20
  12: 0.6     2.8E-20
  13: 0.8     3.1E-20
  14: 1.0     2.9E-20
  15: 2.0     1.8E-20
  16: 5.0     6.5E-21
  17: 10.0    2.1E-21
  18: -----------------------------
  ```
]<table-cs-2>


The cross-section data used in this work originates from multiple validated sources. The primary database utilized is the IST-Lisbon database on LXCat @alves_2014, which provides complete, validated sets of cross sections for $H_2$, $N_2$, and $N H_3$ (in some cases to be published). To validate cross-section datasets, *electron swarm parameters* obtained from EBE solution are commonly employed as benchmarks. Electron swarm parameters are constituted by macroscopic transport parameters of electrons in gases under applied electric fields, including *characteristic energy*, *reduced mobility* and *drift velocity*, as well as electron rate coefficients, including *Townsend ionization and attachment coefficients*. These parameters can be directly measured in controlled swarm experiments and compared against simulations from Boltzmann solvers. For the IST-Lisbon database, predictions typically agree with experimental measurements within less than 20% for reduced electric fields $E/N approx 10^(-4) - 500$ Td @alves_2014. The validation plots shown below compare calculated swarm parameters (lines) against experimental data points for $H_2$ and $N H_3$ @Baghel2025GEC.

#subfigure-grid(
  figure(
    move(dx:-.6cm,
    image("../Images/characteristic_energy_h2.png", width: 110%)),
    caption: []
  ),


  figure(
    image("../Images/dissociation_coefficient_h2.png", width: 110%),
    caption: []
  ),

  figure(
    move(dx:-.6cm,
    image("../Images/drift_velocities_nh3.png", width: 110%)),
    caption: []
  ),

  figure(
    image("../Images/emission_coefficient_h2.png", width: 110%),
    caption: []
  ),

  figure(
    move(dx:-.6cm,
    image("../Images/ionization_coefficient_h2.png", width: 110%)),
    caption: []
  ),

  figure(
    image("../Images/reduced_mobility_h2.png", width: 110%),
    caption: []
  ),

  figure(
    move(dx:-.6cm,
    image("../Images/townsend_attachment_nh3.png", width: 110%)),
    caption: []
  ),

  figure(
    image("../Images/townsend_ionization_nh3.png", width: 110%),
    caption: []
  ),

  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 6.5cm,
  caption: [Validation of swarm parameters for $H_2$ and $N H_3$. Characteristic energy (a), dissociation coefficient (b), drift velocity (c), emission coefficient (d), ionization coefficient (e), reduced mobility (f), Townsend attachment (g) and Townsend ionization (h) vs reduced electric field $E/N$]
)


== Validation of the Chemical Model

The validation of the chemical kinetic model developed in this thesis is performed by comparing key model outputs against published experimental data. The primary observables selected for this validation are the densities of relevant chemical species and the reduced electric field ($E\/N$), which correspond to experimentally measured plasma properties.

The goal of this comparison is not necessarily to achieve perfect quantitative agreement, but rather to confirm that the model correctly reproduces the observed experimental trends, within reasonable uncertainties. Quantitative results will be given attention whenever possible. Agreement on how species densities and $E\/N$ evolve with varying external conditions, such as gas pressure, discharge current, and initial $H_2$ concentration in the gas mixture, will give confidence that the model is able to capture the dominant chemical kinetic pathways. Model validation was conducted through simulations using the LoKI framework, and comparison against the following experimental data:

- *Reduced Electric Field ($E\/N$):* data from Cernogora _et al._ @cernogora and Brovikova & Galiaskarov @brovikova in pure $N_2$ discharges, as well as measurements from this work in $N_2-H_2$ discharges are used to validate the electron kinetics and power coupling mechanisms [@plasmas-diagnostics]@psi2022project.
- *Species Densities ($[N H_3]$, $[N]$, $[H]$):* data from Amorim _et al._ @amorim_1996 and the present workin $N_2-H_2$ discharges.

A critical aspect of this validation is a thorough analysis of the conditions and methods employed to obtain the experimental data. Factors such as the precision of measurements, and the values of gas temperature and gas flow rates are often not clearly specified or controlled in the experiments. For example, as discussed in Chapter 2, variations in the gas temperature directly impact the gas number density ($N$), thus affecting all kinetic rates. These issues introduce inherent uncertainties and must be carefully considered when comparing simulation results with experimental measurements.

==== Analysis of Experimental Conditions and Methodologies
The experimental works of Cernogora _et al._ @cernogora, Brovikova & Galiaskarov @brovikova and Amorim _et al._ @amorim_1996 all employed DC glow discharges in cylindrical tubes operated with a continuous gas flow. However, the specific operational parameters and diagnostic techniques adopted by these authors varied significantly, as shown in @table_authors and discussed below. For the experimental methodology that each author used, please refer to @plasmas-diagnostics.

#figure(
  caption: [Summary of operational parameters],
)[
  #table(
    columns: 5,
    align: (left, center, center, center, center),
    [*Study*], [*Gases*], [*Geometry*], [*Pressure*], [*Current*],
    [Amorim _et al._ (1994 and 1996) @amorim_1994@amorim_1996], [$N_2-H_2$], [Pyrex tube, 1.6 cm], [0.5–5.0 Torr], [1–50 mA],
    [Brovikova & Galiaskarov (2001) @brovikova], [Pure $N_2$], [S-52 glass tube, 1.5 cm], [0.45–4.0 Torr], [10–80 mA],
    [Cernogora _et al._ (1981) @cernogora], [Pure $N_2$], [Pyrex tube, 2.0 cm], [0.1–2.0 Torr], [0–80 mA],
  )
]<table_authors>


*1. Amorim _et al._ (1994 and 1996): Absolute Densities of $[N H_3]$ and $[H]$ in $N_2-H_2$*

- *Measurement Technique:* This study used a combination of Photofragment Translational Spectroscopy (PFTS) and Laser-Induced Fluorescence (LIF) to measure species densities. A 205 nm laser photodissociated the $N H_3$ molecules synthesized in the plasma, and the resulting "hot" H-atom fragments were detected via LIF on the H-alpha line (656 nm) during the same laser pulse. The density of "cold" H atoms produced by the discharge was measured simultaneously from the narrow core of the LIF spectral profile.
- *Absolute Calibration:* The H-atom LIF signal was calibrated using Vacuum Ultraviolet (VUV) absorption spectroscopy on the Lyman-$alpha$ line (121 nm) in a pure $H_2$ discharge.
- *Key Results:* A maximum $N H_3$ density of approximately $8 times 10^12 " cm"^(-3)$ was measured in a 75% $H_2$ – 25% $N_2$ mixture at 2 Torr and 50 mA. The H-atom dissociation energy from $N H_3$ was determined to be $(4.34 plus.minus 0.07)$ eV.

*2. Brovikova & Galiaskarov (2001): $E\/N_0$ and $[N]$ in Pure $N_2$*

- *Measurement Technique:* The ground-state N-atom concentration, $[N(""^4 S)]$, was measured using Electron Paramagnetic Resonance (EPR). The longitudinal electric field ($E$) was measured using a two-probe current compensation method.
- *Key Results:* The reduced electric field, $E\/N_0$, was measured in the range of $5.27$ to $11.82 times 10^(-16) " V cm"^2$ across pressures of 60–533 Pa and currents of 10–80 mA.
- *Temperature and Flow:* This work is particularly valuable as it provides systematic measurements of both the axial gas temperature ($T_0$) and wall temperature ($T_("wall")$). $T_0$ varied significantly from 331.5 K to 680.6 K, highlighting the importance of thermal effects. Gas flow rates were also detailed, ranging from 0.082 to 2.788 $"cm"^3 \/ "s"$, and were used in their kinetic analysis to determine species lifetimes and dissociation rates. The reported experimental flow values are probably too low to be reliable, and therefore were taken cautiously in the simulations.

*3. Cernogora _et al._ (1981): $E$ and $[N_2(A)]$ in Pure $N_2$*

- *Measurement Technique:* The axial electric field ($E$) was measured from the floating potential difference between two electrostatic probes. The technique utilized to determine the concentration of the metastable nitrogen molecule $N_2(A^3 Sigma_u^+)$ was optical absorption of the first positive system bands. Specifically, the concentration of the $v=0$ level of the $N_2(A)$ metastable state was measured using the optical absorption of the (1-0) band of the nitrogen first positive system. Electron density was measured with a microwave cavity technique.
- *Key Results:* The study reported that $E\/p$ decreases as the discharge current increases, a behavior attributed to gas heating. A very approximative kinetic model, lacking key mechanisms to describe pure-nitrogen discharges, showed good agreement with experimental $E\/p$ at low currents where gas heating was negligible ($T_g approx 300$ K). The results for the electron and the metastable densities presented in Cernogora _et al._ (1981) were corrected in Cernogora _et al._ (1984), which recommended multiplying $n_e$ by a factor of 6x and $[N_2(A)]$ by a factor of approximately 4x.
- *Temperature and Flow:* Gas temperature was deduced from the rotational distribution of the $N_2$ second positive system and was found to reach up to 600 K at higher currents. The metastable concentration $[N_2(A)]$ is calculated using a coefficient $K(T_E, T_A)$, which is a function of the light source temperature ($T_E$) and the temperature of the absorbing discharge medium ($T_A$). These temperatures ($T_E approx 500$ K; $T_A$ ranging from 300 to 500 K) are deduced from the rotational distribution of the $N_2$ second positive system bands. Any uncertainty in these temperature measurements propagates to the calculated concentration. Furthermore, the kinetic model developed to explain the measured $N_2(A)$ concentration showed limitations, particularly at high discharge currents (above a few tens of milliamperes), where the measured concentration slowly decreased but the simple model could not explain this behavior.

All three studies confirm, either directly or indirectly, that gas heating has a dominant effect. Brovikova & Galiaskarov provide the most comprehensive data, showing a temperature increase of over 300 K with current and pressure. Cernogora _et al._ note that gas heating (up to 600 K) must be included to explain the behavior of $E\/p$ at high currents. Amorim _et al._ measured H-atom temperatures between 500 and 1200 K, significantly higher than the molecular gas temperature, and demonstrated that accounting for this thermal non-equilibrium is essential for accurate VUV absorption calibration. Since the gas number density $N$ is inversely proportional to $T_("gas")$, any model validation for $E\/N$ including temperature-dependent reaction rate coefficients must carefully account for the gas temperature. The reported precision of the measurements varies. Brovikova & Galiaskarov state a measurement error not exceeding 40% for absolute N-atom concentration. Amorim _et al._ estimate an uncertainty of likely more than $plus.minus 20%$ for their $[N H_3]$ density value, due to the multi-step calibration process. For Cernogora _et al._, uncertainties in the temperature measurements directly propagate to the calculated $N_2(A)$ density, and the kinetic model limitations at high currents indicate additional measurement challenges. Cernogora _et al._ do not provide explicit error bars for their $E$-field measurements. This range of uncertainty sets a realistic expectation for the level of quantitative agreement between the results of our model and the experimental data. Moreover, the experiments were all performed in flow systems, but at different rates. In one work (Brovikova & Galiaskarov) the very-low flow value is probably uncertain, whereas another work (Amorim _et al._) mentions a "permanent gas flow" but does not quantify it for the $N H_3$ measurements. The different flow rates imply different residence times for species in the plasma, which can significantly alter the plasma chemistry, a key difference in experimental conditions that must be considered when analyzing model results.

=== Results and Discussion

The validation of the chemical kinetic model is presented through systematic comparison of simulation results with experimental measurements. The analysis is organized into three main sections: the discharge characteristics, the concentrations of nitrogen and hydrogen atoms, and the density of ammonia.

==== Discharge Characteristics

The model's ability to predict fundamental electrical properties of the discharge is assessed by comparing simulations against measurements from Cernogora _et al._ @cernogora and Brovikova & Galiaskarov @brovikova  for pure $N_2$ discharges at $p = 133", "266$ Pa (see figures @EvsI and @ENvsNR), Amorim _et al._ @amorim_1996 for pure $H_2$ discharges (see figure @ENvsNR_H2), and this work for $N_2$-$H_2$ discharges at various hydrogen input percentages (see figure @ENvsNR_H2_LPP).

#figure(
  image("../Images/sims/Cernogora_Brovikova_E_vs_I_data.png", width: 85%),
  caption: [Axial electric field ($E$) as a function of discharge current ($I$) in pure nitrogen plasma at two pressures: 133 Pa (purple) and 266 Pa (orange). Points and crosses represent experimental measurements from Cernogora _et al._ @cernogora and Brovikova & Galiaskarov @brovikova, respectively, while solid and dashed lines show simulation results using Cernogora _et al._ and Brovikova & Galiaskarov working conditions, respectively.]
)<EvsI>

In Cernogora's simulations of figure @EvsI, it was assumed a linear scaling of the flow between 6-360 sccm for pressure varations between 0.5 and 2 Torr, as mentioned in @cernogora. Brovikova's simulations were carried out in the absence of flow considering the very low values (<< 1 sccm) reported in @brovikova.

The axial electric field as a function of discharge current shows the expected behavior for glow discharges, decreasing as the current increases for all datasets. This trend reflects the increase in plasma conductivity with higher ionization levels, leading to lower electric field required to sustain the plasma. The electric field is consistently higher at 266 Pa compared to 133 Pa, at constant discharge current,as expected from the increased electron-neutral collision frequency at higher gas densities. The simulations successfully reproduce the general trends observed in both experimental datasets, despite noticeable differences between the Cernogora and Brovikova measurements themselves, which highlight inherent experimental uncertainties or inaccuracies. Note however some quantitative disagreement between the simulations and the measurements of Cernogora at higher pressures and discharge currents.

#subfigure-grid(  
  figure(
    image("../Images/sims/exp_pure_N2_current=40_field.png", width: 95%),
    caption: []
  ), <ENvsNR>,
  figure(
    image("../Images/sims/exp_pure_N2_current=40_red_field.png", width: 95%),
    caption: []
  ), <ENvsNR_red_field>,
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  caption: [Electric field $E$ (left) and reduced electric field $E\/N$ (right), as a functions of $N R$ (gas density times tube radius) for a fixed current of 40 mA in pure nitrogen. The blue and orange lines (simulations) and points (measurements) are for Cernogora _et al._ @cernogora and Brovikova & Galiaskarov @brovikova, respectively.]
)

@ENvsNR shows simulations and measurements of the electric field $E$ as a function of the product $N R$, at a fixed current of 40 mA in pure nitrogen, for the working conditions of Cernogora _et al._ @cernogora and Brovikova & Galiaskarov @brovikova. This figure is a different representation of data already presented in @EvsI, confirming the disagreement observed before between the experimental data, but now showing a better agreement between simulations and measurements for Cernogora. This difference is essentially due to the different representation of data between figures @EvsI and @ENvsNR, the latter presenting the results as a function of $N R$, which involves the gas temperature.

The influence of $T_g$ in the results is confirmed in @ENvsNR_red_field, which presents the reduced electric field $E\/N$ as a function of the product $N R$, corresponding to typical discharge characteristics. This representation, as expected, yields similarity relationships for each simulation and measurement datasets, highlighting some disagreement between them at higher pressures. @ENvsNR_red_field shows the typical evolution of the $E\/N" vs. "N R$, confirming the need for lower maintenance fields with the decrease in the plasma losses, due to the increase in the discharge volume and/or the gas pressure. 

#figure(
  image("../Images/sims/Gordiets_FIG3_I.png", width: 65%),
  caption: [Reduced electric field ($E\/N$) as a function of $N R$, for a fixed current of 20 mA in pure hydrogen plasma. The points correspond to experimental measurements from Amorim _et al._ @amorim_1996 and the line is from simulation results.]
)<ENvsNR_H2>

@ENvsNR_H2 shows the discharge characteristic $E\/N" vs "N R$ for pure hydrogen plasmas, for the working conditions of Amorim _et al._ @amorim_1996. The simulation results show excellent quantitative agreement with experimental measurements across the entire range of $N R$ values. This validation in both pure $N_2$ and pure $H_2$ conditions provides confidence about the model's ability to describe the mixed $N_2$-$H_2$ system. 

@ENvsNR_H2_LPP shows $E\/N$ vs $H_2$% for two pressure conditions, 266 Pa and 665 Pa, and two different datasets (a)-(b) from LPP obtained in this work. The bands (shaded areas) account for simulations using the working conditions of these datasets, which differ only in the gas temperature, thus revealing its influence on the simulation results. Likewise, the experimental error bars incorporate temperature uncertainties, estimated at $plus.minus$50 K as discussed in @cap3.


#figure(
  image("../Images/sims/LPP-#2_Q_10_field_H2_band_E_N.png", width: 70%),
  caption: [Reduced electric field ($E\/N$) as a function of hydrogen input percentage ($H_2$%), at fixed current of 30 mA, for two pressure conditions: 266 Pa (blue) and 665 Pa (orange). The points represent two different experimental datasets (a)-(b) from LPP, obtained in this work. Shaded bands represent simulation results obtained using the working conditions of these datasets.]
)<ENvsNR_H2_LPP>

This type of representation shows a non-monotonic dependence of $E\/N$ with $H_2$%, which is associated with an evolution of the ionic composition and kinetic features of the plasma, affecting both the charge density and the EEDF. As expected, the most relevant ions are $N_4^(+)$ and $N_2^(+)$ at low $H_2$ percentages @ions_composition and $H_3^(+)$ in hydrogen dominated plasmas @marques_jolly_alves_2007. In between regions, the dominant ion becomes $N_2 H^(+)$, produced by the following three competetive mechanisms:

$
N_2^+(X) + H_2(X,v=0) arrow H(""^1S) + N_2 H^+(X)
$
$  
H_2^+(X) + N_2(X,v=0) arrow N_2 H^+(X) + H(""^1S)
$
$
H_3^+(X) + N_2(X,v=0) arrow N_2 H^+(X) + H_2(X,v=0)
$

The simulation results show reasonable qualitative agreement with experimental measurements, yet exhibiting a general overestimation with respect to the measured $E\/N$ values. The reduced electric field is larger for the lower pressure, as expected from glow discharge maintenance characteristics. Model results at 100% $H_2$ should be taken with some caution. As discussed in Chapter 3, the gas temperature determination method relies on fitting the peak of $N_2$ rotational temperature measurements. In pure hydrogen plasmas, where nitrogen should be absent, this temperature diagnostic method becomes unreliable, leading to potentially inaccurate temperature estimates. Here, the temperature values for this condition were obtained through visual regression.

==== Atomic Species Concentrations in $N_2$-$H_2$ Mixtures

This section analyses the model's ability to predict the densities of atomic nitrogen and hydrogen as a function of the input percentage of hydrogen in the gas mixture.

#figure(
  image("../Images/sims/Gordiets_FIG2_II.png", width: 75%),
  caption: [Relative concentration of atomic nitrogen ([N], in arbitrary units a.u.) as a function of $H_2$ input percentage in the gas mixture, for the fixed current of 50 mA. The experimental measurements (points) and the simulation results (line) are for Amorim _et al._ @amorim_1996. The simulations are normalized to the relative measurements at 0.25% $H_2$, as indicated in the figure.]
)<NvsH2>


@NvsH2 shows the relative concentration of atomic nitrogen (in a.u.) as a function of the input percentage of hydrogen in the gas mixture. The figure shows a remarkable enhancement of the atomic nitrogen concentration when small amounts (1-2%) of hydrogen are added to the nitrogen plasma. 

The very good agreement between the simulations and the measurements, particularly for low $H_2$ concentrations, is mainly due to the combined effect of two mechanisms. First, the transport of neutral species across very different mixture compositions. The present work adopts a multi-component diffusion model @gordiets_1998@chantry_1987, where the elementary diffusion coefficients are calculated using the Lennard-Jones parameters. Second, the quenching of $N_2(A)$ by $H$ atoms, which in this work proceds according to:
$
  N_2(A) + H(""^1"S") -> N_2(X, v) + H(""^1"S")
$ 
with the rate coefficient and the vibrational distribution function for $N_2(X, v)$ taken from Borges _et al._ @borges@borges_galvão_mota_varandas_2019.

When these mechanisms are taken into account, the model is able to capture the evolution trend of $[N]" vs "H_2(%)$, correctly predicting the sharp initial rise, the peak location, and its subsequent gradual decreases. 

#figure(
  image("../Images/sims/Gordiets_FIG4_II.png", width: 75%),
  caption: [Relative concentration of atomic hydrogen ([H], in a.u.) as a function of $H_2$ input percentage in the gas mixture, for the fixed current of 50 mA. The experimental measurements (points) and the simulation results (line) are for Amorim _et al._ @amorim_1996 (blue), Bockel et al. @bockel1996 \(orange) and (green). The simulations are normalized to the relative measurements at 30% $H_2$, as indicated in the figure.]
)<HvsH2>

@HvsH2 presents the relative concentration of atomic hydrogen (in a.u.) as a function of the input percentage of hydrogen in the gas mixture. As expected, the concentration of atomic hydrogen increases steadily as more $H_2$ is added to the feedstock gas mixture, with an exceptional rise at very-low and very-high $H_2$ concentrations. The simulation results show excellent agreement with all three experimental datasets across the entire range of gas compositions. Note that Amorim _et al._ @amorim_1996 reports absolute values for the concentration of atomic hydrogen, which were normalized for the purpose of the graphical representation in @HvsH2. The results in this figure reveal that these absolute values are overestimated by about one order of magnitude with respect to simulations.

Because nitrogen and hydrogen atoms are key species for ammonia synthesis, the model's ability to predict their concentrations in the gas phase is a fundamental validation of the core chemical kinetics scheme. @NvsH2 and @HvsH2 give a clear demonstration of this validation.

==== Ammonia ($N H_3$) Synthesis

To conclude the model validation, it is essential to assess its ability in predicting the density of ammonia, as result of complex gas-phase and surface reaction pathways.

#figure(
  image("../Images/sims/Gordiets_FIG6_II.png", width: 75%),
  caption: [Absolute concentration of ammonia ([NH$""_3$]) as a function of $H_2$ input percentage in the gas mixture, for a fixed current of 50 mA. The experimental measurements (points) and the simulation results (lines) are for Amorim _et al._ @amorim_1996 data. The orange line represents simulation results scaled by a factor of 3x for comparison purposes.]
)<NH3vsH2>

@NH3vsH2 represents the ammonia concentration as a function of hydrogen input percentage in the gas mixture. Experimental measurements show that $N H_3$ production is maximum for hydrogen input percentages around 70-80%. The simulations correctly predict the existence of a density peak, although shifted to lower hydrogen percentages, around 20-30%. Moreover, the model underestimates the absolute ammonia concentrations by approximately a factor of 3. Numerical tests suggest that this discrepancy might be mainly due to inaccuracies in the rate coefficients for surface mechanisms, for example, in the desorption frequencies of Eley-Rideal and Langmuir-Hinshelwood recombinations, or the activation energies of several surface reactions.

However, a critical finding in the analysis of model results, relates to the experimental flow conditions that influence the residence time of plasma species. For 200 sccm gas flow and a discharge volume of $3 times 10^(-5) " m"^(3)$ (see @table_authors), the residence times are estimated to be ~ 10 ms, whereas the simulation results shown in @NH3vsH2 were obtained for steady-state conditions (in the order of seconds). This discussion is particularly relevant to correctly estimate the concentration of $N H_3$ by the model, since the flow contributes to at least 10-50% for the destruction of this species (see @canais).

#figure(
  image("../Images/sims/canais.png", width: 100%),
  caption: [Fractional contribution (in percentage) of different channels for the production (positive values) and destruction (negative) of $N H_3$ in the plasma, as a function of the $H_2$ input percentage in the gas mixture. The simulation results were obtained for the same conditions as @NH3vsH2.]
)<canais>

Therefore, changing the simulation time to describe different residence times, has a direct effect in the concentration of $N H_3$, as shown in @NH3vsH2_time_steps. A shorter residence time of 5 ms overpredicts the concentration, while longer times of 40 ms significantly underpredict it. An intermediate residence time of 10 ms provides the "best fit" to experimental data. This strong sensitivity suggests that the discrepancies observed in absolute ammonia concentrations can be explained by the gas flow conditions, which affect the chemical formation and destruction pathways. In fact, the simulation band presented in @NH3vsH2_time_steps for residence times of 5-40 ms matches the workspace of experimental data.

#figure(
  image("../Images/sims/Gordiets_FIG6_II_amorim_time_steps_[0.005, 0.04].png", width: 75%),
  caption: [Influence of residence times in the absolute concentration of ammonia ([$N H_3$]) as a function of $H_2$ input percentage in the gas mixture, for a fixed current of 50 mA. The experimental measurements (points) and the simulation results (band) are for Amorim _et al._ @amorim_1996 data. The band was obtained considering simulation times between 5 ms (top values) and 40 ms (bottom).]
)<NH3vsH2_time_steps>

To confirm the influence of the gas flow conditions in the results and the validity of the chemical model adopted, @NH3vsH2_longTube shows the relative concentration of ammonia as a function of $H_2$%, obtained for a low gas flow of 7.4 sccm, at 199.5 Pa and 266 Pa, adopting in the simulations the same surface kinetics as before. The experimental measurements are for two different datasets (a)-(b) obtained in this work, and the simulations use the working conditions of these datasets. The simulation results yield absolute concentrations of ammonia of $approx 10^(20)" m"^(-3)$, and were normalized to the experimental measurements at 70% $H_2$. The bands span the workspace of simulation results obtained using the (a)-(b) working conditions.

Observing @NH3vsH2_longTube, one notes a smaller dispersion of results for the lower pressure, in which case the measurements are almost within the simulation bands. Moreover, the (a) and (b) datasets exhibit opposite effects on the variation of ammonia concentration with pressure, with (b) yielding a higher $[N H_3]$ at lower pressure. Note finally that the model is able to predict a maximum of $[N H_3]$ shifted towards higher $H_2$%, consistent with measurements, without the need for any modification in the chemical model adopted.


#figure(
  image("../Images/sims/LPP-2_NH3_H2_band_Long_tube.png", width: 75%),
  caption: [Relative concentration of ammonia [$N H_3$] as a function of $H_2$ input percentage in the gas mixture, at a fixed current of 40 mA, for two pressure conditions: 199.5 Pa (purple) and 665 Pa (orange). The points represent two different experimental datasets; previous LPP measurements, squares (a), and measurements obtained from this work, circles (b). The shaded bands are limited by simulation results obtained using the working conditions of these datasets: solid lines (a) and dashed lines (b). Simulations are normalized to the experimental measurements at 70% $H_2$.]
)<NH3vsH2_longTube>


#v(.5cm)

In summary, the model successfully predicts within a reasonable range evolution trends of fundamental plasma parameters as a function of discharge current, pressure and hydrogen input percentage. These parameters include the electric field and reduced electric field, the concentrations of hydrogen and nitrogen ground-state atoms, and the concentration of ammonia. 

As mentioned in @mesoscopic-surface-model, the present work proposes the synthesis of $N H_3$ via plasma-surface interactions described here by mesoscopic surface model. The different steps involved in the synthesis start by the adsorption of gas-phase atoms by physical and chemical vacant sites (at percentages of \~ 99.9% and \~ 10%, respectively), continues with a series of surface reactions to build $N H_x$ radicals ($x=1,2$) adsorbed on the surface, and concludes with the formation and desorption of ammonia into the gas phase, via LH and ER recombination mechanisms (at \~ 70% and \~ 10%, respectively), in addition to ion-wall recombination (at \~ 20%).

Despite the reasonable agreement between simulation results and experimental measurements, further refinement is needed in the chemical scheme, namely in the rate coefficients of surface mechanisms. The modelling study presented here highlighted the relevance of the gas flow conditions in the simulation results. In addition, one should mention the importance of adequately describe transport processes for both charged and neutral species. The latter aspect was not addressed in this work, but was part of the studies carried out within the PSI.COM project.
