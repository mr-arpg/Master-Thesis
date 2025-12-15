
#import "@preview/accelerated-jacow:0.1.4": jacow, jacow-table
#set page(numbering: "1")
#show figure: set block(breakable: true)


#show: jacow.with(
  // Paper title
  title: [
    The Plasma Way to Ammonia
  ],
  // Author list
  authors: (),
  /*authors: (
    (name: "Armando Gonçalve", at: "uni", email: "mail@example.com"),
    //(names: ("A. Group", "O. F. People"), at: "Single Use Primary Affiliation, Shortcut Way"),
  ),
  affiliations: (
    uni: "",
    INP: "Lisboa, Portugal",
    third: [The Third Institute, City, Country],
  ),*/
  // Funding note (optional, comment out if not applicable)
  //funding: "Work supported by Fundação para a Ciência e a Tecnologia (FCT) under grant 2022.04128.PTDC",
  // Paper abstract
  /*abstract: [
    This document demonstrates the usage of the accelerated-jacow paper template to compose papers for JACoW conference proceedings.
  ],*/
  // Writing utilities
  //draft-note: [*Draft 1* \u{2503} #datetime.today().display()],
  //page-limit: 3,
  //show-line-numbers: true,
  //show-grid: true,
)


// Other useful packages, see below for usage examples
#import "@preview/unify:0.7.1": unit, num, qty, numrange, qtyrange
#import "@preview/glossy:0.7.0": init-glossary
#import "@preview/lilaq:0.1.0" as lq
#import "@preview/physica:0.9.5": *

#place(
  top+center,
  float:true,
  scope: "parent",
  text(10pt)[
    #v(-.3cm)
    Armando Gonçalves$""^1$ \
    #text(8pt)[$""^1$armandogoncalves\@tecnico.ulisboa.pt] \
    #v(.1cm)
    *Instituto Superior Técnico, Lisboa, Portugal* \
    #v(.1cm)
    October 2025
  ],
)  
#place(
  top+center,
  float:true,
  scope: "parent",
  text(10pt, weight: "bold")[
    Abstract
  ],
)  
#place(
  top+center,
  float:true,
  scope: "parent",
  text(7pt)[
    This thesis addresses the fundamental challenges of modeling $N_2-H_2$ plasma chemistry for sustainable ammonia synthesis, a critical alternative to the energy-intensive Haber-Bosch process. Conducted within the framework of the Plasma-Surface Interaction (Data and Tools) COupled Modeling (PSI.COM) project, through collaboration between Instituto Superior Técnico (IST, Lisbon) and Laboratoire de Physique des Plasmas at École Polytechnique (LPP, Paris), this work integrates experimental characterization, computational modeling, and software development to advance our understanding of plasma-assisted chemical catalysis.
Experimental campaigns at LPP, under non-catalytic conditions (using $S i O_2$ surfaces), revealed peak ammonia production at approximately $70\%$ hydrogen composition with counter-intuitive inverse pressure dependence, fundamentally demonstrating the non-equilibrium nature of plasma chemistry. Thermal measurements revealed extended equilibration periods justifying ±50 K uncertainty bands in modeling. A comprehensive kinetic database was systematically developed through critical literature review, revealing order-of-magnitude discrepancies in rate coefficients from multiple authoritative sources and necessitating treatment of chemical schemes as variables rather than fixed inputs. The final scheme encompasses over 100 species. Electron-impact cross-section validation against experimental swarm parameters achieved excellent agreement (< 20%) across electron characteristic energy, drift velocity, and reduced Townsend coefficients for reduced electric fields in the range $10^(-4)$ – 100 Td. Model validation against multiple experimental datasets successfully reproduced discharge characteristics, capturing non-monotonic electric field behavior with hydrogen percentage, related with modifications in the ionic composition. The remarkable five-fold enhancement in atomic nitrogen concentration upon adding 1-2% hydrogen to pure nitrogen plasmas was accurately captured through multi-component diffusion and corrected nitrogen metastable quenching mechanisms. Critical insights emerged regarding experimental flow conditions, where accounting for realistic residence times (5-40 ms) resolved factor-of-three discrepancies in ammonia concentrations between steady-state simulations and measurements. Computational advances included variable energy grid implementation achieving 80% reduction in grid points (200 vs 1000 uniform), while introducing errors below 1.5% in the electron mean energy through geometric progression discretization grid. A comprehensive graphical user interface (GUI) democratizes LoKI-B access through hierarchical parameter organization, real-time validation, and integrated execution capabilities. Exploratory machine learning frameworks using Petri net representations established foundations for automated chemistry reduction, identifying technical challenges in matrix degeneracy and constraint enforcement while demonstrating potential for reaction count reduction.
  ],
) 
#place(
  top+left,
  float:true,
  scope: "parent",
  text(9pt)[
    *Keywords*: Low-temperature plasmas; ammonia synthesis; plasma diagnostics; $N_2-H_2$ chemistry modelling; LoKI; surface reactions.
  ],
)
#set heading(numbering: "1.1.")

