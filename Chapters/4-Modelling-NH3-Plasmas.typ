#import "@preview/thesist:1.0.2": flex-caption, subfigure-grid
#show figure: set block(breakable: true)

= Modelling of $N_2-H_2$ Plasmas <modelling-nh3-plasmas>


While experimental diagnostics provide invaluable macroscopic data on species concentrations and electrical parameters, a microscopic description is required to deepen the understanding of $N_2-H_2$ plasmas across the vast range of working conditions. This is the domain of plasma modeling, a powerful method that simulates the complex interplay of hundreds of chemical reactions occurring over disparate timescales.

As introduced in the @state-of-the-art review, a plasma chemical model can be described by a large system of coupled differential equations to calculate the particle densities of every species in the plasma. The predictive power of such a model is not determined by the sophistication of the numerical solver, but by the quality of the physical and chemical data it is fed. At the heart of these data lies the chemical scheme: a comprehensive collection of all relevant reactions and their corresponding rate coefficients. The model's accuracy is directly and exquisitely sensitive to the values of the rate coefficients. An error or uncertainty in the rate coefficient for a single reaction can cascade through the entire simulation, leading to modelling predictions that deviate considerably from experimental measurements. For a complex network like the $N_2-H_2$ system, where the target molecule ($N H_3$) is the result of a long and competing chain of volume and surface reactions, the challenge is amplified. The final predicted $N H_3$ concentration is a product of dozens of preceding steps, and its accuracy is only as strong as the weakest link in that kinetic chain.

Therefore, compiling a chemical kinetic database is not a simple act of data collection. It is a critical research step involving an extensive and systematic review of published literature to identify not only the relevant reactions but also the various, often conflicting, rate coefficients proposed for them.

For several crucial reactions, a comparison of different literature sources shows rate coefficients that can differ by a factor of ten or more at similar electron temperatures or gas temperatures. This is not a minor numerical discrepancy; it represents a fundamental disagreement on the importance of a given reaction pathway.

This discovery shaped the entire modeling strategy of the project team, this thesis in particular. It became clear that simply selecting one kinetic set from a single publication would be arbitrary and scientifically unsound. It was necessary to treat the choice of the chemical scheme as a variable to be investigated. To this end, a comprehensive database was created, cataloging multiple proposed rate coefficients for each key reaction, each based on the data from a different literature source or a combination thereof.

== Chemical Model Development

The development of the chemical model was based essentially on the chemical scheme of Redondo _et al._ \@redondo complemented with the mesoscopic surface model of Gordiets _et al._ \@gordiets. In this work, this chemical scheme was updated to include information from the the work of Capitelli _et al._ @capitelli_ferreira_gordiets_osipov_2019, NIST Chemical Kinetics Database @NIST_Kinetics, and recent publication by Bang _et al._ @bang2023kinetic. Tables \@table-k-plus and \@table-k-minus summarize the rate coefficients data from these sources for direct and reverse reactions, respectively. For comparison, the tables show also data used by the PSI.COM project \@psi_com. Whenever available, formula are specified, and in these cases the values are calculations at the reference temperature of 300 K. 

The reactions and rate coefficients were harmonized to the Arrhenius form $k = A (T/300)^n exp(-E_a/T)$, with units converted to $m^3 s^-1$ and $m^6 s^-1$, for two-body and three-body processes, respectively. The tables do not specify the state configuration of its species since this information was absent in Capitelli _et al._ @capitelli_ferreira_gordiets_osipov_2019. The table show disparate values for the rate coefficients proposed by the different sources. In particular, the values by Bang _et al._ @bang2023kinetic are often very different by several orders of magnitude, probably due to sign errors in the exponential factor. For this reason, preference was given to the expressions proposed by Capitelli _et al._ using NIST for cross-checking. Regarding NIST data, theoretical values were only used when experimental data were unavailable. Note that Capitelli's data were derived at atmospheric pressure and high gas temperatures, typically above 1000 K. Therefore, the values of $A$ and $E_a$ in Capitelli's expressions were adjusted in some cases. After the assessement of the data showed in the tables, a final set of rate coefficients was selected, marked as green cells. In cases of strong disagreement between the values of rate coefficients from different sources, a range of uncertainty was put on record (see Appendix) for future use in uncertainty analysis.

