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
Some of us consume meat, others set their limit to fish. Some choose the vegan path, while others embrace peculiar diets like the cabbage soup one@Cabbage_soup_diet. Yet, regardless of our culinary preferences, nearly all of our food — around 90%@owid-global-land-for-agriculture — comes from the same age-old origin: *agriculture*. Beyond the small contributions of wild seafood and hunting, human sustenance is overwhelmingly a product of managed agricultural systems@singh_singh_2024. 

These systems, however, were governed for millennia by an immutable bottleneck that no civilization could escape. The *natural nitrogen cycle*.

=== Why Ammonia?

*Nitrogen* (*N*), in its diatomic form (*N₂*), is the most abundant gas in Earth's atmosphere. Being largely inert, it's when combined with *Hydrogen* (*H₂*) to form *Ammonia* (*NH₃*) that it unlocks its full biological potential. The continuous transformation of nitrogen between the atmosphere, land, and living organisms constitutes the biogeochemical *nitrogen cycle*, a planetary-scale process. The conversion of nitrogen into usable ammonia, known as *nitrogen fixation*, occurs through several natural pathways@halbleib_ludden_2000@hill_rinker_wilson_1980@strock_2008:


#figure(
  image("../Images/nitrogen_pathways.jpg", width: 120%),
  caption: [Natural Nitrogen Conversion Processes]
)<nPaths>


Once fixed into ammonia or ammonium, nitrogen enters the food web. Soil bacteria can further convert ammonia into nitrites ($N O_2^-$) and then nitrates ($N O_3^-$) through a process called *nitrification*. Plants absorb these nitrogen compounds from the soil through their roots, assimilating them to build proteins and DNA. Animals, in turn, acquire this essential nitrogen by consuming plants or other animals @n_g_1983@ward2011Nitrification.   
Because the natural conversion of inert $N_2$ into bioavailable ammonia is a slow and finite process, the supply of fixed nitrogen is the primary limiting nutrient for growth in most terrestrial and aquatic ecosystems. The productivity of land was indeed limited by the availability of naturally fixed nitrogen for thousands of years, forcing reliance on practices like crop rotation with legumes and the use of animal manure@crop_rotation_2025. This fundamental limit was shattered in the early 20th century with the invention of the *Haber-Bosch* process, an industrial procedure that effectively hijacks the planetary nitrogen cycle and represents one of the most significant technological advancements in human history@connor_2014.   


Developed by German chemists *Fritz Haber* and *Carl Bosch*, the process synthesizes ammonia from its constituents:   

$
N_2 + 3H_2 #sym.arrows.rl 2N H_3
$
 
To achieve this, the process requires extreme conditions; a mixture of nitrogen, cryogenically separated from the air, and hydrogen is subjected to very high pressures (typically 50–200 bar) and high temperatures (400–500°C) in the presence of a metal catalyst, most commonly iron-based@aleksandra_2014.


The historical and societal impact of the Haber-Bosch process cannot be overstated - it provided, for the first time, a cheap, scalable, and seemingly limitless source of nitrogen fertilizer, breaking humanity's dependence on finite natural sources like mined Chilean saltpetre@connor_2014. The widespread application of ammonia-based fertilizers is credited with preventing mass starvation and supporting a global population that has grown from 1.6 billion in 1900 to over 8 billion today. It is estimated that synthetic nitrogen fertilizers are used to grow the food that sustains half of the current global population@erisman.

Today ammonia is the second most synthesized chemical on Earth, only behind to sulfuric acid ($H_2S O_4$), with global industrial production reaching 180 million tonnes in 2021@patel_2023@USGS2022Nitrogen. And the reality is that ammonia is not only important for agricultural uses. In fact, it is also used extensively across diverse industrial sectors due to its unique chemical and thermodynamic properties. In refrigeration applications, ammonia serves as one of the most efficient industrial coolants, with its low boiling point and high heat absorption capacity making it ideal for large-scale food processing facilities, cold storage operations, and industrial cooling systems@pearson_2007@pachai_hafner_ciconkov_2022. The chemical industry relies heavily on ammonia as a fundamental building block for synthesizing plastics@kahofer_1966, synthetic fibers like nylon@thomas_raja_2005, and numerous pharmaceutical compounds, including common medications such as antibiotics and analgesics@weissermel2003@ostwald_2021.

Beyond manufacturing, ammonia also serves essential environmental and industrial stabilization functions, including water disinfection through chloramine formation@sisler1954, air pollution control by converting harmful nitrogen oxides into benign compounds@catalysts_2025@javed_irfan_gibbs_2006, metal processing applications for both protective atmospheres and ore extraction@leaching_2025@wang_lee_suzuki_2023, petroleum refining for acid neutralization@wang_chu_qiu_liu_zhang_2006, and rubber production for latex stabilization@riyajan_2009.