= Introduction <sec:intro>

Ammonia stands as the second most synthesized chemical globally, with annual production reaching 180 million tonnes @patel_2023@USGS2022Nitrogen. This molecule serves fundamental roles across multiple sectors: agriculture depends on ammonia-based fertilizers to sustain approximately half of the world's population @erisman; industrial refrigeration relies on ammonia as one of the most efficient coolants @pearson_2007; chemical manufacturing uses ammonia as a building block for plastics, synthetic fibers, and pharmaceuticals @weissermel2003; and emerging energy systems propose ammonia as both a hydrogen carrier and a direct zero-carbon fuel @zhai_liu_xiang_2023. The economic significance is substantial, with the global ammonia market valued at approximately 170 billion dollars in 2024 @towards2025ammonia and projected to exceed 300 billion dollars by 2030 @grandview2024ammonia.

The dominant production method remains the Haber-Bosch process @connor_2014, developed in the early 20th century. This industrial procedure synthesizes ammonia from nitrogen and hydrogen under extreme conditions: pressures of 50-200 bar and temperatures of 400-500°C in the presence of iron-based catalysts @aleksandra_2014. While the Haber-Bosch process enabled the agricultural revolution that supported population growth from 1.6 billion to over 8 billion people, it carries enormous energy and environmental costs. The process accounts for 1-2% of global energy consumption @irena2022ammonia@tunå_hulteberg_ahlgren_2013 and 1.3-1.8% of anthropogenic carbon dioxide emissions. The Haber-Bosch process demands extreme pressures and temperatures, consuming approximately 30-40 MJ per kilogram of ammonia produced @worrell_blok_1994@tunå_hulteberg_ahlgren_2013@irena2022ammonia, with this energy predominantly deriving from fossil fuels @tunå_hulteberg_ahlgren_2013.

Low-temperature plasma technology offers an alternative pathway for ammonia synthesis that operates at significantly lower temperatures and pressures while enabling the use of renewable energy sources. A plasma is an ionized gas containing electrons, ions, and neutral species exhibiting collective electromagnetic behavior @Loureiro2016. In non-equilibrium or "cold" plasmas, electrons acquire high kinetic energies (1-10 eV, equivalent to 11,600-116,000 K) through electric field acceleration, while heavy species remain near ambient temperature (300-1000 K). This profound non-equilibrium enables selective chemistry: energetic electrons efficiently break strong chemical bonds (e.g., N≡N bond energy 9.8 eV) and create reactive radicals without bulk heating @Loureiro2016, potentially reducing the energy demands associated with conventional thermocatalytic methods.

Order-of-magnitude analysis reveals the energetic potential of plasma synthesis. Under low-pressure conditions (130 Pa), typical plasma discharges require approximately 113 MJ/kg of ammonia produced—roughly 3-4 times higher than Haber-Bosch. However, scaling to atmospheric pressure could theoretically reduce this to ~160 kJ/kg, representing a potential energetic advantage. Critical challenges temper this optimism: current experimental yields typically achieve less than 1% conversion per pass, electron kinetics become less efficient at higher pressures as collisional losses dominate, and the per-molecule energy (~20 eV) must be selectively channeled into productive chemistry rather than dissipated unproductively. Realizing practical energy competitiveness depends critically on optimizing conversion yields, understanding pressure-dependent electron kinetics, and engineering effective plasma-surface interactions.