// TABLE 1: Forward rate coefficients (k+)
#figure(
  caption: [Forward rate coefficients for N₂-H₂ chemistry.]  
)[
  #table(
      columns: 5,
      align: (left, left, center, center, center),
      stroke: 0.5pt,
      [*Reaction*], [*Capitelli (formula)*], [*PSI.COM*], [*Bang*], [*NIST*],
      [$N_2 H_4+H <-> N_2 H_3+H_2$], [$2.10e-17 exp(-1260.0/T)$], [], [], [],
      [For T=300K], [$3.15e-19$], [$1.2e-17 exp(-1260/T_g)$], [$4.58e-27 T_g^(2.56) exp(614.1/T_g)$], [$1.59e-19$],
      [$N_2 H_4+H <-> N_2 H_2+N H_3$], [$1.90e-21 exp(-1560.0/T)$], [], [], [],
      [For T=300K], [$1.05e-23$], [--], [--], [--],
      [$N_2 H_3+H <-> N_2 H_2+H_2$], [$1.70e-18 exp(-1000.0/T)$], [], [], [],
      [For T=300K], [$6.06e-20$], [--], [$2.69e-16$], [--],
      [$N_2 H_3+H <-> 2N H_2$], [$2.60e-18$], [], [], [],
      [For T=300K], [$2.60e-18$], [--], [--], [$2.01e-17$],
      [$N_2 H_3+H <-> N H+N H_3$], [$1.70e-19$], [], [], [],
      [For T=300K], [$1.70e-19$], [--], [$1.66e-19$], [--],
      [$N_2 H_2+H <-> N_2 H+H_2$], [$1.70e-17 exp(-500.0/T)$], [], [], [],
      [For T=300K], [$3.21e-18$], [--], [$6.33e-17$], [$5.2e-18$],
      [$N_2 H+H <-> N_2+H_2$], [$6.60e-17 exp(-1500.0/T)$], [], [], [],
      [For T=300K], [$4.45e-19$], [--], [$1.66e-16$], [$1.66e-18$],
      [$N H_3+H <-> N H_2+H_2$], [$2.10e-17 exp(-10820.0/T)$], [], [], [],
      [For T=300K], [$4.56e-33$], [$8.4e-20 (T_g/300)^(4.1) exp(-4760/T_g)$], [$6.08e-11$], [$4.71e-26$],
      [$N H_2+H <-> N H+H_2$], [$3.20e-17$], [], [], [],
      [For T=300K], [$3.20e-17$], [$1.43e-19$], [$1.80e-19$], [$1e-17$],
      [$N H+H <-> N+H_2$], [$8.30e-16 exp(-1000.0/T)$], [], [], [],
      [For T=300K], [$2.96e-17$], [$3.12e-17$], [$7.50e-17$], [$1.69e-17$],
      [$N_2 H_4+N H <-> N H_2+N_2 H_3$], [$2.90e-17 (T/300)^0.5 exp(-1000.0/T)$], [], [], [],
      [For T=300K], [$1.03e-18$], [--], [$4.67e-17$], [$5.21e-24$],
      [$N_2 H_2+N H <-> N_2 H+N H_2$], [$1.70e-17 exp(-500.0/T)$], [], [], [],
      [For T=300K], [$3.21e-18$], [--], [$4.86e-20$], [--],
      [$N_2 H+N H <-> N_2+N H_2$], [$5.80e-18 (T/300)^0.5 exp(-1000.0/T)$], [], [], [],
      [For T=300K], [$2.07e-19$], [--], [$8.3e-17$], [--],
      [$N H+N H <-> N H_2+N$], [$5.80e-18 (T/300)^0.5 exp(-1000.0/T)$], [], [], [],
      [For T=300K], [$2.07e-19$], [$1.70e-18$], [$6.86e-21$], [$2.16e-21$],
      [$N H+N H <-> N_2 H+H$], [$2.30e-17 (T/300)^0.5 exp(-500.0/T)$], [], [], [],
      [For T=300K], [$4.34e-18$], [--], [--], [--],
      [$N_2 H_4+N H_2 <-> N_2 H_3+N H_3$], [$1.10e-17 (T/300)^0.5 exp(-1000.0/T)$], [], [], [],
      [For T=300K], [$3.92e-19$], [$5.20e-19$], [$8.15e-17$], [$5.15e-19$],
      [$N_2 H_3+N H_2 <-> N_2 H_2+N H_3$], [$2.90e-18 (T/300)^0.5$], [], [], [],
      [For T=300K], [$2.90e-18$], [--], [$5.31e-21$], [$8.63e-19$],
      [$N_2 H_2+N H_2 <-> N_2 H+N H_3$], [$1.70e-18 exp(-2000.0/T)$], [], [], [],
      [For T=300K], [$2.16e-21$], [0], [$2.61e-20$], [$1.06e-22$],
      [$N_2 H_2+N H_2 <-> N H+N_2 H_3$], [$2.90e-18 (T/300)^0.5 exp(-17000.0/T)$], [], [], [],
      [For T=300K], [$7.12e-43$], [--], [--], [--],
      [$N_2 H+N H_2 <-> N_2+N H_3$], [$1.70e-17$], [], [], [],
      [For T=300K], [$1.70e-17$], [--], [$2.87e-10$], [--],
      [$N H_3 + N H_2 <-> N_2 H_3 + H_2$], [$2.30e-17 (T/300)^0.5 exp(-10850.0/T)$], [], [], [],
      [For T=300K], [$4.52e-33$], [--], [$0.017$], [--],
      [$N H_2 + N H_2 <-> N H + N H_3$], [$1.00e-17 exp(-5000.0/T)$], [], [], [],
      [For T=300K], [$5.78e-25$], [$1.99e-21$], [$1.31e-20$], [$< 3.32e-21$],
      [$N H_2 + N H_2 <-> N_2 H_2 + H_2$], [$6.60e-17 exp(-6000.0/T)$], [], [], [],
      [For T=300K], [$1.36e-25$], [$1.3e-18$], [$2.86e-05$], [$1.3e-18$],
      [$N H_2 + N H <-> N_2 H_2 + H$], [$5.20e-17 exp(-500.0/T)$], [], [], [],
      [For T=300K], [$9.82e-18$], [$2.5e-15$], [$4.02e-17$], [$2.11e-27$],
      [$N_2 H_4+N_2 H_2 <-> 2N_2 H_3$], [$7.20e-17 (T/300)^0.5 exp(-15000.0/T)$], [], [], [],
      [For T=300K], [$1.39e-38$], [--], [3727], [--],
      [$N_2 H_3+N_2 H_2 <-> N_2 H_4+N_2 H$], [$1.70e-17 exp(-5000.0/T)$], [], [], [],
      [For T=300K], [$9.82e-25$], [--], [$2.90e-10$], [--],
      [$N_2 H_2+N_2 H_2 <-> N_2 H+N_2 H_3$], [$1.70e-17 exp(-5000.0/T)$], [], [], [],
      [For T=300K], [$9.82e-25$], [--], [$2.90e-10$], [--],
      [$N_2 H+N_2 H <-> N_2 H_2+N_2$], [$1.70e-17 exp(-5000.0/T)$],
      [For T=300K], [$9.82e-25$], [--], [$2.90e-10$], [--],
      [$N H + N <-> N_2 + H$], [$1.80e-17 (T/300)^0.5$], [], [], [],
      [For T=300K], [$1.80e-17$], [$5.00e-17$], [$4.98e-17$], [$1.90e-17$],
      [$N_2 H + N <-> N H + N_2$], [$5.20e-17 exp(-1000.0/T)$], [], [], [],
      [For T=300K], [$1.86e-18$], [--], [--], [--],
      [$N_2(A)+N H_3 -> N_2(X)+H+N H_2$], [--], [], [], [],
      [For T=300K], [$8.50e-17$], [$1.6e-16$], [--], [$1.20e-16$],
      [$N_2(A)+H -> N_2(X,v=25)+H$], [--], [], [], [],
      [For T=300K], [$2.10e-16$], [$5.00e-17$], [--], [$2.10e-16$],
      [$N_2(A)+H_2 -> N_2(X) + 2H$], [--], [], [], [],
      [For T=300K], [$1.71e-21$], [$1.71e-21$], [--], [--],
      [$N(2D)+H_2 -> N H+H$], [--], [], [], [],
      [For T=300K], [$2.30e-18$], [$2.30e-18$], [$2.30e-18$], [$2.19e-18$],
  )
]
// TABLE 2: Reverse rate coefficients (k-)
#figure(
  caption: [Reverse rate coefficients for N₂-H₂ chemistry.]
)[
  #table(
      columns: 5,
      align: (left, left, center, center, center),
      stroke: 0.5pt,
      [*Reaction*], [*Capitelli (formula)*], [*PSI.COM*], [*Bang*], [*NIST*],
      [$N_2 H_4+H <-> N_2 H_3+H_2$], [--], [], [], [],
      [For T=300K], [--], [--], [--], [--],
      [$N_2 H_4+H <-> N_2 H_2+N H_3$], [--], [], [], [],
      [For T=300K], [--], [--], [--], [--],
      [$N_2 H_3+H <-> N_2 H_2+H_2$], [--], [], [], [],
      [For T=300K], [--], [--], [--], [--],
      [$N_2 H_3+H <-> 2N H_2$], [--], [], [], [],
      [For T=300K], [--], [--], [--], [$< 1e-19$],
      [$N_2 H_3+H <-> N H+N H_3$], [--], [], [], [],
      [For T=300K], [--], [--], [--], [--],
      [$N_2 H_2+H <-> N_2 H+H_2$], [$1.90e-19 (T/300)^0.5 exp(-23184.0/T)$], [], [], [],
      [For T=300K], [$5.21e-53$], [--], [--], [--],
      [$N_2 H+H <-> N_2+H_2$], [$7.10e-16 exp(-56950.0/T)$], [], [], [],
      [For T=300K], [$2.56e-98$], [--], [--], [--],
      [$N H_3+H <-> N H_2+H_2$], [$2.10e-17 (T/300)^0.5 exp(-9274.0/T)$], [], [], [],
      [For T=300K], [$7.88e-31$], [$2.16e-26$], [--], [$3.05e-24$],
      [$N H_2+H <-> N H+H_2$], [$2.20e-17 exp(-3880.0/T)$], [], [], [],
      [For T=300K], [$5.32e-23$], [--], [--], [$2.06e-28$],
      [$N H+H <-> N+H_2$], [$3.90e-16 exp(-15775.0/T)$], [], [], [],
      [For T=300K], [$5.68e-39$], [$1.50e-34$], [$2.50e-20$], [$4.37e-40$],
      [$N_2 H_4+N H <-> N H_2+N_2 H_3$], [--], [], [], [],
      [For T=300K], [--], [--], [--], [--],
      [$N_2 H_2+N H <-> N_2 H+N H_2$], [--], [], [], [],
      [For T=300K], [--], [--], [--], [--],
      [$N_2 H+N H <-> N_2+N H_2$], [$8.50e-17 (T/300)^0.5 exp(-52920.0/T)$], [], [], [],
      [For T=300K], [$2.09e-93$], [--], [--], [--],
      [$N H+N H <-> N H_2+N$], [$4.00e-17 (T/300)^0.5 exp(-11890.0/T)$], [], [], [],
      [For T=300K], [$2.45e-34$], [--], [--], [$2.96e-30$],
      [$N H+N H <-> N_2 H+H$], [$2.90e-16 (T/300)^0.5 exp(-43240.0/T)$], [], [], [],
      [For T=300K], [$7.35e-79$], [--], [--], [--],
      [$N_2 H_4+N H_2 <-> N_2 H_3+N H_3$], [--], [], [], [],
      [For T=300K], [--], [--], [--], [--],
      [$N_2 H_3+N H_2 <-> N_2 H_2+N H_3$], [--], [], [], [],
      [For T=300K], [--], [--], [--], [--],
      [$N_2 H_2+N H_2 <-> N_2 H+N H_3$], [--], [], [], [],
      [For T=300K], [--], [--], [--], [--],
      [$N_2 H_2+N H_2 <-> N H+N_2 H_3$], [--], [], [], [],
      [For T=300K], [--], [$3.32e-17$], [--], [--],
      [$N_2 H+N H_2 <-> N_2+N H_3$], [$1.70e-15 exp(-57960.0/T)$], [], [], [],
      [For T=300K], [$2.11e-99$], [--], [--], [--],
      [$N H_3 + N H_2 <-> N_2 H_3 + H_2$], [--], [], [], [],
      [For T=300K], [--], [--], [--], [--],
      [$N H_2 + N H_2 <-> N H + N H_3$], [$7.40e-17 exp(-15470.0/T)$], [], [], [],
      [For T=300K], [$2.98e-39$], [--], [--], [$1.66e-35$],
      [$N H_2 + N H_2 <-> N_2 H_2 + H_2$], [$6.20e-15 exp(-25910.0/T)$], [], [], [],
      [For T=300K], [$1.92e-52$], [--], [--], [--],
      [$N H_2 + N H <-> N_2 H_2 + H$], [$6.80e-15 exp(-11995.0/T)$], [], [], [],
      [For T=300K], [$2.94e-32$], [--], [--], [--],
      [$N_2 H_4 + N_2 H_2 <-> 2 N_2 H_3$], [--], [], [], [],
      [For T=300K], [--], [$2.00e-17$], [--], [$3.7e-06$],
      [$N_2 H_3 + N_2 H_2 <-> N_2 H_4 + N_2 H$], [--], [], [], [],
      [For T=300K], [--], [--], [--], [--],
      [$N_2 H_2 + N_2 H_2 <-> N_2 H + N_2 H_3$], [--], [], [], [],
      [For T=300K], [--], [--], [--], [--],
      [$N_2 H + N_2 H <-> N_2 H_2 + N_2$], [$8.30e-17 exp(-33260.0/T)$], [], [], [],
      [For T=300K], [$5.89e-65$], [--], [--], [--],
      [$N H + N <-> N_2 + H$], [$4.70e-16 (T/300)^0.5 exp(-75900.0/T)$], [], [], [],
      [For T=300K], [$6.25e-126$], [--], [--], [$8.87e-124$],
      [$N_2 H + N <-> N H + N_2$], [$1.20e-16 exp(-41830.0/T)$], [], [], [],
      [For T=300K], [$3.34e-71$], [--], [--], [--],
  )
]

