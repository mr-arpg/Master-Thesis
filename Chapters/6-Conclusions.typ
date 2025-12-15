= Conclusions and Future Work

This thesis addresses fundamental challenges in modeling nitrogen-hydrogen ($N_2-H_2$) plasma chemistry for sustainable ammonia synthesis, a critical alternative to the energy-intensive Haber-Bosch process. Conducted within the framework of the Plasma-Surface Interaction (Data and Tools) COupled Modeling (PSI.COM) project, through collaboration between Instituto Superior Técnico (IST, Lisbon) and Laboratoire de Physique des Plasmas at École Polytechnique (LPP, Paris), this work integrates experimental characterization, computational modeling, and software development to advance our understanding of plasma-assisted chemical catalysis.

Experimental campaigns at LPP, under non-catalytic conditions (using $S i O_2$ surfaces), revealed peak ammonia production at approximately 70% hydrogen composition with counter-intuitive inverse pressure dependence, fundamentally demonstrating the non-equilibrium nature of plasma chemistry. Thermal measurements revealed extended equilibration periods justifying ±50 K uncertainty bands in modeling.

Model validation against multiple experimental datasets successfully reproduced discharge characteristics, capturing non-monotonic electric field behavior with hydrogen percentage, related with modifications in the ionic composition. The remarkable five-fold enhancement in atomic nitrogen concentration upon adding 1-2% hydrogen to pure nitrogen plasmas was accurately captured through multi-component diffusion and corrected nitrogen metastable quenching mechanisms. Critical insights emerged regarding experimental flow conditions, where accounting for realistic residence times (5-40 ms) resolved factor-of-three discrepancies in ammonia concentrations between steady-state simulations and measurements.

Computational advances included variable energy grid implementation achieving 80% reduction in grid points (200 vs 1000 uniform), while introducing errors below 1.5% in the electron mean energy through geometric progression discretization grid. A comprehensive graphical user interface (GUI) democratizes LoKI-B access through hierarchical parameter organization, real-time validation, and integrated execution capabilities. Exploratory machine learning frameworks using Petri net representations established foundations for automated chemistry reduction, identifying technical challenges in matrix degeneracy and constraint enforcement while demonstrating potential for reaction count reduction.


== Publications and Dissemination

Results from this work have been disseminated through the following channels:

*Conference presentations*:

- S Baghel, P Pereira, A Gonçalves, M Budde, J P Booth, O Guaitella, L Marques, N Pinhão, C D Pintassilgo and L L Alves. "Plasma-surface coupled modelling of $N_2-H_2$ DC discharges for ammonia production" (poster contribution). _78th Annual Gaseous Electronics Conference (GEC)_, Seoul, October 2025.

- P Pereira, A Tejero-del-Caz, A Gonçalves, N Pinhão, J van Dijk, D Boer and L L Alves. "The LisbOn KInetics LoKI-B+C simulation tool" (poster contribution). _78th Annual Gaseous Electronics Conference (GEC)_, Seoul, October 2025.

- C D Pintassilgo, S S Baghel, M Budde, A Gonçalves, O Guaitella, L Marques, P Pereira, N Pinhão and L L Alves. "Modeling $N_2-H_2$ for ammonia production" (poster contribution). _5th Plasma Thin Film International Union Meeting (PLATHINIUM)_, Antibes, September 2025.

- L L Alves, P Pereira, S Baghel, A Gonçalves, M Budde, J P Booth, O Guaitella, N Pinhão, C D Pintassilgo and L Marques. "Modeling of $N_2-H_2$ DC discharges for ammonia production" (poster). _36th International Conference on Phenomena in Ionized Gases (ICPIG)_, Aix-en-Provence, July 2025.

- P Pereira, A Tejero-del-Caz, A Gonçalves, N Pinhão, J van Dijk, D Boer and L L Alves. "Progress report on the LoKI-B+C simulation tool" (poster). _36th International Conference on Phenomena in Ionized Gases (ICPIG)_, Aix-en-Provence, July 2025.

*Workshop presentations*:

- D Ferreira, P Pereira, A Lança, A Gonçalves, L L Alves. "ML-Assisted Plasma Kinetics Reduction in $N_2-H_2$ Discharges." _IST-PhysFront'25 Symposium_, 2025.

*Open-source software*:

- LoKI-B input GUI and variable energy grid implementation: #link("https://github.com/mr-arpg/LoKI-B")[https://github.com/mr-arpg/LoKI-B]
- Plasma network ML analysis tools: #link("https://github.com/mr-arpg/PlasmaNetwork")[https://github.com/mr-arpg/PlasmaNetwork]


== Future Research Directions and Final Remarks

The factor-of-three underestimation of ammonia concentration indicates systematic inaccuracies in surface kinetic parameters, particularly desorption frequencies and activation energies. Temperature-programmed desorption studies can directly measure binding energies for nitrogen and hydrogen species on various materials, while molecular beam scattering experiments can provide gas-surface interaction cross-sections. These measurements would enable parametric refinement through inverse modeling, systematically varying surface rate coefficients to minimize deviations between simulations and experimental yields. The coupling between gas heating and plasma chemistry necessitates simultaneous characterization of wall temperature evolution and species production through in-situ infrared thermography combined with time-resolved optical emission spectroscopy.

Critical improvements in FTIR diagnostics are essential for reliable quantification of ammonia concentration. Independent calibration with known $N H_3$ concentrations should be performed to validate absolute density measurements. The $"CaF"_2$ window cutoff at approximately 1000 $"cm"^(-1)$ compromises measurements of the umbrella mode (950-1200 $"cm"^(-1)$), which is the most intense ammonia absorption feature; alternative window materials with extended transmission ranges are necessary. Baseline warping from thermal drift between background and data acquisition must be addressed through rapid measurement protocols or active temperature stabilization to maintain thermal consistency throughout the spectral acquisition sequence.

Extension to full time-dependent Boltzmann-Chemistry kinetic models addresses the homogeneity assumption inherent in zero-dimensional approaches. Extending LoKI-B+C to one-dimensional or two-dimensional geometries requires coupling Boltzmann solutions with spatial transport calculations and self-consistent electric field determination via Poisson's equation. Activating a thermal model in the LoKI-B+C framework adopted in this work will provide valuable information about the influence of plasma-surface interaction on gas heating. The variable grid's efficiency becomes crucial as spatially-resolved simulations demand repeated Boltzmann solutions across spatial domains, potentially requiring parallelization strategies distributing spatial zones across processors.

Instead of extending to other systems, focus should be on extending/validating the current chemical kinetic model of $N_2-H_2$ to/under catalytic conditions, adopting different levels of heterogeneous catalysis. Atmospheric-pressure regimes offer process intensification opportunities, though three-body processes and rapid quenching dynamics necessitate pressure-dependent collision operators and robust stiff ODE solvers.

Completing variable grid implementation for discrete inelastic collision operators requires careful energy-threshold treatment for electron-impact cross sections, and detailed energy-balance conservation. Generalizing to user-defined grids (hyperbolic tangent profiles, multi-region progressions) enables physics-specific optimization. Extending the input GUI to LoKI-C will make the framework more accessible to handle also complex chemistry calculations. Machine learning framework improvements include Karush-Kuhn-Tucker constrained optimization replacing sequential ReLU-softmax application, dual-matrix representations resolving chemical-reaction degeneracy issues, and data assimilation incorporating rate coefficient uncertainties through Bayesian frameworks. These improvements are key to enable chemistry reduction based on Petri network representation.
#v(1cm)

Plasma-assisted ammonia synthesis represents a promising pathway toward sustainable, decentralized chemical production powered by renewable electricity. This thesis advances the field through validated computational tools, curated kinetic databases, and physical insights into coupled volume-surface chemistry. The counter-intuitive inverse pressure dependence and the dichotomy of the plasma volume as both radical source and product sink fundamentally challenge conventional thermodynamic intuition, opening new process design considerations beyond equilibrium-based optimization.

Significant challenges remain before industrial competitiveness with Haber-Bosch. Current energy efficiencies require improvement by factors of 5-10, demanding deeper understanding of surface mechanisms, reactor optimization, and catalytic materials enhancing selective formation while mitigating dissociation losses. The tools, methods, and datasets developed here provide the foundation for these advances. By making the LoKI-B+C framework more accessible, computationally efficient, and experimentally validated, this work enables accelerated progress toward sustainable synthesis and broader integration of plasma chemistry in green manufacturing.

The plasma way to ammonia is scientifically fascinating and technologically promising. With continued innovation and collaborative effort, plasma-assisted synthesis may yet transform into industrial reality.