This thesis was conducted within the Plasma-Surface Interaction (Data and Tools) COupled Modeling (PSI.COM) project @psi2022project, a collaboration between the N-PRiME group at Instituto de Plasmas e Fusão Nuclear, Instituto Superior Técnico (IST) in Lisbon and the Laboratoire de Physique des Plasmas (LPP) at École Polytechnique in Paris. The project focuses on advancing the understanding and modelling of plasma-surface chemistry in nitrogen-hydrogen mixtures, with objectives encompassing experimental characterization, computational modelling of coupled electron kinetics and heavy-species chemistry, and the development of computational tools for plasma simulation. Key tasks include enhancing the LisbOn KInetics (LoKI) tool suite @loki and contributing to the development of an open-access data-storage library in collaboration with LXCat @lxcat.

The organization of this paper is as follows. Section 2 lays the theoretical foundation of the work; section 3 details the experimental setup at LPP, the diagnostic techniques employed, and the data acquisition protocols used to characterize the $N_2-H_2$ plasma discharges; section 4 is dedicated to the construction and validation of surface and volume kinetic models; section 5 documents the tool development executed during this work: the implementation of the continuous operators of the Electron Boltzmann Equation (EBE) on a variable energy grid and the development of a Graphical User Interface (GUI) for the input of the numerical solver; finally, section 6 presents the conclusions of the work.

= Theoretical Framework and Modelling Approach

The electron Boltzmann equation (EBE) provides the foundation for describing electron kinetics in low-temperature plasmas @Loureiro2016. The general form accounts for temporal evolution, spatial transport, field acceleration, and collisional processes:

$ (partial f)/(partial t) + arrow(v) dot nabla_r f + arrow(F)/m dot nabla_v f = ((partial f)/(partial t))_"coll" $

where $f(arrow(r), arrow(v), t)$ represents the electron distribution function in phase space. The collision integral encapsulates electron-neutral, electron-ion, and electron-electron interactions. Under the two-term approximation @hagelaar2005solving, valid when anisotropies remain small, and for a steady-state and spatially homogeneous plasma, this reduces to a tractable system of equations in energy space:

$ 
frac(1, N) sqrt(frac(m_e, 2e)) frac(d G(u), d u) = S(u) \

f_1(u) = - frac(E \/ N, sigma_c (u)) frac(d f_0(u), d u) 
$

where $f_0$ is the isotropic electron energy distribution function (EEDF), $f_1$ is the first-order anisotropic perturbation, $N$ is the neutral gas density, $G$ is the total upflux function that contains power gain/loss contributions from the applied electric field and elastic collisions, $S$ is the discrete collision operator that contains power loss/gain contributions due to inelastic/superelastic mechanisms, and $sigma_c$ is the electron-neutral total momentum-transfer cross section.

The heavy-species chemistry temporal evolution follows rate balance equations incorporating chemical processes, transport mechanisms, and gas flow. Chemical production and destruction terms involve electron-impact reactions with rate coefficients calculated by integrating cross sections over the EEDF, and heavy-species reactions with Arrhenius-form temperature-dependent rates. The synthesis of ammonia results from interconnected gas-phase and surface reaction networks, with ammonia formation occurring predominantly on reactor surfaces through Eley-Rideal and Langmuir-Hinshelwood mechanisms, while the plasma volume simultaneously destroys ammonia through electron-impact dissociation.

To achieve self-consistent plasma solutions, electron kinetics and heavy-species chemistry must be coupled through iterative cycles, as the EEDF influences electron-impact rates while being influenced by gas composition @guerra_tejero-del-caz_pintassilgo_alves_2019. The LoKI-B Boltzmann solver @loki determines electron transport parameters and rate coefficients, while LoKI-C @loki_manual handles heavy-species density evolution until convergence. 

= Experimental Characterization

An experimental campaign was conducted at the LPP to characterize nitrogen-hydrogen plasmas and validate kinetic models. The primary experimental configuration employed direct current glow discharge in a cylindrical Pyrex tube with length 0.54 m and radius 0.01 m. Discharge currents ranged from 20 to 40 mA at pressures between 133 and 665 Pa. Hydrogen content in nitrogen-hydrogen mixtures varied from 0% to 93%. Gas flow rates were controlled using mass flow controllers with appropriate conversion factors accounting for thermal conductivity differences between gases.