The global shift to hydrogen as a clean energy source faces a critical challenge: hydrogen's extremely low energy density requires either high-pressure compression (700 bar) or cryogenic liquefaction (-253°C) for storage and transport, making it costly and logistically complex@doe2015storage.
Ammonia's name emerges again, this time as a hydrogen carrier solution, since it can be stored as a liquid under manageable conditions (boiling point of liquid ammonia at atmospheric pressure is -33.3ºC@yadav_sharma_2016, far less extreme than hydrogen's requirements).
Unlike hydrogen, which lacks global infrastructure, ammonia benefits from an established worldwide supply chain with existing production facilities, pipelines, port terminals, and marine tankers developed over decades of commercial use. This infrastructure advantage could accelerate hydrogen economy deployment.
The proposed value chain involves producing ammonia where renewable energy is abundant, transporting it in liquid form globally, and then "cracking" it at destination points to release high-purity hydrogen through catalytic decomposition.

----[missing references]------

Ammonia can also function directly as a direct zero-carbon fuel, producing only nitrogen and water when combusted, in ideal conditions (4NH₃+3O₂→2N₂+6H₂O). Major engine manufacturers and companies like Toyota are developing ammonia-fueled engines for ships and trucks. *High-temperature Solid Oxide Fuel Cells (SOFCs)* offer more efficient energy conversion by directly decomposing ammonia at temperatures above 600°C. Key challenges include developing durable catalysts for breaking N-H bonds, preventing ammonia crossover through membranes, and ensuring long-term stability.

With no big surprise, the ammonia industry is enormous. In 2024 the global market was ~\$224 billion. Analysts forecast steady growth (CAGR ~2–6%) as agriculture demand rises and new energy uses develop. By 2030 value may exceed ~\$300 billion. Current global NH₃ production is on the order of 150–200 million tonnes per year, with one report projecting demand growing from \~150 Mt in 2024 to \~190 Mt by 2034.

This transformative power, however, comes with an enormous energy and environmental cost. The Haber-Bosch process is one of the most energy-intensive industrial processes in the world. Its operation accounts for an estimated 1-2% of total global energy consumption and 3-5% of global natural gas consumption [MISSING REFERENCES!!]. This heavy reliance on fossil fuels for the energy to run the high-pressure reactors makes ammonia production a massive source of greenhouse gas emissions. The industry is responsible for approximately 1.3-1.8% of global anthropogenic $C O_2$ emissions. With every tonne of ammonia produced through conventional methods, 2.7 tonnes of CO₂ are released into the atmosphere. As this essential chemical accounts for 1-2% of global energy consumption and 1.3% of all human-caused carbon emissions, it is imperative to seek new solutions that allow us to obtain this vital raw material in greener, more efficient, and less polluting ways. And that's exactly where the plasmas come in.




=== The PSI.COM Project

The Plasma Surface Interaction and COupled Modelling (PSI.COM) project focuses on advancing the understanding and modelling of plasma-surface chemistry in $N_2-H_2$ mixtures. Its core objectives include bridging the gap between plasma volume and surface reactivity, leveraging experimental measurements with kinetic simulations, and optimizing chemistry schemes for more efficient modelling. 

PSI.COM brings together the complementary expertise of the N-PRiME group (IPFN, Instituto Superior Técnico, Lisbon, Portugal) and LPP (École Polytechnique, Palaiseau, France) in low-temperature plasma modelling and diagnostics. Key tasks include investigating $N_2-H_2$ plasmas for ammonia production, enhancing the LisbOn KInetics (LoKI) tool suite @loki to improve the coupling between its Chemistry and Boltzmann components and to incorporate surface reactions and machine learning-based sensitivity analysis, and contributing to the development of an open-access data-storage library in collaboration with LXCat tech-team @lxcat.

Plasma-assisted ammonia synthesis offers several potential advantages over conventional methods, including operation at lower temperatures and pressures, reduced energy consumption, and the ability to utilize renewable energy sources. However, the complex interplay between electron kinetics, heavy species chemistry, and surface processes in N₂-H₂ plasmas presents significant challenges for both experimental characterization and theoretical modeling.

Accurate plasma modeling is essential for understanding the underlying mechanisms, optimizing process parameters, and scaling up from laboratory to industrial applications. The development of reliable kinetic models requires comprehensive knowledge of electron-molecule interactions, reaction pathways, and rate coefficients across a wide range of conditions.

Despite significant advances in plasma modeling over the past decades, several challenges persist in accurately describing N₂-H₂ plasma chemistry, namely the complexity of electron kinetics, the completeness of reaction mechanisms, the accuracy of rate coefficients, and the overall computational cost. Addressing these challenges forms the primary motivation for this work.

=== Challenges in Modeling N₂-H₂ Plasma

