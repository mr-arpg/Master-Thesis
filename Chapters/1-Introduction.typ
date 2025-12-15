#import "@preview/thesist:1.0.2": flex-caption, subfigure-grid
#import "@preview/glossarium:0.5.6": gls, glspl


#show cite: it => {
  if it.supplement != none [
    #it.supplement
  ]
  it
}

= Introduction

== Context and Motivation

#v(1em)
_"You are what you eat"_. 
#v(0.001pt)
#linebreak()
Some of us consume meat, others set their limit to fish. Some choose the vegan path, while others embrace peculiar diets like the cabbage soup one @Cabbage_soup_diet. Yet, regardless of our culinary preferences, nearly all of our food — around 90% @owid-global-land-for-agriculture — comes from the same age-old origin: *agriculture*. Beyond the small contributions of wild seafood and hunting, human sustenance is overwhelmingly a product of managed agricultural systems @singh_singh_2024. 

These systems, however, were governed for millennia by an immutable bottleneck that no civilization could escape. The *natural nitrogen cycle*.

=== Why Ammonia? <why-ammonia>

All life requires nitrogen to build proteins, DNA, and other essential molecules @berg2019biochemistry. While nitrogen gas ($N_2$) comprises 78% of Earth's atmosphere, this molecular form is chemically inert and inaccessible to plants and animals @gruber_galloway_2008. The transformation of atmospheric nitrogen into biologically usable forms, primarily *ammonia* (*$N H_3$*), constitutes the critical bottleneck of the nitrogen cycle. This conversion, known as *nitrogen fixation*, occurs through limited natural pathways @halbleib_ludden_2000@hill_rinker_wilson_1980@strock_2008:

#v(-0.5cm)
#figure(
  image("../Images/nitrogen_pathways.jpg", width: 100%),
  caption: [Natural Nitrogen Conversion Processes]
)<nPaths>

Ammonia serves as the *gateway* molecule. Plants absorb nitrogen through their roots as ammonia, nitrites ($N O_2^-$), or nitrates ($N O_3^-$), forms derived from ammonia through bacterial *nitrification* @n_g_1983@ward2011Nitrification. Because natural nitrogen fixation was slow and finite, ammonia availability constrained agricultural productivity for millennia, necessitating crop rotation with nitrogen-fixing legumes and manure application @crop_rotation_2025. This constraint was eliminated by the *Haber-Bosch* process @connor_2014, synthesizing ammonia under extreme conditions (5–20 MPa, 673–773 K, iron catalyst @aleksandra_2014):

$
N_2 + 3H_2 #sym.arrows.rl 2N H_3
$
 
This breakthrough provided scalable nitrogen fertilizer, enabling population growth from 1,6 to 8 billion people, with synthetic fertilizers sustaining half the global population today @erisman. Currently the second most synthesized chemical globally (180 million tonnes in 2021 @patel_2023@USGS2022Nitrogen), ammonia finds extensive industrial applications: refrigeration (efficient coolant for food processing and cold storage @pearson_2007@pachai_hafner_ciconkov_2022), chemical synthesis (plastics @kahofer_1966, nylon @thomas_raja_2005, pharmaceuticals @weissermel2003@ostwald_2021), environmental control (water disinfection @sisler1954, nitrogen oxide pollution control @catalysts_2025@javed_irfan_gibbs_2006), and various industrial processes (metal processing @leaching_2025@wang_lee_suzuki_2023, petroleum refining @wang_chu_qiu_liu_zhang_2006, rubber production @riyajan_2009).

Ammonia also emerges as a promising hydrogen carrier, addressing hydrogen's storage challenges (70 MPa compression or 20 K liquefaction @doe2015storage) through manageable liquid storage at 240 K @yadav_sharma_2016. Unlike hydrogen, ammonia benefits from established global infrastructure (production facilities, pipelines, port terminals, marine tankers), potentially accelerating hydrogen economy deployment. The proposed value chain involves producing ammonia where renewable energy is abundant, transporting it globally in liquid form, and catalytically cracking it at destination to release high-purity hydrogen @zhai_liu_xiang_2023.