#figure(
    
    image("../Dissertação/Images/dc/nh3_665Pa.png", width: 100%),
    caption: [$N H_3$ concentrations in function of $H_2$% for a discharge current of 40 mA at 665 Pa.]
)<nh3_665Pa>

The experimental protocol involved systematic measurement of wall temperature, gas temperature, and ammonia concentration under various operating conditions. Wall temperature was monitored continuously using optical fiber probes with thermosensitive crystals, revealing thermal transients extending over several hours. Gas temperature was determined from optical emission spectroscopy by fitting simulated nitrogen second positive system spectra to measured spectra, extracting rotational temperatures that approximate kinetic gas temperature under low-pressure conditions. Ammonia concentration was measured using Fourier-transform infrared spectroscopy, with transmittance spectra fitted using molecular absorption models based on spectroscopic databases. @nh3_665Pa shows measurements of ammonia concentration as a function of hydrogen percentage, for a discharge current of 40 mA at 665 Pa.

Thermal equilibration emerged as a critical factor affecting measurement accuracy and reproducibility. For discharge conditions at 40 mA current, 665 Pa pressure, and 70% hydrogen content, wall temperature continued evolving from 146°C at 35 minutes to 161°C after three hours, representing approximately 10% change after apparent thermal stabilization. These substantial temperature variations motivated adoption of 50 K uncertainty bands in subsequent kinetic modeling. The long thermal time constants observed also explained discrepancies between measurements taken at different waiting times, with measurements in this work generally yielding higher temperatures than previous measurements due to longer equilibration periods.

Ammonia concentration measurements revealed composition-dependent production trends. For 40 mA discharge current, ammonia production increased with hydrogen percentage, reaching maximum concentrations near 70% hydrogen content (see @nh3_665Pa). Beyond optimal composition, ammonia production declined at higher hydrogen fractions. The pressure dependence proved counterintuitive compared to the Haber-Bosch process: higher pressure yielded lower ammonia concentrations under equivalent conditions, underscoring the fundamentally non-equilibrium nature of plasma chemistry.


= Model Development and Validation

Development of the chemical kinetic model required compilation of comprehensive reaction databases encompassing volume and surface processes. The foundation was established from the chemical scheme of Redondo et al. @chatain_2020 complemented with the mesoscopic surface model of Gordiets et al. @gordiets_1998, subsequently updated with information from Capitelli et al. @capitelli_ferreira_gordiets_osipov_2019, the NIST Chemical Kinetics Database @NIST_Kinetics, and recent publications by Bang et al. @bang2023kinetic. Systematic literature review revealed order-of-magnitude discrepancies in rate coefficients from different sources, necessitating careful assessment and selection of values based on data quality, measurement methods, and consistency across sources.

The volume chemistry encompasses electron-impact processes including electronic excitation to multiple nitrogen and hydrogen excited states, vibrational excitation through electron-vibration, electronic-vibration, vibration-vibration, and vibration-translation processes, dissociation producing nitrogen and hydrogen atoms, and ionization creating various positive ions and electrons. Heavy-species reactions include neutral-neutral collisions between atoms, radicals, and molecules, ion-neutral charge transfer reactions, three-body recombination processes, and reactions involving electronically excited metastable species. The chemical scheme adopts state-to-state approach for vibrational levels of nitrogen and hydrogen, electronic states of atoms and molecules, and various ionic species.

The mesoscopic surface model treats the reactor wall as an active catalytic environment with physical vacant sites where gas-phase particles physisorb through weak van der Waals forces, and chemical vacant sites where particles chemisorb through strong chemical bonds. Gas-phase atoms and radicals formed in the plasma adsorb onto these sites, initiating surface chemistry. Adsorbed species undergo sequential hydrogenation reactions building nitrogen-hydrogen radicals on the surface. Ammonia formation occurs through Eley-Rideal mechanisms where gas-phase hydrogen atoms strike adsorbed radicals, Langmuir-Hinshelwood mechanisms where physisorbed species diffuse to react with chemisorbed species, and ion-wall recombination. Thermal desorption returns adsorbed species to the gas phase when sufficient thermal energy overcomes binding.