#block[
  _Note:_ k follows k = A (T/300)^n exp(-Ea/T); units in m³ s⁻¹ (bimolecular) and m⁶ s⁻¹ (termolecular).
  k⁻ from detailed balance when missing. (+M) denotes third-body processes.
  "Calculated" values at 300 K unless stated; "psi.com" are the implemented coefficients.
  Capitelli fits often target higher-T regimes (>1000 K); form retained with noted validity limits.
  Bang used mainly as comparator. Uncertainty = envelope between sources (e.g., NIST vs Capitelli).
  NIST experimental values preferred; theory used only when no experiment exists.
]
The rate coefficients selected in tables 1 and 2 were used to update and complete the original chemical scheme, as shown in [tabl .chem anexo], extending it to use in future atmospheric pressure studies.


=== Mesoscopic Surface Model 

In the study of reactive plasmas, particularly those involving nitrogen-hydrogen mixtures for applications like ammonia synthesis, the interaction between the plasma and the reactor surfaces is of paramount importance. The surface is not merely a passive boundary for particle loss; it is an active chemical environment where crucial reaction pathways occur. The modeling of these interactions has evolved from using simplified macroscopic parameters to employing detailed mesoscopic kinetic models, which provide a more fundamental and predictive understanding of the plasma chemistry.[references prof Vasco papers and restore gamma]@gordiets_1998

Mesoscopic kinetic models treat the surface as a dynamic system with its own set of species, sites, and elementary reactions. This work is inspired by the mesoscopic model proposed by Gordiets _et al._ @gordiets_1998, according to which the synthesis of ammonia ($N H_3$) predominantly occurs on the surface, which acts as a catalyst. The foundations of this model rely on distinguishing between the following components: *physisorption surface vacant sites* (F(v)), where gas-phase particles are weakly and movably bound by van der Waals forces, and *chemisorption surface vacant sites* (S(v)), where particles can form strong, immobilizing chemical bonds; *gas-phase atoms* (N, H) and *radicals* (NH, NH$""_2$) formed in the plasma volume, which act as fundamental building blocks that initiate the surface chemistry, via either *physisorbed surface states* (e.g., N(F)) or *chemisorbed surface states* (e.g., N(S)).

The entire lifecycle of a particle on the surface is described by a set of elementary reactions. The initial step involves *adsorption*, where a gas-phase atom weakly binds to a physisorption site (e.g., N($""^4$S) + F(v) $arrow$ N(F)), or strongly binds to a chemisorption site (e.g., N($""^4$S) + S(v) $arrow$ N(S)). A mobile physisorbed atom can also transition to a chemisorbed state (N(F) + S(v) $arrow$ N(S) + F(v)). The reverse process, *thermal desorption*, occurs when adsorbed particles gain enough thermal energy to break their bonds and return to the gas phase (e.g., N(F) $arrow$ N($""^4$S) + F(v)), and is naturally favoured when involving physisorbed species.

Subsequently, a series of surface reactions builds $N H_x$ radicals, with $x=1,2$, through sequential hydrogenation reactions. First, an adsorbed nitrogen atom reacts with a gas-phase hydrogen atom to form an adsorbed NH radical (H($""^1$S) + N(S) $arrow$ NH(S)), which is then further hydrogenated to form NH$""_2$(S) (H($""^1$S) + NH(S) $arrow$ $N H_2$(S)) [fix]. The final step is the formation and desorption of ammonia into the gas phase, via two primary recombination mechanisms. In the *Eley-Rideal (ER) mechanism*, a gas-phase hydrogen atom directly strikes and reacts with a chemisorbed species 
$
H(""^1S) + N H_2(S) $arrow$ $N H_3$(X) + S(v)
$
alternatively, in the *Langmuir-Hinshelwood (LH) mechanism*, a physisorbed species diffuses across the surface to encounter a chemisorbed species and react H(F) + NH$""_2$(S) $arrow$ NH$""_3$ + S(v) + F(v)[to be confirmed]. 

A key strength of the mesoscopic model is its ability to self-consistently determine the macroscopic $gamma$-coefficients instead of treating them as input parameters. As shown in @gordiets_1998, even in the case of the complex $N_2$-$H_2$ surface chemistry, the recombination coefficients $gamma_N$ and $gamma_H$ can be calculated from the frequencies of the elementary surface reactions and the fractional surface coverages of adsorbed species. This bridges the two approaches, allowing for a more robust and physically grounded plasma model where the surface response is a calculated output, not an assumption.

The complete set of surface reactions implemented in the model is shown below:

#figure(
  kind: "algorithm",
  supplement: "Surface",
  caption: [Mesoscopic surface model reactions for N₂-H₂ system - Part 1: Core reactions (Gordiets _et al._ 1998)]
)[
  ```
  % Mesoscopic surface model for N2-H2 (inspired in Gordiets et al 1998)
  % Adsorption and desorption of N and H atoms
  N(4S) + wall_F(v) -> wall_N(F)                               | thermalEffusionSurface        | 1, 0, gasTemperature     
  wall_N(F) -> N(4S) + wall_F(v)                               | thermalDesorption             | 1e15, 51e3               
  H(1S) + wall_F(v) -> wall_H(F)                               | thermalEffusionSurface        | 1, 0, gasTemperature     
  wall_H(F) -> H(1S) + wall_F(v)                               | thermalDesorption             | 1e15, 37e3               

  % Nitrogen surface chemistry
  N(4S) + wall_S(v) -> wall_N(S)                               | thermalEffusionSurface        | 1, 0, gasTemperature     
  wall_N(F) + wall_S(v) -> wall_N(S) + wall_F(v)               | surfaceTransport              | 1e13, 0.5*51e3, 1, 0, true     
  N(4S) + wall_N(S) -> N2(X,v=0) + wall_S(v)                   | thermalEffusionSurface        | 1, 11.2e3, gasTemperature  
  wall_N(F) + wall_N(S) -> N2(X,v=0) + wall_S(v) + wall_F(v)   | surfaceTransport              | 1e13, 0.5*51e3, 1, 25.5e3, false

  % Hydrogen surface chemistry
  H(1S) + wall_S(v) -> wall_H(S)                               | thermalEffusionSurface        | 1, 0, gasTemperature       
  wall_H(F) + wall_S(v) -> wall_H(S) + wall_F(v)               | surfaceTransport              | 6.7e14, 0.5*37e3, 1, 4.157e3, true
  H(1S) + wall_H(S) -> H2(X,v=0) + wall_S(v)                   | thermalEffusionSurface        | 1, 6.984e3, gasTemperature 
  wall_H(F) + wall_H(S) -> H2(X,v=0) + wall_S(v) + wall_F(v)   | surfaceTransport              | 6.7e14, 0.5*37e3, 1, 25.5e3, false
  ```
]