Ammonia can also function directly as a direct zero-carbon fuel, producing only nitrogen and water when combusted, in ideal conditions (4NH₃+3O₂→2N₂+6H₂O) @sun_ling_mao_zeng_yuan_liu_2025. Major engine manufacturers and companies like Toyota @miyagawa_tetsunori_2024 are developing ammonia-fueled engines for ships and trucks. *High-temperature Solid Oxide Fuel Cells (SOFCs)* @dhawale_biswas_kaur_giddey_2023 offer more efficient energy conversion by directly decomposing ammonia at temperatures above 600°C. Key challenges include developing durable catalysts for breaking N-H bonds, preventing ammonia crossover through membranes, and ensuring long-term stability @dhawale_biswas_kaur_giddey_2023.

With no big surprise, the ammonia industry is enormous. In 2024 the global market was \~\$170 billion @towards2025ammonia @precedence2025ammonia. Analysts forecast steady growth (CAGR \~3-6% @towards2025ammonia @precedence2025ammonia @grandview2024ammonia) as agriculture demand rises and new energy uses develop. By 2030 value may exceed \~\$300 billion @grandview2024ammonia. Current global $N H_3$ production is on the order of 150-200 million tonnes (Mt) per year @irena2022ammonia@marketgrowth2025ammonia, with one report projecting demand growing from \~150 Mt in 2024 to \~190 Mt by 2050 @irena2022ammonia. This transformative breakthrough, however, comes with substantial energetic requirements. The Haber-Bosch process demands extreme pressures and temperatures, consuming approximately *30-40 MJ per kilogram* of ammonia produced @worrell_blok_1994@tunå_hulteberg_ahlgren_2013@irena2022ammonia, accounting for 1–2% of global energy consumption @irena2022ammonia@tunå_hulteberg_ahlgren_2013. Moreover, this energy predominantly derives from fossil fuels @tunå_hulteberg_ahlgren_2013, tying ammonia production to carbon emissions and geopolitical constraints on natural gas supply.

*Low-temperature plasmas (LTPs)* offer a fundamentally different approach. A plasma is an ionized gas containing electrons, ions, and neutral species exhibiting collective electromagnetic behavior @Loureiro2016. In non-equilibrium or "cold" plasmas, electrons acquire high kinetic energies ($T_e$ \~ 1-10 eV, equivalent to 11,600-116,000 K) through electric field acceleration, while heavy species (ions and neutrals) remain near ambient temperature ($T_g$ \~ 300-1000 K). This profound non-equilibrium ($T_e >> T_g$) enables selective chemistry: energetic electrons efficiently break strong chemical bonds (e.g., $N equiv N$, bond energy 9.8 eV) and create reactive radicals without bulk heating @Loureiro2016.

Beyond their chemical selectivity, plasmas enable *renewable electricity integration*. While Haber-Bosch inherently relies on fossil-derived hydrogen and heat @irena2022ammonia, plasma systems directly convert electrical power to chemical activation, naturally coupling to intermittent renewable sources (solar, wind). This synergy positions plasma-assisted ammonia synthesis as a pathway toward decarbonized, distributed, and flexible chemical production.

The energetic considerations become more apparent through a naive order-of-magnitude analysis. Consider a representative low-pressure plasma discharge operating at $p approx 130 P a$ (total gas density $N_("gas") approx 10^(22) m^(-3)$): $P = U I approx 1000 V times 10 m A = 10 W$ with gas residence time $t approx 50 m s$, through plasma volume $V = pi r^2 L approx pi times (10^(-2))^2 times 0.5 approx 1.57 times 10^(-4) m^3$. Assuming a modest ammonia production yield of $approx 10%$, the $N H_3$ density is $N_("NH"_3) approx 0.1 times N_("gas") approx 10^(21) m^(-3)$, giving $N_("NH"_3) V approx 1.57 times 10^(17)$ molecules. The energy deposited per ammonia molecule produced is:

$ 
E_("mol") = (P times t) / (N_("NH"_3) times V) approx (10 W times 50 times 10^(-3) s) / (1.57 times 10^(17)) approx 3.2 times 10^(-18) J 
$

Converting to per-kilogram basis using $N H_3$ molar mass ($M = 17 g\/m o l$) and Avogadro's number ($N_A = 6.022 times 10^(23) m o l^(-1)$):

$
frac(N, m) = frac(N_A, M) = frac(6.022 times 10^(23), 0.017 k g) approx 3.54 times 10^(25) space m o l e c u l e s \/ k g
$

$
E_("kg") = E_("mol") times frac(N, m) approx 3.2 times 10^(-18) J times 3.54 times 10^(25) approx 113 space M J \/ k g
$