The chemical model was implemented in the LisbOn KInetics framework @loki through structured chemistry files specifying species, reactions, rate coefficients, and transport models. Cross section data was provided in standardized LXCat format files @lxcat containing energy-dependent collision cross sections for elastic momentum transfer, vibrational excitation, electronic excitation, ionization, and dissociative attachment. Cross section datasets from the IST-Lisbon database @alves_2014 were validated against swarm parameter measurements, with predictions typically agreeing within 20% for reduced electric fields ranging from $10^(-4)$ to 500 Townsend.

Model validation proceeded through systematic comparison of simulation results with experimental measurements, as a function of discharge current, pressure, and gas composition, for fundamental plasma parameters: the reduced electric field ($E\/N$, with $E$ the electric field and $N$ the gas density) and the concentrations of ground-state atoms ($N(""^4S)$ and $H(""^1S)$) and ammonia ($N H_3$). This validation employed the experimental results obtained in this work as well as those reported by other authors, e.g. Amorim et al. @amorim_1996 and Bockel et al. @bockel1996.

#figure(
  image("../Dissertação/Images/sims/Gordiets_FIG3_I.png", width: 83%),
  caption: [Reduced electric field ($E\/N$) as a function of $N R$, for a fixed current of 20 mA in pure hydrogen plasma. The points correspond to experimental measurements from Amorim _et al._ @amorim_1996 and the line is from simulation results.]
)<ENvsNR_H2>



For pure hydrogen discharges, the calculated discharge characteristics show excellent quantitative agreement with measurements from Amorim et al. @amorim_1996 across the entire range of conditions investigated as shown in @ENvsNR_H2. For nitrogen-hydrogen mixtures, the reduced electric field exhibited non-monotonic dependence on hydrogen percentages, as shown in @ENvsNR_H2_LPP, associated with evolution of ionic composition. At low hydrogen percentages, dominant ions are $N_4^+$ and $N_2^(+)$. At high hydrogen percentages, $H_3^+$ triatomic hydrogen ions dominate. At intermediate compositions, $N_2 H^+$ ions become dominant through charge-transfer reactions between $H_3^+$ and molecular nitrogen.

#figure(
  image("../Dissertação/Images/sims/LPP-#2_Q_10_field_H2_band_E_N.png", width: 100%),
  caption: [Reduced electric field ($E\/N$) as a function of hydrogen input percentage ($H_2$%), at fixed current of 30 mA, for two pressure conditions: 266 Pa (blue) and 665 Pa (orange). The points represent two different experimental datasets (a)-(b) from LPP, obtained in this work. Shaded bands represent simulation results obtained using the working conditions of these datasets.]
)<ENvsNR_H2_LPP>

#figure(
  image("../Dissertação/Images/sims/Gordiets_FIG4_II.png", width: 100%),
  caption: [Relative concentration of atomic hydrogen ([H], in a.u.) as a function of $H_2$ input percentage in the gas mixture, for the fixed current of 50 mA. The experimental measurements (points) and the simulation results (line) are for Amorim _et al._ @amorim_1996 (blue), Bockel et al. (orange) and (green) @bockel1996. The simulations are normalized to the relative measurements at 30% $H_2$, as indicated in the figure.]
)<HvsH2>

Atomic hydrogen concentration increases steadily with hydrogen input percentage, as presented in @HvsH2, with simulation results showing excellent agreement with multiple experimental datasets across the entire composition range. Note that Amorim _et al._ @amorim_1996 reports absolute values for the concentration of atomic hydrogen, which were normalized for the purpose of the graphical representation in @HvsH2. The results in this figure reveal that these absolute values are overestimated by about one order of magnitude with respect to simulations.

Simulations correctly predicted the existence of a peak for the concentration of ammonia as a function of hydrogen percentage, revealing also that the intensity and location of the peak is highly dependant on the gas flow conditions. When simulation times were adjusted to match experimental residence times (5-40 ms), based on the gas flow conditions, the simulations were able to reproduce the evolution trend of $[N H_3]$ vs $H_2 %$. For low flow conditions, corresponding to the measurements performed in this thesis, relative ammonia concentrations showed reasonable agreement with experiments when normalized at 70% hydrogen content as shown in @NH3vsH2_longTube. The model successfully predicted the shift of the ammonia peak toward higher hydrogen percentages without requiring modifications to the chemical scheme. Pressure dependence remained complex, with different experimental datasets showing opposite trends that fell within or near simulation uncertainty bands derived from working condition variations.