#pagebreak()

#figure(
  kind: "algorithm",
  supplement: "Surface",
  caption: [Mesoscopic surface model reactions for N₂-H₂ system - Part 2: NH₃ synthesis pathway]
)[
  ```
  % NH radical formation
  N(4S) + wall_H(S) -> wall_NH(S)                              | thermalEffusionSurface        | 1, 33.2e3, gasTemperature  
  wall_N(F) + wall_H(S) -> wall_NH(S) + wall_F(v)              | surfaceTransport              | 1e13, 0.5*51e3, 1, 33.2e3, true
  H(1S) + wall_N(S) -> wall_NH(S)                              | thermalEffusionSurface        | 1, 33.2e3, gasTemperature  
  wall_H(F) + wall_N(S) -> wall_NH(S) + wall_F(v)              | surfaceTransport              | 6.7e14, 0.5*37e3, 1, 33.2e3, true
  NH(X) + wall_S(v) -> wall_NH(S)                              | thermalEffusionSurface        | 1, 25e3, gasTemperature    

  % NH2 radical formation
  H(1S) + wall_NH(S) -> wall_NH2(S)                            | thermalEffusionSurface        | 1, 25e3, gasTemperature    
  wall_H(F) + wall_NH(S) -> wall_NH2(S) + wall_F(v)            | surfaceTransport              | 6.7e14, 0.5*37e3, 1, 0, true
  NH(X) + wall_H(S) -> wall_NH2(S)                             | thermalEffusionSurface        | 1, 25e3, gasTemperature    
  NH2(X) + wall_S(v) -> wall_NH2(S)                            | thermalEffusionSurface        | 1, 25e3, gasTemperature    

  % NH3 formation and desorption
  H(1S) + wall_NH2(S) -> NH3(X) + wall_S(v)                    | thermalEffusionSurface        | 1, 25e3, gasTemperature    
  wall_H(F) + wall_NH2(S) -> NH3(X) + wall_S(v) + wall_F(v)    | surfaceTransport              | 6.7e14, 0.5*37e3, 1, 0, false
  NH2(X) + wall_H(S) -> NH3(X) + wall_S(v)                     | thermalEffusionSurface        | 1, 25e3, gasTemperature    
  H2(X,v=0) + wall_NH(S) -> NH3(X) + wall_S(v)                 | thermalEffusionSurface        | 1, 0, gasTemperature       
  ```
]

#figure(
  kind: "algorithm",
  supplement: "Surface",
  caption: [Mesoscopic surface model reactions for N₂-H₂ system - Part 3: Metastable species mechanisms]
)[
  ```
  % Metastable N and H atoms - Physisorption
  N(2P) + wall_F(v) -> wall_N(F)                               | thermalEffusionSurface        | 1, 0, gasTemperature       
  N(2D) + wall_F(v) -> wall_N(F)                               | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(2S) + wall_F(v) -> wall_H(F)                               | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(2P) + wall_F(v) -> wall_H(F)                               | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(3) + wall_F(v) -> wall_H(F)                                | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(4) + wall_F(v) -> wall_H(F)                                | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(5) + wall_F(v) -> wall_H(F)                                | thermalEffusionSurface        | 1, 0, gasTemperature       

  % Metastable N and H atoms - Chemisorption
  N(2D) + wall_S(v) -> wall_N(S)                               | thermalEffusionSurface        | 1, 0, gasTemperature       
  N(2P) + wall_S(v) -> wall_N(S)                               | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(2S) + wall_S(v) -> wall_H(S)                               | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(2P) + wall_S(v) -> wall_H(S)                               | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(3) + wall_S(v) -> wall_H(S)                                | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(4) + wall_S(v) -> wall_H(S)                                | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(5) + wall_S(v) -> wall_H(S)                                | thermalEffusionSurface        | 1, 0, gasTemperature       

  % Metastable atoms - Recombination
  N(2D) + wall_N(S) -> N2(X,v=0) + wall_S(v)                   | thermalEffusionSurface        | 1, 0, gasTemperature       
  N(2P) + wall_N(S) -> N2(X,v=0) + wall_S(v)                   | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(2S) + wall_H(S) -> H2(X,v=0) + wall_S(v)                   | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(2P) + wall_H(S) -> H2(X,v=0) + wall_S(v)                   | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(3) + wall_H(S) -> H2(X,v=0) + wall_S(v)                    | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(4) + wall_H(S) -> H2(X,v=0) + wall_S(v)                    | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(5) + wall_H(S) -> H2(X,v=0) + wall_S(v)                    | thermalEffusionSurface        | 1, 0, gasTemperature       

  % Metastable atoms - NH formation
  N(2D) + wall_H(S) -> wall_NH(S)                              | thermalEffusionSurface        | 1, 0, gasTemperature       
  N(2P) + wall_H(S) -> wall_NH(S)                              | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(2S) + wall_N(S) -> wall_NH(S)                              | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(2P) + wall_N(S) -> wall_NH(S)                              | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(3) + wall_N(S) -> wall_NH(S)                               | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(4) + wall_N(S) -> wall_NH(S)                               | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(5) + wall_N(S) -> wall_NH(S)                               | thermalEffusionSurface        | 1, 0, gasTemperature       

  % Metastable atoms - NH2 formation
  H(2S) + wall_NH(S) -> wall_NH2(S)                            | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(2P) + wall_NH(S) -> wall_NH2(S)                            | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(3) + wall_NH(S) -> wall_NH2(S)                             | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(4) + wall_NH(S) -> wall_NH2(S)                             | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(5) + wall_NH(S) -> wall_NH2(S)                             | thermalEffusionSurface        | 1, 0, gasTemperature       

  % Metastable atoms - NH3 formation
  H(2S) + wall_NH2(S) -> NH3(X) + wall_S(v)                    | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(2P) + wall_NH2(S) -> NH3(X) + wall_S(v)                    | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(3) + wall_NH2(S) -> NH3(X) + wall_S(v)                     | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(4) + wall_NH2(S) -> NH3(X) + wall_S(v)                     | thermalEffusionSurface        | 1, 0, gasTemperature       
  H(5) + wall_NH2(S) -> NH3(X) + wall_S(v)                     | thermalEffusionSurface        | 1, 0, gasTemperature       
  ```
]


=== Implementation in LoKI-B+C

The chemical kinetics data used in LoKI-B+C is parsed from structured `.chem` files, which serve as primary interface between the chemical model and the simulation solver. The `.chem` files specify all species, volume/surface reactions and rate coefficients, and transport models within a standardized format, following the general syntax (Reference Manual LoKI-B+C, to be published):
#v(.3cm)

`Reactants -> Products | Type | Parameters | Notes/References`

#v(.3cm)

where `Reactants -> Products` represent the chemical reactions (including transport processes), `Type` specifies the type of rate coefficient, `Parameters` are the parameters needed to calculate the rate coefficient, and `Notes/References` are complementary information.

A state-specific notation is employed, detailing electronic species, e.g. `$N2(A3Su+)$`, `$H(1S)$`, `$N(2D)$`; vibrational species, e.g. `$N2(X,v=0..44)$`, `$H2(X,w=0..14)$`; and also ions, e.g. `$H3(+,X)$`, `$H(-,"gnd")$` (see @state-of-the-art). 

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

In LoKI-B+C framework, cross sections are provided in standardized LXCat @lxcat format files, which contain energy-dependent cross-section data for various collision processes. The cross section files include comprehensive coverage of collision processes, encompassing elastic momentum-transfer, vibrational excitation, electronic excitation, ionization and dissociative attachment. Tables 3 and 4(bla bla) show snippets of cross section data used in this work for $N H_3$ and $H_2$, respectively.


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
]

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
]