This value, while approximately 3-4 times higher than Haber-Bosch's 30-40 MJ/kg, is calculated for *low-pressure conditions* (130 Pa). At atmospheric pressure ($approx 10^5 P a$), the gas density increases by factor $approx 700$, proportionally increasing $N_("NH"_3)$ and reducing the energy per kilogram to:

$
E_("kg")^("atm") approx frac(113 space M J \/ k g, 700) approx 160 space k J \/ k g
$

This represents a *potential* energetic advantage compared to conventional synthesis. However, several critical considerations temper this optimism. First, the 10% yield assumption is optimistic—current experimental plasma synthesis typically achieves $<1%$ conversion per pass, which would increase $E_("kg")$ by an order of magnitude. Second, scaling to atmospheric pressure does not trivially translate to proportional ammonia production increases; electron kinetics become less efficient as collisional energy losses dominate, potentially limiting $N_("NH"_3)$ growth despite higher gas density. Third, and most crucially, the per-molecule energy scale of $approx 20 e V$ ($= 3.2 times 10^(-18) J$), while matching molecular dissociation energies ($N equiv N$ bond: 9.8 eV), must be *selectively channeled* into productive chemistry—breaking specific bonds and forming desired products—rather than dissipated unproductively. Achieving this selectivity likely requires *surface-assisted reactions*, where reactive fragments ($N$, $H$, $N H$, $N H_2$) created in the plasma volume migrate to reactor walls and sequentially capture additional hydrogen atoms, progressively building ammonia through the pathway $N -> N H -> N H_2 -> N H_3$. Thus, while plasmas offer the theoretical advantage of selective energy deposition at ambient conditions, realizing practical energetic competitiveness depends critically on (i) optimizing conversion yields, (ii) understanding pressure-dependent electron kinetics, and (iii) engineering effective plasma-surface interactions.

=== The PSI.COM Project

*The Plasma Surface Interaction and COupled Modelling (PSI.COM)* @psi2022project project focuses on advancing the understanding and modelling of plasma-surface chemistry in $N_2-H_2$ mixtures. Its core objectives include bridging the gap between plasma volume and surface reactivity, leveraging experimental measurements with kinetic simulations, and optimizing chemistry schemes for more efficient modelling. 

PSI.COM brings together the complementary expertise of the N-PRiME group of Instituto de Plasmas e Fusão Nuclear (IPFN), at Instituto Superior Técnico, Lisbon, Portugal and *Laboratoire de Physique des Plasmas (LPP)*, at École Polytechnique, Palaiseau, France, in low-temperature plasma modelling and diagnostics. Key tasks include investigating $N_2-H_2$ plasmas for ammonia production, enhancing the LisbOn KInetics (LoKI) tool suite @loki and contributing to the development of an open-access data-storage library in collaboration with LXCat tech-team @lxcat. LoKI is a simulation environment for plasma chemistry that couples two main calculation blocks: a *Boltzmann solver* (LoKI-B) and a *Chemical solver* (LoKI-C), implemented in modular, object-oriented MATLAB to leverage matrix-based operations @loki.

As previously mentioned, plasma-assisted ammonia synthesis offers several potential advantages over conventional methods, including operation at lower temperatures and pressures, the potential for reduced energy consumption, and the ability to utilize renewable energy sources. However, the complex interplay between electron kinetics, heavy species chemistry, and surface processes in $N_2-H_2$ plasmas presents significant challenges for both experimental characterization and theoretical modeling @adamovich2022. Indeed, the complexity of electron kinetics, the completeness of reaction mechanisms, the accuracy of rate coefficients, and the overall computational cost constitute the main challenges the community is facing @carreon2019plasma@annemie_2020, and addressing these forms the primary motivation for this work.

=== Challenges in Modeling N₂-H₂ Plasma

Despite significant advances in plasma modeling over the past decades, well grounded computational approaches to handle the inherent complexity of these systems are needed. The *electron energy distribution function (EEDF)*, which describes how electrons are distributed across different energy levels within the plasma (see @ebe), exhibits highly complex, _non-Maxwellian_ structures in molecular gases, as seen in @modelling-nh3-plasmas. Unlike atomic plasmas where the EEDF can often be approximated by simple analytical functions, molecular systems require sophisticated numerical methods such as *Boltzmann equation solvers* or *Monte Carlo* techniques to accurately capture the intricate energy distribution patterns. These non-equilibrium effects become particularly pronounced at low pressures and moderate electron densities, where electron _kinetic_ features are dominant @guerra_tejero-del-caz_pintassilgo_alves_2019.