#figure(
  image("../Dissertação/Images/sims/nh3_longTube.jpg", width: 100%),
  caption: [Relative concentration of ammonia [$N H_3$] as a function of $H_2$ input percentage in the gas mixture, at a fixed current of 40 mA, for two pressure conditions: 199.5 Pa (purple) and 665 Pa (orange). The points represent two different experimental datasets from LPP, obtained in this work: squares (a) and circles (b). The shaded bands are limited by simulation results obtained using the working conditions of these datasets: solid lines (a) and dashed lines (b). Simulations are normalized to the experimental measurements at 70% $H_2$.]
)<NH3vsH2_longTube>

= Tool Development

Implementation of a variable energy grid in LoKI-B @hendrikx2025nonuniform represents a computational efficiency advancement for solving the EBE. Traditional implementations employ uniform energy grids with constant step size, proving inefficient for molecular gases where electron energy distribution functions vary by many orders of magnitude and cross sections exhibit complex structures with sharp features at low energies and smooth decay at high energies. The variable grid approach concentrates grid points where needed and reduces resolution elsewhere, optimizing both computational cost and accuracy.

The variable grid was constructed using geometric progression where consecutive energy steps grow according to a progression ratio $a$ greater than unity@Alves2025Lokijun:
#v(.3cm)
$ 
Delta u_(n+1) = a Delta u_n = a^n h, quad a > 1 
$ 
This yields fine resolution at low energies where collision cross sections are large and coarse resolution at high energies where the distribution function is small. The progression ratio is determined by solving the transcendental equation @eq-transcendent relating maximum energy $u_max$, minimum step size $h$, and number of grid points $N$ using Newton-Raphson iteration@Alves2025Lokijun. 
#v(.4cm)
$ 
F(a) = exp[(ln[u_max\/h (a-1) + 1])/(N)] - a = 0
$<eq-transcendent>
#v(.3cm)
Typical progression ratios range from 1.05 to 1.10, providing optimal balance between resolution and computational cost. 

Discretization adopts a finite-volume approach defining the EEDF at grid cells and first anisotropy and flux functions at grid nodes. Linear interpolation between cells and nodes employs weighted averages with weights depending on the progression ratio according to:
#v(.3cm)
$ 
w_n equiv (Delta u_n)/(Delta u_(n+1) + Delta u_n) = 1/(1 + a)" ." 
$
#v(.3cm)
The discretization scheme preserves fundamental conservation laws through appropriate operator construction. The continuous operators for electric field, elastic collisions, and continuous approximation for rotation (CAR) are discretized according to @Alves2025Lokijun, with flux boundary conditions $G(0) = G(u_max) = 0$ ensuring proper behavior at grid boundaries. The electron-electron collision operator matrix elements are defined to ensure energy conservation and yield Maxwellian distributions under collisional equilibrium @Alves2025Lokijun.

Benchmark tests validated the variable-step grid implementation through comparison with uniform energy grid solutions. For Maxwellian distributions with elastic collisions and electron-electron collisions, both implementations produced similar relative errors, confirming numerical equivalence, as shown in @maxwellian-comparison. Computational efficiency analysis demonstrated that variable grids achieve comparable accuracy with reduced point counts. @efficiency-analysis shows that the optimal configuration achieves 80% reduction in grid points (200 vs 1000 uniform) while introducing an error of $lt 1,5%$ in mean energy.
#figure(
  image("Images/benchmark/maxwellian_elastic_comparison.png", width: 100%),
  caption: [Comparison between variable and uniform grid implementations for Maxwellian distribution with elastic collisions, showing equivalent performance and confirming correct implementation.]
)<maxwellian-comparison>

#figure(
  image("Images/benchmark/efficiency_error_evolution.png", width: 80%),
  caption: [Relative errors between variable-step and uniform energy grids for mean energy (blue) and drift velocity (orange) as a function of the percentage of points of the uniform grid ($N = 1000$ points).]
)<efficiency-analysis>