The cross-section data used in this work originates from multiple validated sources. The primary database utilized is the IST-Lisbon database on LXCat @alves_2014, which provides complete, validated sets of cross sections for $H_2$, $N_2$, and $N H_3$ (in some cases to be published). To validate cross-section datasets, *electron swarm parameters* obtained from EBE solution are commonly employed as benchmarks. Electron swarm parameters are constituted by macroscopic transport parameters of electrons in gases under applied electric fields, including *characteristic energy*, *reduced mobility* and *drift velocity*, as well as electron rate coefficients, including *Townsend ionization and attachment coefficients*. These parameters can be directly measured in controlled swarm experiments and compared against simulations from Boltzmann solvers. For the IST-Lisbon database, predictions typically agree with experimental measurements within less than 20% for reduced electric fields $E/N approx 10^(-4) - 500$ Td @alves_2014. The validation plots shown below compare calculated swarm parameters (lines) against experimental data points for $H_2$ and $N H_3$ \@shubham_article.

#subfigure-grid(
  figure(
    image("../Images/characteristic_energy_h2.png", width: 80%),
    caption: []
  ),


  figure(
    image("../Images/dissociation_coefficient_h2.png", width: 80%),
    caption: []
  ),

  figure(
    image("../Images/drift_velocities_nh3.png", width: 80%),
    caption: []
  ),

  figure(
    image("../Images/emission_coefficient_h2.png", width: 80%),
    caption: []
  ),

  figure(
    image("../Images/ionization_coefficient_h2.png", width: 80%),
    caption: []
  ),

  figure(
    image("../Images/reduced_mobility_h2.png", width: 80%),
    caption: []
  ),

  figure(
    image("../Images/townsend_attachment_nh3.png", width: 80%),
    caption: []
  ),

  figure(
    image("../Images/townsend_ionization_nh3.png", width: 80%),
    caption: []
  ),

  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: (5cm, 5cm),
  caption: [Validation of swarm parameters for $H_2$ and $N H_3$.]
)


== Validation of the Chemical Model

The validation of the chemical kinetic model developed in this thesis is performed by comparing key model outputs against published experimental data. The primary observables selected for this validation are the densities of relevant chemical species and the reduced electric field ($E\/N$), which correspond to experimentally measured plasma properties.

The goal of this comparison is not necessarily to achieve perfect quantitative agreement, but rather to confirm that the model correctly reproduces the observed experimental trends, within reasonable uncertainties. Quantitative results will be given attention whenever possible. Agreement on how species densities and $E\/N$ evolve with varying external conditions—such as gas pressure, discharge current, and initial $H_2$ concentration in the gas mixture — will give confidence that the model is able to capture the dominant chemical kinetic pathways.

=== Simulation setup in LoKI

Model validation was conducted through simulations using the LoKI framework, and comparison against the following experimental data:

- *Reduced Electric Field ($E\/N$):* data from Cernogora _et al._ @cernogora and Brovikova & Galiaskarov @brovikova in pure $N_2$ discharges, as well as measurements from this work in $N_2-H_2$ discharges are used to validate the electron kinetics and power coupling mechanisms [capitulo anterior e projeto referencia].
- *Species Densities ($[N H_3]$, $[N]$, $[H]$):* data from Amorim _et al._ @amorim_1996 and the present workin $N_2-H_2$ discharges.

A critical aspect of this validation is a thorough analysis of the conditions and methods employed to obtain the experimental data. Factors such as the precision of measurements, and the values of gas temperature and gas flow rates are often not clearly specified or controlled in the experiments. For example, as discussed in Chapter 2, variations in the gas temperature directly impact the gas number density ($N$), thus affecting all kinetic rates. These issues introduce inherent uncertainties and must be carefully considered when comparing simulation results with experimental measurements.

==== Analysis of Experimental Conditions and Methodologies
The experimental works of Cernogora _et al._ @cernogora, Brovikova & Galiaskarov @brovikova and Amorim _et al._ @amorim_1996 all employed DC glow discharges in cylindrical tubes operated with a continuous gas flow. However, the specific operational parameters and diagnostic techniques adopted by these authors varied significantly, as shown in @authors and discussed below.

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
]<authors>


*1. Amorim _et al._ (1994 and 1996): Absolute Densities of $[N H_3]$ and $[H]$ in $N_2-H_2$*

- *Measurement Technique:* This study used a combination of Photofragment Translational Spectroscopy (PFTS) and Laser-Induced Fluorescence (LIF) to measure species densities. A 205 nm laser photodissociated the $N H_3$ molecules synthesized in the plasma, and the resulting "hot" H-atom fragments were detected via LIF on the H-alpha line (656 nm) during the same laser pulse. The density of "cold" H atoms produced by the discharge was measured simultaneously from the narrow core of the LIF spectral profile.
- *Absolute Calibration:* The H-atom LIF signal was calibrated using Vacuum Ultraviolet (VUV) absorption spectroscopy on the Lyman-$alpha$ line (121 nm) in a pure $H_2$ discharge.
- *Key Results:* A maximum $N H_3$ density of approximately $8 times 10^12 " cm"^(-3)$ was measured in a 75% $H_2$ – 25% $N_2$ mixture at 2 Torr and 50 mA. The H-atom dissociation energy from $N H_3$ was determined to be $(4.34 plus.minus 0.07)$ eV.

*2. Brovikova & Galiaskarov (2001): $E\/N_0$ and $[N]$ in Pure $N_2$*

- *Measurement Technique:* The ground-state N-atom concentration, $[N(""^4 S)]$, was measured using Electron Paramagnetic Resonance (EPR). The longitudinal electric field ($E$) was measured using a two-probe current compensation method.
- *Key Results:* The reduced electric field, $E\/N_0$, was measured in the range of $5.27$ to $11.82 times 10^(-16) " V cm"^2$ across pressures of 60–533 Pa and currents of 10–80 mA.
- *Temperature and Flow:* This work is particularly valuable as it provides systematic measurements of both the axial gas temperature ($T_0$) and wall temperature ($T_("wall")$). $T_0$ varied significantly from 331.5 K to 680.6 K, highlighting the importance of thermal effects. Gas flow rates were also detailed, ranging from 0.082 to 2.788 $"cm"^3 \/ "s"$, and were used in their kinetic analysis to determine species lifetimes and dissociation rates [confirmar].

*3. Cernogora _et al._ (1981): $E$ and $[N]$ in Pure $N_2$*

- *Measurement Technique:* The axial electric field ($E$) was measured from the floating potential difference between two electrostatic probes. The N-atom concentration, $[N(""^4 S)]$, was determined downstream of the discharge using the classic NO titration method. Electron density was measured with a microwave cavity technique.
- *Key Results:* The study reported that $E\/p$ decreases as the discharge current increases, a behavior they attributed to gas heating. Their kinetic model showed good agreement with experimental $E\/p$ at low currents where gas heating was negligible ($T_G approx 300$ K).
- *Temperature and Flow:* Gas temperature was deduced from the rotational distribution of the $N_2$ second positive system and was found to reach up to 600 K at higher currents. The N-atom measurements were performed in a flow system with rates from 0.1 to 6 $"cm"^3 \/ "s"$ NTP.

All three studies, either directly or indirectly, confirm that gas heating is a dominant effect. Brovikova & Galiaskarov provide the most comprehensive data, showing a temperature increase of over 300 K with current and pressure. Cernogora _et al._ note that gas heating (up to 600 K) must be included to explain the behavior of $E\/p$ at high currents. Amorim _et al._ measured H-atom temperatures between 500 and 1200 K, significantly higher than the molecular gas temperature, and demonstrated that accounting for this thermal non-equilibrium is essential for accurate VUV absorption calibration. Since the gas number density $N$ is inversely proportional to $T_("gas")$, any model validation for $E\/N$ or density-dependent reaction rates must carefully account for the gas temperature. The reported precision of the measurements varies. Brovikova & Galiaskarov state a measurement error not exceeding 40% for absolute N-atom concentration. Amorim _et al._ estimate an uncertainty of likely more than $plus.minus 20%$ for their $[N H_3]$ density value, due to the multi-step calibration process. Cernogora _et al._ do not provide explicit error bars for their E-field measurements. This range of uncertainty sets a realistic expectation for the level of quantitative agreement between our model and the experimental data. The experiments were all performed in flow systems, but at different rates. Brovikova & Galiaskarov used low, carefully controlled flow rates as a key parameter in their kinetic model. Cernogora _et al._ also used low flow rates for N-atom titration. Amorim _et al._ mention a "permanent gas flow" but do not quantify it for the $N H_3$ measurements. The difference in flow rates implies different residence times for species in the plasma, which can significantly alter the plasma chemistry, especially for synthesis reactions like that of ammonia. This is a key difference in experimental conditions that must be considered.