Despite significant advances in plasma modeling over the past decades, several fundamental challenges persist in accurately describing N₂-H₂ plasma chemistry, necessitating well grounded computational approaches to handle the inherent complexity of these systems.

The electron energy distribution function (EEDF) in molecular gases exhibits highly complex, non-Maxwellian structures due to multiple inelastic collision processes including vibrational excitation, electronic transitions, and rotational coupling. Unlike atomic plasmas where the EEDF can often be approximated by simple analytical functions, molecular systems require sophisticated numerical methods such as Boltzmann equation solvers or Monte Carlo techniques to accurately capture the intricate energy distribution patterns. These non-equilibrium effects become particularly pronounced at low pressures and moderate electron densities, where electron kinetic features are dominant.

The N₂-H₂ plasma system encompasses an extraordinarily complex network involving hundreds of possible reaction pathways. This includes electronic excitations to multiple excited states of N₂ and H₂, extensive vibrational and rotational ladder climbing processes, dissociation channels producing various atomic and molecular fragments (N, H, NH, NH₂, NH₃), ionization processes creating positive ions (N₂⁺, H₂⁺, NH₄⁺, etc.) and electrons, three-body recombination reactions, and surface-mediated processes involving adsorption, desorption and diffusion, which contribute to heterogeneous catalysis. The coupling between gas-phase and surface chemistry adds another layer of complexity, particularly in determining the balance between bulk production and surface loss mechanisms.

Many critical rate coefficients, particularly those involving electronically excited species and vibrationally excited molecules, suffer from significant uncertainties or complete absence of experimental data. The temperature dependencies of these rates, often following non-Arrhenius behavior due to quantum effects, are frequently unknown or poorly characterized. This is especially problematic for reactions involving highly excited N₂ vibrational states, which can dramatically alter the dissociation pathways and overall plasma chemistry. Additionally, the coupling between different energy modes (translational, rotational, vibrational, electronic) in non-equilibrium conditions requires careful consideration of mode-specific rate coefficients.

Full kinetic models incorporating  electron kinetics, detailed state-to-state chemistry, and transport phenomena are computationally prohibitive for many practical applications. The stiff nature of the resulting ordinary differential equation systems, spanning timescales from femtoseconds (electron processes) to seconds (diffusion and surface processes), demands robust numerical algorithms and significant computational resources. This computational burden severely limits the feasibility of extensive parameter studies, optimization campaigns, and real-time process control applications.

Ideally, describing the interaction between electrons, ions, and neutral species with reactor surfaces should include processes such as secondary electron emission, ion-induced desorption, surface recombination, and plasma-surface charge exchange. The surface properties, including material composition, roughness, and contamination, may influence significantly these interactions and should be carefully characterized and modeled. However, considering these effects introduces additional complexity to the modeling effort.


== Thesis Objectives and Structure

This thesis is structured to systematically address the challenges in $N_2-H_2$ plasma modelling. Each chapter builds upon the last, culminating in a comprehensive and validated framework for modeling plasma-assisted ammonia synthesis.

The work begins in *Chapter 2*, which lays the *Theoretical Foundation* for the entire thesis. It provides a detailed overview of low-temperature plasma physics, the formulation of the electron Boltzmann equation, and the principles of chemical model used for understanding $N_2-H_2$ plasma kinetics.

*Chapter 3* is dedicated to the *Experimental Measurements* that form the empirical basis for this work. A central objective is to ground the simulations in physical reality; therefore, this chapter details the experimental setup at LPP, the diagnostic techniques employed, and the data acquisition protocols used to characterize the $N_2-H_2$ plasma discharges.

With the established theoretical and experimental groundwork, *Chapter 4* details the *Modelling of NH₃ Plasmas*. This chapter explains the construction of the kinetic models for both surface and volume, incorporating the reaction schemes, the rate coefficients and the cross-section data relevant to the system. It also presents the validation of theese models, identifying the key creation and destruction mechanisms of the most relevant plasma species.

*Chapter 5* documents the *Tool Development* executed during this work. This chapter presents specific contributions to the LisbOn KInetics (LoKI) tool suite. The technical work includes the implementation of the continuous operators of the Electron Boltzmann Equation (EBE) on a variable energy grid, in addition to the benchmarking against results obtained from uniform energy grid. It also presents the development of a Graphical User Interface (GUI) for the Input of the numerical solver. (aplicar chatgpt)

[Furthermore, this chapter covers the application of machine learning methods to perform sensitivity analysis and to identify non-essential reactions, enabling automated reaction scheme reduction.]

Finally, *Chapter 6* presents the *Conclusions*. This chapter summarizes the results from the preceding chapters, discusses the implications of these results for the field of plasma-assisted ammonia synthesis, and proposes directions for future work. The contributions of the thesis, such as the additions to the LoKI simulation tool, are presented.