A graphical user interface was developed to democratize LoKI-B access by eliminating manual input file configuration barriers. Implemented in MATLAB App Designer, the GUI organizes parameters into hierarchical sections (Working Conditions, Electron Kinetics, Gas Properties, State Properties, Numerics, Output) with dedicated tabs as shown in @gui-interface. The interface handles scalar and vector inputs through MATLAB expressions, provides real-time parameter validation with visual feedback, validates file paths, and enables integrated execution combining automatic input file generation with solver invocation and result visualization. This significantly reduces the learning curve for new users while maintaining full solver functionality.

#figure(
  image("Images/gui1.png", width: 100%),
  caption: [Graphical user interface for LoKI-B showing hierarchical parameter organization with working conditions tab.]
)<gui-interface>

= Machine Learning for Reaction Mechanism Analysis

Exploratory work developed a machine learning framework for automated mechanism reduction @ferreira2024machine@henriques2024mlplasma. The approach utilizes Petri net representation where species correspond to places, reactions to transitions, with stoichiometry encoded in an incidence matrix $A$ such that species evolution follows $y = A x + b$. Machine learning optimizes reaction weights $tilde(x)$ minimizing Kullback-Leibler divergence @kullback_leibler_1951 between predicted and reference species distributions. Physical constraints are enforced through ReLU (non-negativity) @nair2010rectified and softmax (normalization) @bridle_1990 functions, with optimization performed via Adam gradient descent @kingma2014adam.

Applied to argon plasma testbeds, the framework successfully identifies reaction importance rankings. However, implementation revealed critical challenges: matrix degeneracy renders physically distinct reactions mathematically indistinguishable when species appear on both sides, while sequential ReLU-softmax application introduces normalization inconsistencies. Future work requires Karush-Kuhn-Tucker constrained optimization @kuhn_1951@karush_2013 properly handling inequality constraints, dual-matrix representations resolving degeneracy, and data assimilation incorporating rate coefficient uncertainties. With these improvements, ML-based reduction could enable 50-80% reaction count reduction while maintaining accuracy for key observables.

= Conclusions

This work advances nitrogen-hydrogen plasma modeling through integrated experimental, computational, and methodological contributions. Experimental campaigns at LPP, under non-catalytic conditions (using $S i O_2$ surfaces), revealed peak ammonia production at approximately 70% hydrogen composition with counter-intuitive inverse pressure dependence, fundamentally demonstrating the non-equilibrium nature of plasma chemistry. Systematic literature review revealed order-of-magnitude discrepancies in rate coefficients from multiple authoritative sources, necessitating comprehensive kinetic database development. The validated model successfully reproduces discharge characteristics, capturing non-monotonic electric field behavior with hydrogen percentage, related with modifications in the ionic composition. The remarkable five-fold enhancement in atomic nitrogen concentration upon adding 1-2% hydrogen to pure nitrogen plasmas was accurately captured through multi-component diffusion and corrected nitrogen metastable quenching mechanisms. Critical insights emerged regarding experimental flow conditions, where accounting for realistic residence times (5-40 ms) resolved factor-of-three discrepancies in ammonia concentrations between steady-state simulations and measurements.

Computational advances included variable energy grid implementation achieving 80% reduction in grid points (200 vs 1000 uniform), while introducing errors below 1.5% in the electron mean energy through geometric progression discretization grid. A comprehensive graphical user interface (GUI) democratizes LoKI-B access through hierarchical parameter organization, real-time validation, and integrated execution capabilities. Exploratory machine learning frameworks using Petri net representations established foundations for automated chemistry reduction, identifying technical challenges in matrix degeneracy and constraint enforcement while demonstrating potential for reaction count reduction. Future priorities include: critical improvements in FTIR diagnostics (independent calibration with known $N H_3$ concentrations, alternative window materials to overcome $"CaF"_2$ cutoff at 1000 $"cm"^(-1)$, thermal drift mitigation); refining surface kinetics through temperature-programmed desorption studies; extending to spatially-resolved models; completing discrete operator implementation; and advancing ML frameworks with Karush-Kuhn-Tucker optimization.

#bibliography("refs.bib")