=== Results and Discussion

The validation of the chemical kinetic model is presented through systematic comparison of simulation results with experimental measurements. The analysis is organized into three main sections: the discharge characteristics, the concentrations of nitrogen and hydrogen atoms, and the density of ammonia.

==== Discharge Characteristics: Electric Field and Reduced Electric Field

The model's ability to predict fundamental electrical properties of the discharge is assessed by comparing simulations against measurements from Cernogora _et al._ @cernogora and Brovikova & Galiaskarov @brovikova  for pure $N_2$ discharges at $p = 133", "266$ Pa (see figures @EvsI and @ENvsNR), and Amorim _et al._ @amorim_1996 for pure $H_2$ discharges (see figure @ENvsNR_H2).

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

@ENvsNR shows simulations and measurements of the electric field $E$ as a function of the product $N R$, at a fixed current of 40 mA in pure nitrogen, for the working conditions of Cernogora _et al._ @cernogora and Brovikova & Galiaskarov @brovikova. This figure is a different representation of data already shown in @EvsI, confirming the disagreement observed before between the experimental data, yet showing a better agreement between simulations and measurements for Cernogora.

 The decrease of $E$ with $N R$ confirms the need for lower maintenance fields with the decrease in the plasma losses, due to the increase in the discharge volume and/or gas pressure. The simulation lines demonstrate good agreement with experimental trends for both the Cernogora and Brovikova datasets, suggesting that the electron-collision cross-sections used in the model for $N_2$ are consistent. This is fundamental to correctly calculating reaction rates in the plasma.

@ENvsNR_red_field shows the typical evolution of the reduced electric field $E\/N$ as a function of the product $N R$. The decrease of $E\/N$ with $N R$ confirms the need for lower maintenance fields with the decrease in the plasma losses, due to the increase in the discharge volume and/or gas pressure. The simulation lines demonstrate good agreement with experimental trends for both the Cernogora and Brovikova datasets, suggesting that the electron-collision cross-sections used in the model for $N_2$ are consistent. This is fundamental to correctly calculating reaction rates in the plasma.

#figure(
  image("../Images/sims/Gordiets_FIG3_I.png", width: 75%),
  caption: [Reduced electric field ($E\/N$) in pure hydrogen plasma as a function of $N R$. The simulation (solid line) shows excellent agreement with experimental measurements from Amorim _et al._ @amorim_1996.]
)<ENvsNR_H2>

In pure hydrogen plasma, the simulation demonstrates excellent quantitative agreement with experimental measurements across the entire range of $N R$ values. The model accurately captures the decay of $E\/N$ with increasing $N R$, indicating that the description of electron kinetics in pure hydrogen is robust. This validation in both pure $N_2$ and pure $H_2$ conditions provides confidence in the model's ability to handle the mixed $N_2$-$H_2$ system.

==== Atomic Species Concentration in $N_2$-$H_2$ Mixtures

The model's capability to predict the densities of atomic nitrogen and hydrogen as the gas mixture composition varies is evaluated next. These atomic species are the primary building blocks for ammonia synthesis.

#figure(
  image("../Images/sims/Gordiets_FIG2_II.png", width: 75%),
  caption: [Concentration of atomic nitrogen ([N]) as a function of $H_2$ percentage in the discharge, for Amorim _et al._ @amorim_1996 data. The simulation captures the catalytic effect of hydrogen on nitrogen dissociation, showing a peak enhancement around 1-2% $H_2$.]
)

The concentration of atomic nitrogen exhibits a remarkable catalytic effect when small amounts of hydrogen are added to the nitrogen discharge. The graph clearly shows that adding approximately 1-2% $H_2$ significantly enhances $N_2$ dissociation, producing much higher [N] concentrations than in pure nitrogen. This phenomenon results from quenching of excited nitrogen states by $H_2$, creating a more efficient pathway for dissociation. Beyond this peak, further hydrogen addition dilutes the nitrogen, causing [N] concentration to decrease. The simulation perfectly captures this catalytic effect qualitatively, correctly predicting the sharp initial rise, the peak location, and the subsequent gradual decay. This represents a strong validation of the core chemical kinetics scheme concerning nitrogen dissociation in the presence of hydrogen.

#figure(
  image("../Images/sims/Gordiets_FIG4_II.png", width: 75%),
  caption: [Relative concentration of atomic hydrogen ([H]) as a function of $H_2$ percentage. The simulation shows excellent quantitative agreement with three different experimental datasets, namely Amorim _et al._ @amorim_1996, across the entire composition range.]
)

The concentration of atomic hydrogen increases steadily as more $H_2$ is added to the feed gas, as expected. The simulation shows excellent quantitative agreement with all three experimental datasets across the entire range of gas compositions. This demonstrates that the model accurately describes the electron-impact dissociation of $H_2$ molecules and the subsequent atomic hydrogen chemistry. The consistency across multiple experimental sources further strengthens confidence in this aspect of the model.

==== Ammonia ($N H_3$) Synthesis

The ultimate test of the model is its ability to predict ammonia synthesis, which represents the culmination of complex gas-phase and surface reaction pathways.

#figure(
  image("../Images/sims/Gordiets_FIG6_II.png", width: 75%),
  caption: [Absolute concentration of ammonia ([NH$""_3$]) as a function of $H_2$ percentage, for Amorim _et al._ @amorim_1996 data. The orange line shows the simulation result scaled by a factor of 3 for comparison.]
)

The ammonia concentration as a function of hydrogen percentage reveals both the strengths and limitations of the current model. Experimental measurements show that $N H_3$ production is maximized with hydrogen fractions around 70-80%. The simulation correctly predicts the existence of a peak, although it is slightly shifted to the left, to the 20-30% $H_2$ range. However, it severely underestimates the absolute concentration by approximately a factor of 3. This discrepancy points to potential issues in the chemical scheme for $N H_3$ formation or destruction pathways. Possible sources include inaccuracies in reaction rates for surface recombination mechanisms (Eley-Rideal or Langmuir-Hinshelwood processes) or gas-phase $N H_x$ radical chemistry.

#figure(
  image("../Images/sims/Gordiets_FIG6_II_amorim_time_steps_[0.005, 0.04].png", width: 75%),
  caption: [Sensitivity of predicted [NH$""_3$] concentration to gas residence time in the plasma. Different lines represent simulations with residence times of 5 ms (blue), 10 ms (orange), 20 ms (green), for Amorim _et al._ @amorim_1996 data. The 10 ms residence time provides the best fit to experimental data.]
)

A critical finding emerges from the sensitivity analysis of gas residence time: the model's output for [NH$""_3$] is highly sensitive to this parameter. A shorter residence time of 5 ms overpredicts the concentration, while longer times of 40 ms significantly underpredict it. An intermediate residence time of 10 ms provides the best fit to experimental data. This strong sensitivity suggests that the discrepancies observed in absolute ammonia concentrations may not be solely due to incorrect reaction rates. Instead, they may be significantly influenced by uncertainties in estimating how long gas molecules interact within the plasma. The gas residence time affects both the extent of chemical conversion and the balance between formation and destruction pathways. This highlights the importance of accurately modeling both the chemical kinetics and the gas transport (flow patterns and residence time distributions) for predicting complex product molecules like $N H_3$.

==== Additional Validation: Reduced Electric Field in $N_2$-$H_2$ Mixtures

The model's performance in predicting the reduced electric field across different gas compositions is further validated using experimental data from LPP. This validation is particularly important as the reduced electric field directly governs the electron energy distribution and, consequently, all electron-impact processes in the plasma.

#figure(
  image("../Images/sims/LPP-#2_Q_10_field_H2_band_E_N.png", width: 85%),
  caption: [Reduced electric field ($E\/N$) as a function of hydrogen percentage ($H_2$%) for two pressure conditions: 266.0 Pa (blue) and 665.0 Pa (orange). Shaded bands represent simulation results with uncertainty ranges, while points with error bars show experimental measurements from LPP.]
)

The reduced electric field shows a non-monotonic dependence on the hydrogen concentration. For both pressure conditions, $E\/N$ initially increases with small additions of $H_2$ (up to ~10%), reaches a maximum, then decreases significantly as $H_2$ concentration increases further (up to ~90%), and finally shows a sharp increase when approaching 100% $H_2$. This behavior reflects the changing electron energy distribution and collision processes as the gas composition varies. 