The $N_2-H_2$ plasma system encompasses an extraordinarily complex network involving hundreds of possible reaction pathways. This includes electronic excitations to multiple excited states of $N_2$ and $H_2$, extensive vibrational and rotational ladder climbing processes, dissociation channels producing various atomic and molecular fragments ($N$, $H$, $N H$, $N H_2$, $N H_3$), ionization processes creating positive ions ($N_2^+$, $H_2^+$, $N H_4^+$, etc.) and electrons, three-body recombination reactions, and surface-mediated processes involving adsorption, desorption and diffusion, which contribute to heterogeneous catalysis @guerra_tejero-del-caz_pintassilgo_alves_2019. The coupling between gas-phase and surface chemistry adds another layer of complexity, particularly in determining the balance between bulk production and surface loss mechanisms @guerra_tejero-del-caz_pintassilgo_alves_2019@alves2018foundations.

Many critical rate coefficients, particularly those involving electronically excited species and vibrationally excited molecules, suffer from significant uncertainties or complete absence of experimental data @bang2023kinetic. The temperature dependencies of these rates are frequently unknown or poorly characterized. This is especially problematic for simulations, since rate coefficients determine which reactions are most likely to occur and, consequently, can dramatically alter the predicted dissociation pathways and overall plasma chemistry. Additionally, the coupling between different *energy modes* (translational, rotational, vibrational, electronic) in non-equilibrium conditions requires careful consideration of mode-specific rate coefficients @alves2018foundations.

Full kinetic models incorporating electron kinetics, detailed state-to-state chemistry, and transport phenomena @alves2018foundations@guerra_tejero-del-caz_pintassilgo_alves_2019 are computationally prohibitive for many practical applications. The stiff nature of the resulting ordinary differential equation systems, spanning timescales from femtoseconds (electron processes) to seconds (diffusion and surface processes) @yang_nagaraja_sun_yang_2017@alves2018foundations, demands robust numerical algorithms and significant computational resources. This computational burden severely limits the feasibility of extensive parameter studies, optimization campaigns, and real-time process control applications @carreon2019plasma.

Ideally, describing the interaction between electrons, ions, and neutral species with reactor surfaces should include processes such as secondary electron emission @donkó_2001@derzsi_korolov_schüngel_donkó_schulze_2015, ion-induced desorption, surface recombination, and plasma-surface charge exchange @alves2018foundations@guerra_tejero-del-caz_pintassilgo_alves_2019. The surface properties, including material composition, roughness, and contamination, may influence significantly these interactions and should be carefully characterized and modeled. However, considering these effects introduces additional complexity to the modeling effort.

== Thesis Objectives and Structure

This thesis is structured to systematically address the challenges in $N_2-H_2$ plasma modelling. Each chapter builds upon the last, culminating in a comprehensive and validated framework for modeling plasma-assisted ammonia synthesis.

The work begins in *Chapter 2*, which lays the *Theoretical Foundation* for the entire thesis. It provides a detailed overview of low-temperature plasma physics, the formulation of the electron Boltzmann equation, and the principles of chemical model used for understanding $N_2-H_2$ plasma kinetics.

*Chapter 3* is dedicated to the *Experimental Measurements* that form the empirical basis for this work. A central objective is to ground the simulations in physical reality; therefore, this chapter details the experimental setup at LPP, the diagnostic techniques employed, and the data acquisition protocols used to characterize the $N_2-H_2$ plasma discharges.

With the established theoretical and experimental groundwork, *Chapter 4* details the *Modelling of NH₃ Plasmas*. This chapter explains the construction of the kinetic models for both surface and volume, incorporating the reaction schemes, the rate coefficients and the cross-section data relevant to the system. It also presents the validation of theese models, identifying the key creation and destruction mechanisms of the most relevant plasma species.

*Chapter 5* documents the *Tool Development* executed during this work. This chapter presents specific contributions to the LoKI-B solver @LoKI_B_GitHub. The technical work includes the implementation of the continuous operators of the *Electron Boltzmann Equation* (EBE) on a variable energy grid, in addition to the benchmarking against results obtained from uniform energy grid. It also presents the development of a Graphical User Interface (GUI) for the Input of the numerical solver.

Finally, *Chapter 6* presents the *Conclusions*. This chapter summarizes the results from the preceding chapters, discusses the implications of these results for the field of plasma-assisted ammonia synthesis, and proposes directions for future work. The contributions of the thesis, such as the additions to the LoKI simulation tool, are presented.