The simulation bands (shaded areas) account for the uncertainty in gas temperature, estimated at approximately 50 K as discussed in Chapter 3. This temperature uncertainty directly affects the gas density and, consequently, the calculated $E\/N$ values. The experimental error bars incorporate similar temperature uncertainties.

The last data point at 100% $H_2$ deviates significantly from the general trend and should be interpreted with caution. As discussed in Chapter 3, the gas temperature determination method relies on fitting the peak of $N_2$ rotational temperature measurements. In pure hydrogen plasmas, where nitrogen is absent, this temperature diagnostic method becomes unreliable, leading to potentially inaccurate temperature estimates. The temperature values for this condition were obtained through visual regression, which, as evidenced by these trends, did not provide well-constrained results.

The higher $E\/N$ values at the lower pressure (266.0 Pa) compared to the higher pressure (665.0 Pa) are consistent with the expected pressure dependence of glow discharge characteristics, where reduced collision frequency at lower pressures requires higher fields to sustain the discharge.

#v(.5cm)

In summary, the model successfully predicts fundamental plasma parameters, including the electric field ($E$) and reduced electric field ($E\/N$), in both pure $N_2$ and pure $H_2$ plasmas across a wide range of conditions. It accurately reproduces the concentrations of primary dissociation products—atomic nitrogen ([N]) and atomic hydrogen ([H])—including complex phenomena such as the catalytic effect of $H_2$ on $N_2$ dissociation. The qualitative trends for all species and conditions are generally captured. The primary challenge lies in quantitatively predicting the concentration of ammonia ($N H_3$). Currently, it underestimates the absolute concentration by approximately a factor of 3. This indicates that refinement is needed in either the chemical pathways for $N H_3$ formation and destruction (particularly surface chemistry mechanisms) or in the treatment of gas residence time and transport effects. The strong sensitivity to residence time suggests that future work should focus on coupled kinetic-transport models that more accurately represent the experimental flow conditions.

For reference, an example of a `.in` file for a simulation in LoKI-B+C is shown below:

#figure(
  kind: "algorithm",
  supplement: "Simulation Setup",
  caption: [Example configuration file (`N2H2_simulation.in`) for LoKI-B+C simulations of $N_2$-$H_2$ plasmas.]
)[#text(size: 8pt)[
  ```
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % N2-H2 WORKING CONFIGURATION FILE LOKI  %
  % (subject to change during development) %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- configuration of the working conditions ---
workingConditions:
  reducedField: 60                         % in Td
  electronTemperature: 4.0                 % in eV
  excitationFrequency: 0                   % in Hz
  gasPressure: 532                         % in Pa
  gasTemperature: 444                      % in K   (average gas temperature)
  wallTemperature: 363                     % in K   (wall temperature)
  extTemperature: 300                      % in K   (external temperature)
  surfaceSiteDensity: 1e20                 % in m-2 (used for surface kinetics)
  electronDensity: 6.4e+15                 % in m-3
  chamberLength: 0.23                      % in m
  chamberRadius: 0.01                      % in m
  dischargeCurrent: 0.020                  % in A
  totalSccmInFlow: 7.400                   % in sccm
  totalSccmOutFlow: ensureIsobaric         % a number (in sccm) or a model: totalSccmInFlow, ensureIsobaric


% --- configuration of the electron kinetics ---
electronKinetics:
  isOn: true                            % true or false (to activate or deactivate the electron Kinetics)
  eedfType: boltzmann                   % boltzmann or prescribedEedf (generalized expression Maxwellian/Druyvesteyn)
%   shapeParameter: 1                     % prescribedEedf shape parameter from 1 (Maxwellian) to 2 (Druyvesteyn)
  ionizationOperatorType: usingSDCS     % conservative, oneTakesAll, equalSharing or usingSDCS
  growthModelType: temporal             % temporal or spatial
  includeEECollisions: false            % true or false (to include / remove e-e collisions)
  LXCatFiles:                           % cross section files
    - Nitrogen/N2_LXCat.txt
    - Nitrogen/N2_vib_LXCat.txt
%     - Nitrogen/N2_rot_LXCat.txt
    - Nitrogen/N_LXCat.txt
    - Hydrogen/H2_LXCat.txt
    - Hydrogen/H2_vib_LXCat.txt
%    - Hydrogen/H2_EV_LXCat.txt
%    - Hydrogen/H2_rot_LXCat.txt
    - Hydrogen/H_LXCat.txt
    - Ammonia/NH3_LXCat.txt
  LXCatFilesExtra:                      % extra cross section files
    - Nitrogen/N2_LXCat_extra.txt
    - Nitrogen/N_LXCat_extra.txt
    - Hydrogen/H2_LXCat_extra.txt 
    - Hydrogen/H_LXCat_extra.txt
    - Ammonia/NH3_LXCat_extra.txt
%   effectiveCrossSectionPopulations:     % see doc
%     - Nitrogen/N2_effectivePop.txt
%   CARgases:                             % gases for which CAR is activated
%     - N2
  gasProperties:                        % properties of the gases (S.I. Units)
    mass: Databases/masses.txt
    fraction:
      - N2 = 0.99
      - N = 0
      - H2 = 0.0095
      - H = 0.0005
      - NH3 = 0.0
    harmonicFrequency: Databases/harmonicFrequencies.txt
    anharmonicFrequency: Databases/anharmonicFrequencies.txt
    rotationalConstant: Databases/rotationalConstants.txt
    electricQuadrupoleMoment: Databases/quadrupoleMoment.txt
    OPBParameter: Databases/OPBParameter.txt
  stateProperties:                      % properties of the states (S.I. Units except for the energy [eV])
    energy:
      - N2(X,v=*) = morseOscillatorEnergy
%       - N2(X,v=0,J=*) = rigidRotorEnergy  
      - H2(X,v=*) = morseOscillatorEnergy
%      - H2(X,v=0,J=*) = rigidRotorEnergy
    statisticalWeight:
%       - N2(X) = 1.0
      - N2(X,v=*) = 1.0
%       - N2(X,v=0,J=*) = rotationalDegeneracy_N2
      - N2(A3Su+) = 3.0
      - N2(B3Pg) = 6.0
      - N2(C3Pu) = 6.0
      - N2(w1Du) = 1.0 
      - N2(a1Pg) = 1.0
      - N2(a'1Su-) = 1.0
      - N2(+,X) = 2.0
      - N2(+,B2Su+) = 2.0
      - N(4S) = 4.0
      - N(2D) = 10.0
      - N(2P) = 6.0
      - H2(X,v=*) = 1
%      - H2(X,v=0,J=*) = rotationalDegeneracy_H2
      - H(1S) = 1.0
      - H(2S) = 3.0
      - H(2P) = 3.0
      - H(3) = 9.0
      - H(4) = 16.0
      - H(5) = 25.0
      - NH3(X) = 1
    population:
      - N2(X) = 1.0
      - Nitrogen/N2_vibpop.txt
%       - N2(X,v=0,J=*) = boltzmannPopulation@gasTemperature
      - N(4S) = 1.0
      - H2(X) = 1.0
      - Hydrogen/H2_vibpop.txt
%      - H2(X,v=0,J=*) = boltzmannPopulation@gasTemperature
      - H(1S) = 1.0
      - NH3(X) = 1.0
  numerics:                             % configuration of numerical details of the simulation
    energyGrid:                         % properties of the energy grid (in eV)
      maxEnergy: 50                     % (use 18-20 for time-dependent simulations)
      cellNumber: 2000                  % (use 1800-2000 for time-dependent simulations)
      smartGrid:                        % configuration of the smart grid
        minEedfDecay: 7                 % minimum number of decade-fall for the EEDF
        maxEedfDecay: 10                % maximum number of decade-fall for the EEDF
        updateFactor: 0.05              % factor used to increase or decrease the maximum value of the energy grid
    maxPowerBalanceRelError: 1e-9       % threshold for the relative power balance warning message (use at least 100 for time dependent simulations)
    nonLinearRoutines:
      algorithm: mixingDirectSolutions  % mixingDirectSolutions or temporalIntegration
      mixingParameter: 0.7              % mixingDirectSolutions mixing parameter from 0 to 1
      maxEedfRelError: 1e-9             % maximum rel. variation for EEDF between two iterations (stop criterion)
%       odeSetParameters:                 % optional parameters for the ode solver of the "temporalIntegration" algorithm             
%         AbsTol: 1e-300
%         RelTol: 1e-6
%         MaxStep: 1e-7

% --- configuration of the heavy-species for the kinetic scheme ---
chemistry:
  isOn: true
  caseDefinition: dischargeCurrent      % electronDensity or dischargeCurrent or dischargePower  
  thermalModel:
    isOn: false                         % true or false (to activate or deactivate the thermal model)
    boundary: wall                      % wall or external (location of the model boundary condition)
    wallFraction: 1                     % fraction of energy released at the wall that returns to the gas/plasma volume (check fw parameter in the documentation)
    intConvCoeff: 120/1.6021766208e-19  % in eV s-1 m-2 K-1 (internal convection coefficient of the cylindrical wall)
    extConvCoeff: 15/1.6021766208e-19   % in eV s-1 m-2 K-1 (external convection coefficient of the cylindrical wall)
    useJouleHeating: false
  chemFiles:
    - Nitrogen_Hydrogen/N2H2_CS18a.chem
  checkChemFilesStoichiometry: false    % true or false (to activate or deactivate stoichiometry check in chem files)        
  gasProperties:                        % inherited from the configuration of the electron kinetics
    mass: Databases/masses.txt
    lennardJonesDistance: Databases/lennardJonesDistance.txt
    lennardJonesDepth: Databases/lennardJonesDepth.txt
    inFlowFraction:
      - N2 = 0.99
      - H2 = 0.01
    fraction:
      - N2 = 0.99
      - H2 = 0.0095
      - H  = 0.0005
      - wall_F = 0.998
      - wall_S = 0.000
      - wall_H = 0.001
      - wall_N = 0.0005
      - wall_NH = 0.0005
      - wall_NH2 = 0.0
  stateProperties:
    energy:
      - N2(X,v=\*) = morseOscillatorEnergy
      - H2(X,v=\*) = morseOscillatorEnergy
    statisticalWeight:
      - N2(X,v=\*) = 1.0
      - H2(X,v=\*) = 1.0
    population:
      - H2(X) = 1.0
      - H(1S) = 1.0
      - N2(X) = 1.0
      - N(4S) = 1.0
      - wall_F(v) = 1.0
      - wall_S(v) = 1.0
      - wall_H(S) = 1.0
      - wall_N(S) = 1.0
      - wall_NH(S) = 1.0
      - wall_NH2(S) = 1.0
    inFlowPopulation:  
      - N2(X) = 1
      - N2(X,v=0) = 1    
      - H2(X) = 1
      - H2(X,v=0) = 1    
    reducedDiffCoeff:
      - N2(A3Su+) = generalizedTemperatureDependentCoeff@1.9e21/sqrt(300),gasTemperature,0.5    
      - N2(B3Pg) = generalizedTemperatureDependentCoeff@1.9e21/sqrt(300),gasTemperature,0.5
      - N2(C3Pu) = generalizedTemperatureDependentCoeff@1.9e21/sqrt(300),gasTemperature,0.5
      - N2(a1Pg) = generalizedTemperatureDependentCoeff@1.9e21/sqrt(300),gasTemperature,0.5
      - N2(a'1Su-) = generalizedTemperatureDependentCoeff@1.9e21/sqrt(300),gasTemperature,0.5
      - N2(w1Du) = generalizedTemperatureDependentCoeff@1.9e21/sqrt(300),gasTemperature,0.5
      - N2(+,X) = generalizedTemperatureDependentCoeff@1.7e20/sqrt(273),gasTemperature,0.5
      - N2(+,B2Su+) = generalizedTemperatureDependentCoeff@1.7e20/sqrt(273),gasTemperature,0.5
      - N3(+,X) = generalizedTemperatureDependentCoeff@1.7e20/sqrt(273),gasTemperature,0.5
      - N4(+,X) = generalizedTemperatureDependentCoeff@1.7e20/sqrt(273),gasTemperature,0.5
      - N(+,gnd) = generalizedTemperatureDependentCoeff@1.7e20/sqrt(273),gasTemperature,0.5
      - H(1S) = generalizedTemperatureDependentCoeff@3.8e21/sqrt(300),gasTemperature,0.5  
      - NH3(X) = generalizedTemperatureDependentCoeff@8.6e20/sqrt(300),gasTemperature,0.5
      - NH2(X) = generalizedTemperatureDependentCoeff@1.25e21/sqrt(300),gasTemperature,0.5  
      - NH(X) = generalizedTemperatureDependentCoeff@1.25e21/sqrt(300),gasTemperature,0.5  
      - H2(X,v=*) = generalizedTemperatureDependentCoeff@1.9e21/sqrt(300),gasTemperature,0.5  
      - NH4(+,X) = generalizedTemperatureDependentCoeff@1.58e20/sqrt(293),gasTemperature,0.5
      - N2H(+,X) = generalizedTemperatureDependentCoeff@1.33e20/sqrt(293),gasTemperature,0.5  
      - NH3(+,X) = generalizedTemperatureDependentCoeff@1.64e20/sqrt(293),gasTemperature,0.5  
      - NH2(+,X) = generalizedTemperatureDependentCoeff@1.71e20/sqrt(293),gasTemperature,0.5  
      - NH(+,X) = generalizedTemperatureDependentCoeff@1.77e20/sqrt(293),gasTemperature,0.5 
      - H3(+,X) = generalizedTemperatureDependentCoeff@7.15e20/sqrt(300),gasTemperature,0.5   
      - H2(+,X) = generalizedTemperatureDependentCoeff@8.1e20/sqrt(300),gasTemperature,0.5
      - H(+,gnd) = generalizedTemperatureDependentCoeff@10.1e20/sqrt(300),gasTemperature,0.5
    reducedMobility:
      - N2(+,X) = 1.87e-4*101325/(273*1.38064852e-23)       
      - N2(+,B2Su+) = 1.87e-4*101325/(273*1.38064852e-23)
      - N3(+,X) = 1.87e-4*101325/(273*1.38064852e-23)
      - N4(+,X) = 2.33e-4*101325/(273*1.38064852e-23)
      - N(+,gnd) = 1.87e-4*101325/(273*1.38064852e-23) 
      - NH4(+,X) = 2.5e-4*101324.72/(293*1.38064852e-23)   
      - N2H(+,X) = 2.1e-4*101324.72/(293*1.38064852e-23)
      - NH3(+,X) = 2.6e-4*101324.72/(293*1.38064852e-23)
      - NH2(+,X) = 2.7e-4*101324.72/(293*1.38064852e-23)
      - NH(+,X) = 2.8e-4*101324.72/(293*1.38064852e-23)
      - H3(+,X) = 1.13e-3*101324.72/(300*1.38064852e-23)  
      - H2(+,X) = 1.28e-3*101324.72/(300*1.38064852e-23)
      - H(+,gnd) = 1.6e-3*101324.72/(300*1.38064852e-23)
    % flowBarrier:         % flow barrier (factor between 0-1; by default is set = 1) 
    %   - N2(A3Su+) = 0.05
    %   - H2(X,v=0) = 0.1           
  iterationSchemes:                      % set any MaxIterations = 1 to eliminate the corresponding cycle
    % pressureRelError: 1e-3               
    pressureMaxIterations: 1             % set to 1 (to eliminate the pressure cycle) for 'ensureIsobaric' flow model
    % neutralityRelError: 1e-3
    neutralityMaxIterations: 500
    % globalRelError: 1e-3
    globalMaxIterations: 100
  timeIntegrationConf:
    odeSolver: ode15s                 
    steadyStateTime: 10
    postDischargeTime: 0
    odeSetParameters:                   % optional parameters that can be sent to the odeSolver
      RelTol: 5e-4 
      MaxStep: 0.1
      % AbsTol: 1e-10

% --- configuration of the graphical user interface ---
gui: 
  isOn: false
  refreshFrequency: 1

% ---  configuration of the output files ---
output: 
  isOn: true
  dataFormat: hdf5+txt % txt or hdf5 or hdf5+txt
  folder: CS18a_P665_I20_Q7.4_H1
  dataSets:
    - inputs
    - log
    - eedf
    - swarmParameters
    - rateCoefficients
    - powerBalance
%     - lookUpTable
    - finalDensities
    - finalTemperatures
    - finalParticleBalance
%     - finalThermalBalance
    - chemSolutionTime
    - chemParameters
  ```
]]