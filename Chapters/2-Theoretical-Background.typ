= Theoretical Background and State of the Art <state-of-the-art>

Plasma is often referred to as the fourth state of matter, consisting of a quasi-neutral, ionized gas composed of electrons, ions, and neutral particles, as described in @why-ammonia. This state of matter is, in fact, the most prevalent in the observable universe, constituting stars and the vast interstellar medium. The presence of charge carriers makes plasma electrically conductive and highly responsive to electromagnetic fields.   

Plasmas can be broadly categorized based on the degree of thermal equilibrium between their constituent particles. In thermal plasmas, frequent collisions among all particles lead to a state of local thermodynamic equilibrium (LTE), where the electrons and heavy species (ions and neutral atoms or molecules) share a common, typically very high, temperature. 

Conversely, the plasmas utilized for ammonia synthesis are LTPs, by this point already defined. In these systems, electrons are accelerated by external electric fields far more efficiently than the ions, due to their extremely small mass and high mobility. The energy gained by electrons from the field is then dissipated through _elastic_ and _inelastic_ collisions. Although the frequency of electron-neutral elastic collisions is considerably high, the corresponding energy transfer is very inefficient since it scales with the electron-to-heavy-species mass ratio, $m_e/m_h$. Consequently, a profound state of non-equilibrium is established, characterized by highly energetic electrons coexisting with heavy species that remain near ambient temperature. This fundamental property of LTPs is the cornerstone of applications involving cold plasmas, since it allows for the generation of a highly reactive chemical environments. Without the need for bulk gas heating, the high energy costs of conventional thermocatalytic methods are effectively circumvented.   

Another key parameter defining these systems is the degree of ionisation, $alpha$, corresponding to the ratio of the electron number density ($n_e$) to the total number density of heavy particles ($n_g$) @Loureiro2016. For LTPs used in chemical synthesis, the plasma is typically weakly or partially ionized, with $alpha$ often in the range of $10^(-5)$ to $10^(-4)$. This means that the plasma is composed predominantly of neutral gas particles. As a result, electron-neutral collisions are the most relevant kinetic processes, initiating the entire chain of chemical reactions that leads to product formation. These high collisionality processes can be studied using the Electron Boltzmann Equation.

== The Electron Boltzmann Equation <ebe>

The *Electron Boltzmann Equation (EBE)*  provides a rigorous, statistical description of the electron kinetics in a plasma, moving beyond simplistic assumptions of thermal equilibrium.  

The EBE describes the evolution of the *electron distribution function (EDF)* in phase space. This distribution function, $f(arrow(r), arrow(v), t)$, represents the probability density of finding electrons at position $arrow(r)$ with velocity $arrow(v)$ at time $t$ in a six-dimensional phase space. The quantity $f(arrow(r), arrow(v), t) dif arrow(r) dif arrow(v)$ represents the number of electrons within an infinitesimal volume element $dif arrow(r)$ around position $arrow(r)$ and $dif arrow(v)$ around velocity $arrow(v)$, at time $t$. The equation itself is a statement of conservation of particles in phase space, accounting for all processes that can change the number of electrons in a given phase-space element @Loureiro2016@alves2018foundations.

The general form of the Boltzmann equation for a particle of mass $m$ is @Loureiro2016:

$ (partial f)/(partial t) + arrow(v) dot nabla_r f + arrow(F)/m dot nabla_v f = ((partial f)/(partial t))_"coll" $
 
Each term in this equation has a distinct physical meaning:

- $(partial f)/(partial t)$: The change in $f$ due to the intrinsic time evolution of the distribution function.
- $arrow(v) dot nabla_r f$: The change in $f$ due to the motion of electrons in configuration space (spatial transport or convection).
- $arrow(F)/m dot nabla_v f$: The change in $f$ due to particle acceleration by a force $arrow(F)$, which, for charged particles, is typically the Lorentz force $arrow(F) = q(arrow(E) + arrow(v) times arrow(B))$ from electric ($arrow(E)$) and magnetic ($arrow(B)$) fields.
- $((partial f)/(partial t))_"coll"$: The collision integral, which represents the rate of change of $f$ due to collisions. This term accounts for particles being scattered into and out of the velocity element $d arrow(v)$ through elastic and inelastic processes.

The collision integral is the most complex term, as it involves an integration over all possible collision partners and scattering angles. For electrons, it encapsulates the microphysics of electron-neutral, electron-ion, and electron-electron interactions.   

The EBE has a great physical significance. Its solution bridges the microscopic physics of individual collisions (encoded in the cross-sections, see @cross-section, within the collision integral) and the macroscopic properties of the plasma. Once the EDF is known, macroscopic parameters can be calculated self-consistently by taking appropriate integrals of the distribution function. These macroscopic parameters, such as electron transport parameters (mobility $mu_e$, diffusion coefficient $D_e$) and electron-impact rate coefficients ($k_j$) are essential for the fluid modelling of the plasma @guerra_tejero-del-caz_pintassilgo_alves_2019. This approach is fundamentally more accurate than assuming an _a priori_ EDF, such as a Maxwellian distribution function, which is often not valid in the non-equilibrium conditions of interest @Loureiro2016.

The full Boltzmann equation is a complex seven-dimensional (six phase-space dimensions plus time) integro-differential equation that is computationally prohibitive to solve for most practical applications in plasma chemistry modeling. To make the problem tractable, a widely adopted and highly successful simplification known as the *small anisotropy approximation* @Loureiro2016@alves2018foundations is employed.   

This approximation is based on expanding the velocity-dependent distribution function, $f(arrow(r), arrow(v), t)$, in a series of spherical harmonics (or Legendre polynomials in the one-dimensional case) in velocity space. The key physical assumption is that the electron velocity distribution *is nearly isotropic*, meaning it is dominated by its spherically symmetric component, with only a small directional perturbation caused by different effects (e.g., electric fields, density gradients and collisions). Under this assumption, the expansion can be truncated after the first *two terms* @william_1963:

$
f(arrow(r), arrow(v), t) approx f_0(arrow(r), v, t) + frac(arrow(v), v) dot arrow(f)_1(arrow(r), v, t)
$

Here, $f_0$ is the isotropic part of the distribution function (which depends only on the magnitude of the velocity, $v$), and $arrow(f)_1$ is the first-order anisotropic perturbation, representing a small directional flux.

Substituting this expansion into the full Boltzmann equation and performing an integration over the solid angle in velocity space allows the complex equation to be separated into a coupled system of two simpler equations for $f_0$ and $arrow(f)_1$. Under the two-term approximation, for a steady-state and spatially homogeneous plasma, the reduced equations can be written in energy space as @Loureiro2016:

$ 
frac(1, N) sqrt(frac(m_e, 2e)) frac(d G(u), d u) = S(u)
$

$ 
f_1(u) = - frac(E \/ N, sigma_c (u)) frac(d f_0(u), d u) 
$

where $f_0$ is typically referred to as the *electron energy distribution function* or *EEDF* for short, $N$ is the neutral gas density, $G$ is the total upflux function that contains power gain/loss contributions, for example due to continuous action of the applied electric field and elastic collisions, $S$ is the discrete collision operator that contains power loss/gain contributions due to inelastic/superelastic mechanisms, and $sigma_c$ is the electron-neutral total momentum-transfer cross section.

Note that usually the isotropic EEDF deviates from a Maxwellian distribution. In LTPs, the energy gain from the electric field and the energy losses through various electron-neutral collisions can significantly modify the shape of the EEDF from a simple Maxwellian profile. For instance, in molecular gases, the EEDF may be strongly depleted at energies corresponding to the various thresholds of the cross-section processes @Loureiro2016. Common non-Maxwellian forms include the *Druyvesteyn distribution* (more details can be found in @Loureiro2016 @druyvesteyn_penning_1940), though in many real gas mixtures, the EEDF can be even more complex and must be calculated numerically.

The primary advantage of this two-term approximation is the immense reduction in computational complexity. It transforms the problem into a much more manageable form that can be quickly solved, enabling its use in complex plasma chemistry models where hundreds of rate coefficients must be calculated. This is the approach implemented in widely used Boltzmann solvers such as BOLSIG+ @hagelaar2005solving and LisbOn KInetics Boltzmann solver (LoKI-B) @loki (see @num-ebe).   

However, the approximation has inherent limitations tied to its core assumption of small anisotropies. This assumption holds when electron-neutral collisions are frequent and predominantly elastic, effectively randomizing the electron's velocity direction between accelerations by the electric field. The approximation can become less accurate or even fail under conditions of high anisotropies, which can occur at high values of the reduced electric field ($E\/N$, with $E$ the electric field and $N$ the density of the gas), where the field-induced drift becomes significant compared to the random thermal motion @Loureiro2016.

The N₂-H₂ gas mixture presents particular challenges to the two-term approximation due to nitrogen's large vibrational excitation cross-sections (2-4 eV range), where electrons lose significant energy in single inelastic collisions @song_cho_karwasz_kokoouline_tennyson_2023. These strong, non-randomizing energy losses can perturb the electron distribution beyond the approximation's assumptions. While the two-term approximation remains an essential tool, its application to N₂-rich plasmas requires careful validation. 


=== Numerical Solution of the EBE <num-ebe>

Several numerical methods are employed to solve the EBE. When using the two-term approximation, the differential operators are written in a discretized energy grid. Often, the discretization adopts finite difference or finite element schemes. In other cases, for example in the *BOLSIG+* solver @hagelaar2005solving, an exponential discretization scheme is used instead, which is particularly robust for convection-diffusion-type equations @llorente_pascau_2022. The resulting system of algebraic equations results in a large, sparse matrix equation that can be solved using standard linear algebra techniques. Alternative approaches to solve the EBE include spectral methods @wu_zhang_reese_zhang_2015, which expand the solution in a set of basis functions and can offer high accuracy, and Particle-In-Cell (PIC) Monte Carlo Collisional (MCC) methods @xiao-lin_xiao-lin_zhong-hai_2023, which simulate the trajectories of a large number of individual electrons and are not limited by the two-term approximation.

The numerical solution of the EBE requires the definition of appropriate boundary conditions @Loureiro2016. For the spatially homogeneous (0D) two-term approximation (see @chem-kinetics), the equation is solved on a one-dimensional energy grid with boundary conditions applied in energy space @LoKI_B_GitHub. At both zero energy and maximum energy ($u_"max"$) the conservation of the electron energy flux $G$ is imposed ($G(0) = G(u_"max") = 0$) to prevent the accounting of electrons losing/gaining energy beyond the grid boundaries. If the model is spatially dependent (e.g., 1D in space, 1D in energy), additional boundary conditions must be specified at the physical boundaries of the plasma, such as walls or electrodes. These conditions describe physical processes like electron absorption, reflection, or secondary electron emission @donkó_2001.

This work uses LoKI-B solver, an open-source tool developed at Instituto Superior Técnico, Lisbon @loki. It is written in MATLAB and it solves the two-term EBE for non-magnetized plasmas excited by DC or HF electric fields. Its design philosophy emphasizes the ability to easily handle any complex any gas mixture with atomic and molecular species, including detailed descriptions of first and second-kind electron collisions with any target state (electronic, vibrational, and rotational) characterized by any population.

== Chemical Kinetics <chem-kinetics>


Chemical kinetics in plasma systems typically involve complex spatial and temporal variations in species densities, requiring sophisticated three-dimensional models to capture the full physics. However, for many practical applications, particularly in quasi-homogeneous discharge conditions, spatially averaged zero-dimensional (0D) approaches provide efficient and accurate frameworks for understanding fundamental processes. Zero-dimensional models focus on the temporal evolution of the species densities without the computational overhead of spatial description. These models are valid for well-mixed plasma conditions where transport phenomena can be described by averaged terms over the entire discharge volume @solo_freton_gonzalez_benmouffok_2021@fox_2023@bogaerts_2020.

The temporal evolution of species densities in plasma kinetics is governed by rate balance equations that, for any species $i$, take the form @alves2018foundations:

$ 
(d n_i)/(d t) = (d n_i)/(d t) |_("chem") + (d n_i)/(d t) |_("transport") + (d n_i)/(d t) |_("flow")
$<rate-balance-eq>

This formulation separates time-evolution contributions from chemical processes (electron impact, heavy particle reactions, etc.), transport mechanisms (diffusion, drift, wall reactions,etc.) and flow (inflow and outflow from the discharge volume). The chemical term encompasses all production and loss mechanisms due to collisions between electrons, ions and neutrals (the latter two being called thereafter *heavy species*) and can generally be written as @alves2018foundations:

$ 
(d n_i)/(d t) |_("chem") = sum_r k_r product_l N_l^(a_(l r)^((1))) dot.c (a_(j r)^((2)) - a_(j r)^((1)))
$

where the sum runs over all reactions $r$; $N_l$ is the density of species $l$ participating in the reaction, $a_(l r)^((1))$ and $a_(j r)^((2))$ are the stoichiometric coefficients of species on the left-hand side (reactants) and right-hand side (products), respectively, and $k_r$ is the rate coefficient of reaction $r$. This rate can be the *electron rate coefficient* ($k_(i j)$) or the *heavy-species rate coefficient* ($k^"heavy"_(i j)$), for the production of species $j$ from species $i$. These quantities specify the frequency per unit gas density at which the specific collisions occur @Loureiro2016. 

The electron rate coefficients $k_(i j)$ are calculated using the following expression @alves2018foundations:

$
k_(i j) = gamma integral_0^infinity u sigma_(i j)(u) f(u) "d"u
$ <rate-coeff-e-coll>

where $gamma = sqrt(2e/m_e)$, $sigma_(i j)(u)$ is the energy-dependent cross section for the specific process, and $f(u)$ is the normalized EEDF. @rate-coeff-e-coll directly connects the EBE solution (non-equilibrium EEDF) to the chemical kinetics (reaction rates).

The heavy-species rate coefficients $k^"heavy"_(i j)$ are obtained from the literature and are typically expressed using Arrhenius-like forms @alves2018foundations:

$
k^"heavy"_(i j) = p_(i j) T_g^(q_(i j)) exp(-frac(E_(i j), k T_g))
$

where $p_(i j)$ and $q_(i j)$ are empirical parameters, $T_g$ is the gas temperature, $E_(i j)$ is the activation energy, and $k$ is the Boltzmann constant. This form accounts for both the thermal velocity dependence (through the $T_g^(q_(i j))$ term) and the activation energy barrier (through the exponential term $exp(-E_(i j)/(k T_g))$) enabling the specific reaction.

The transport terms can be generally written as @van_2021

$
 (d n_i)/(d t) |_("transport") = -(n_i nu_("charged") + n_i nu_("neutral")) 
$

where $nu_("charged")$ and $nu_("neutral")$ represent the loss frequencies for charged and neutral species transport, respectively. This decomposed description allows for modeling specific transport mechanisms affecting charged particles (e.g., ambipolar-like diffusion, thermal flux at the wall) and neutral species (e.g., binary diffusion, multi-component diffusion) @alves2023psicom.

The flow term accounts for material transport into and out of the system. The outflow term is expressed as @graef_2012:

$
 (d n_i)/(d t) |_("flow") = -k_("out") n_i 
$

where the outflow frequency $k_("out")$ is determined self-consistently as to ensure particle conservation at steady-state using:

#v(.5cm)
#align(center,
$(d p) / (d t) = 0 arrow.r.double 1/N (d N)/(d t) + 1/T_g (d T_g)/(d t) = 0 arrow.r.double 1/N (d N)/(d t) |_("chem") + 1/N (d N)/(d t) |_("flow") + 1/T_g (d T_g)/(d t) = 0 
$)
#v(.5cm)
#align(center,
$arrow.r.double sum_i (d n_i)/(d t) |_("flow") =  - \(1/N (d N)/(d t) |_("chem") + 1/T_g (d T_g)/(d t) \) dot (sum_i n_i) 
$)

$
  arrow.r.double k_("out") =  1/N (d N)/(d t) |_("chem") + 1/T_g (d T_g)/(d t)
$ 

where the total particle density is $N = sum_i n_i = p \/ (k_B T_g)$.

#v(.5cm)

The synthesis of ammonia at a low-temperature $N_2-H_2$ plasma is the result of a highly complex and interconnected network of chemical reactions. A successful kinetic model must capture the most critical of these processes, can occur both in the gas phase (_volume_) and on the surfaces of the reactor.

The overall mechanism can be conceptually divided into three main stages: (1) electron-impact dissociation, excitation and ionization of precursor molecules in the plasma volume, (2) formation of intermediate species, and (3) synthesis of the final product, which predominantly occurs on surfaces @chatain_2020@gordiets_1998. Some highlights of the processes yielding $N H_3$ include: the dissociation of nitrogen and hydrogen; the ionization of hydrogen and the subsequent charge-transfer mechanisms leading to the formation of $N_2 H^+$ and $N H_4^+$; the collisions of atomic nitrogen and hydrogen with surfaces up to the formation of wall-adsorbed $N H$ and $N H_2$ radicals; finally, the surface formation of $N H_3$ and its release into the volume. Experiments and modeling provide strong evidence that the final, crucial steps of ammonia synthesis occur on the surfaces of the plasma reactor (e.g., the reactor walls, eventually covered by a dedicated catalyst) @guerra_tejero-del-caz_pintassilgo_alves_2019. The surface acts as a third body, facilitating reactions between adsorbed species and providing a pathway to stabilize the final product. Two primary surface mechanisms are widely discussed @guerra_tejero-del-caz_pintassilgo_alves_2019@alves2018foundations:   

#v(.5cm)

#table(
  columns: (1fr, 2fr, 1.5fr),
  align: (left, left, center),
  stroke: none,
  table.hline(),
  [*Mechanism*], [*Description*], [*Example Reaction*],
  table.hline(),
  [*Eley-Rideal (ER)*], 
  [Reaction between a particle from the gas phase and a species that is already adsorbed onto the surface. For ammonia synthesis, this typically involves a gas-phase $H_2$ molecule reacting with an adsorbed nitrogen-containing radical.], 
  [$H_2$(gas) + $N H$(surface) $->$ $N H_3$(gas)],

  [], [], [],  // Empty row for spacing
  
  [*Langmuir-Hinshelwood (LH)*], 
  [Reaction between two species adsorbed on the surface. The weakly adsorbed reactant must then diffuse across the surface to find its reaction partner.], 
  [$H$(surface) + $N H_2$(surface) $->$ $N H_3$(gas)],
  table.hline(),
)

The interplay between volume and surface processes is a defining feature of plasma-assisted synthesis of ammonia. However, as important to note, the plasma volume is also a destructive environment for the final product. The same energetic species that activate $N_2$ and $H_2$ can also efficiently decompose $N H_3$, being responsible for major loss channels that limit the net yield. This establishes a clear dichotomy: the volume is primarily for precursor generation and product destruction, while the surface is for product synthesis @guerra_tejero-del-caz_pintassilgo_alves_2019. To capture the surface chemistry accurately, mesoscopic models are typically employed to bridge the gap between molecular-level interactions and macroscopic surface behavior. 

Furthermore, modeling studies have quantified the relative importance of different pathways. A volume-averaged global model by Body and Corr @body_cousens_kirby_corr_2018, for example, found that the dominant ammonia production mechanism shifts with the feedstock composition. For hydrogen concentrations above 25%, the Langmuir-Hinshelwood reaction between adsorbed $H$ and adsorbed $N H_2$ is found to dominate. For lower hydrogen proportions, the Eley-Rideal reaction between a gas-phase $H$ atom and an adsorbed $N H_2$ becomes the primary route. In all cases, however, the dominant loss mechanism for ammonia is found to be electron-impact dissociation in the volume.   

The network of chemical reactions leading to ammonia production contains more subtle and powerful mechanisms involving a diversity of excited states. While direct electron-impact dissociation and ionization of the ground-state precursors is possible, it is an energetically expensive process. Energy-efficient pathways proceed via electronic and/or vibrational excited states of nitrogen and hydrogen @guerra_tejero-del-caz_pintassilgo_alves_2019. In this case, the description requires adopting a state-to-state kinetic approach, which considers each state as a distinct species with its own set of reactions and transport properties. Although the approach increases the complexity of the model, it is essential for accurately describing the main kinetic pathways.

Therefore, the set of heavy species in the $N_2-H_2$ chemical kinetics encompasses not only ground-state atoms and molecules, but also their excited states. The complete species set includes:
- *Ground-state molecules*: $N_2(X, v=0)$, $H_2(X, v=0)$, $N H_3(X)$
- *Vibrationally excited states*: $N_2(X, v=1dash 44)$, $H_2(X, v=1dash 14)$
- *Atomic radicals*: $N(""^4 S)$, $N(""^2 D)$, $N(""^2 P)$, $H(""^1 S)$, $H(""^2 S)$, $H(""^2 P)$, $H(n=3dash 5)$
- *Molecular radicals*: $N H(X)$, $N H_2(X)$, and intermediate hydrazine-like species $N_2 H(X)$, $N_2 H_2(X)$, $N_2 H_3(X)$, $N_2 H_4(X)$
- *Electronically excited states*: $N_2(A ""^3 Sigma_u^+)$, $N_2(B ""^3 Pi_g)$, $N_2(C ""^3 Pi_u)$, $N_2(a' ""^1 Sigma_u^-)$, $N_2(a ""^1 Pi_g)$, $N_2(w ""^1 Delta_u)$
- *Positive ions*: $N_2^+(X)$, $N_2^+(B ""^2 Sigma_u^+)$, $N_3^+$, $N_4^+$, $N^+$, $H_2^+$, $H_3^+$, $H^+$, $N H^+$, $N H_2^+$, $N H_3^+$, $N H_4^+$, $N_2 H^+$
- *Negative ions*: $H^-$, $N H_2^-$
- *Surface species*: $"wall"_F(v)$ (free sites), $"wall"_S(v)$ (strongly bound sites), and adsorbed radicals $"wall"_N(F \/ S)$, $"wall"_H(F \/ S)$, $"wall"_(N H)(S)$, $"wall"_(N H_2)(S)$

Key volume processes, involving electron and heavy-species collisions with these states, include *Electronic excitation*, *Vibrational excitation* (encopassing _e-V, E-V, V-V, V-T_ processes), *Dissociation*, *Ionization*, *Recombination*, *Attachment*, *Detachment*, *Charge-transfer*, and other neutral-neutral and ion-neutral reactions. Additionally, *Radiative transitions* account for spontaneous decay of excited states, and *Transport processes* describe species losses to reactor walls and flow dynamics.

The complete kinetic scheme, including all reactions (main volume and surface processes) with their rate coefficients and cross-section references, is available in the `.chem` format file in the GitHub repository at #link("https://github.com/mr-arpg/LoKI-B/tree/variable-energy-grid/Code/Input")[https://github.com/mr-arpg/LoKI-B/tree/variable-energy-grid/Code/Input].
 
=== Computational Methodologies

The solution of a plasma chemistry model uses two main computational blocks: a Boltzmann equation solver to describe the electron kinetics and determine the electron transport parameters and rate coefficients, and a chemistry solver to handle the time evolution of the heavy-species densities @loki_manual.

The *LisbOn KInetics Chemical solver (LoKI-C)* is the counterpart to LoKI-B within the LoKI suite. It is a 0D (volume-averaged) solver that integrates the system of rate balance equations (@rate-balance-eq) for all relevant charged and neutral species in the plasma, both in the volume and on the surfaces @loki_manual. 

Other notable 0D plasma chemistry solvers include ZDPlaskin (University of Toulouse) @ZDPlasKin, which provides coupled electron-heavy species kinetics with extensive reaction databases and automated cross-section interpolation for plasma chemistry.

To achieve a self-consistent solution for the plasma state, the electron kinetics and the heavy-species chemistry must be coupled, as the EEDF influences the electron-impact rates, and in turn, is influenced by the gaseous mixture composition defined by the chemical reactions @guerra_tejero-del-caz_pintassilgo_alves_2019. For simulations that resolve the time evolution of the plasma, the coupling between the electron and heavy-species kinetics can be handled with different numerical schemes. Explicit coupling involves solving the EBE and the chemistry equations sequentially in time; for a given time step, the plasma state is advanced using rates from the previous time step, and then the chemistry is advanced. This approach is straightforward to implement but can suffer from numerical instability, requiring very small time steps if the system is "stiff" (i.e., contains processes with vastly different timescales) @hagelaar2005solving@wang_bogaerts_2016. Implicit coupling, in contrast, solves the equations for the plasma and chemistry simultaneously as a single coupled system at each time step. This method is unconditionally stable and allows for much larger time steps but is significantly more complex to implement as it requires solving a large non-linear system of equations @alves2018foundations@kushner_2009.    

#v(.5cm)

LoKI-B+C does not adopt a time-dependent coupling between the electron and heavy-species kinetics. Instead, it uses a strategy based on a quasi-stationary iterative, self-consistent loop @loki:   
+ *Setup*: Definition of the workking conditions for the geometry of the reactor, the gas temperature and pressure, the surface site density, the wall temperature and the discharge current.

+ *Initialization*: The simulation starts with an initial guess for the gas composition (i.e., the densities of all heavy species), the electron density , $n_e$, and the reduced electric field, $E\/N$.

+ *Electron kinetics (LoKI-B)*: Using the current gas composition and $E\/N$, LoKI-B solves the EBE to compute the EEDF and the full set of electron transport parameters and rate coefficients.

+ *Heavy-species kinetics (LoKI-C)*: The electron macroscopic parameters from LoKI-B are passed to LoKI-C that solves the system of rate balance equations for all heavy species, calculating their densities until steady-state.

+ *Neutrality iteration*: The values of $n_e$ and $E\/N$ are adjusted to ensure the fixed discharge current and to satisfy the neutrality condition ($n_e approx sum_i n_i$, with $n_i$ the number density of the ions). The process repeats from Step 3.

+ *Global iteration*: The newly calculated steady-state densities define an updated gas composition, which is fed into LoKI-B. The process repeats from Step 3. The entire loop continues until the species densities, discharge current and the reduced electric field all converge to stable, self-consistent values.

The numerical workflow employs several iterative cycles with specific convergence criteria@loki_manual. Within LoKI-B, the solution of the EBE adopts different convergence thresholds depending on the strength of nonlinear effects. For weakly nonlinear cases (e.g., low electronegativity and ionization degree), the code uses a mixing of solutions to converge over the temporal or spatial growth parameter ($chevron.l nu_(r m space e f f) chevron.r \/ N$ or $alpha_(r m space e f f) \/ N$), requiring relative differences below $10^(-10)$ between consecutive iterations, while the EEDF convergence is set to relative variations below $10^(-9)$ (user-prescribed via `maxEedfRelError`). When electron-electron collisions are included, a Newton-Raphson-based approach converges over the ratio $Theta_(e e) \/ Theta_(r m space r e f)$ with relative differences below $tilde 10^(-9) - 10^(-10)$, and the EEDF below $10^(-9)$. For strongly nonlinear effects, a time-dependent relaxation method with MATLAB's `ode15s` solver is recommended, with typical parameters of relative tolerance $tilde 10^(-6)$, absolute tolerance $tilde 10^(-300)$, and maximum step-size $tilde 10^(-7)$.

Within LoKI-C, the _pressure cycle_ ensures constant-pressure calculations by checking if $sum_k N_k = N$ and adjusting the gas density until relative differences in pressure fall below $10^(-5)$ (typical value). The _neutrality cycle_ couples LoKI-C and LoKI-B, adjusting $E\/N$ to satisfy the neutrality condition $sum_(k_p) N_(k_p) - sum_(k_n) N_(k_n) = n_e$, with a convergence criterion of relative neutrality values normalized to the electron density below $10^(-8)$ (typical). Finally, the _global cycle_ converges over the populations of heavy species, requiring relative variations of electron swarm parameters below $10^(-4)$ (typical) between consecutive iterations. At steady-state convergence, the relative rate-balance for each state is typically found below $tilde 10^(-10)$ @loki_manual.

== Machine Learning in Plasma Chemistry <ml-plasma-chemistry>
The detailed chemical kinetic mechanisms required for accurate plasma modeling can become computationally prohibitive, often involving thousands of reactions and dozens of species. This "curse of dimensionality" makes it impractical to include such detailed chemistry in spatially resolved (2D or 3D) reactor simulations. *Machine learning (ML)* has emerged as a powerful, data-driven paradigm to address this challenge by enabling the automated reduction of complex reaction schemes @shen_jacob_santillana_bates_zhuang_chen_2022@Kelly_2023@kumar_2025.

Automated scheme's reduction objective is to generate a minimal, or "skeletal," kinetic model that accurately reproduces the macroscopic behavior (e.g., in present case, the densities of key species like $N H_3$, $N(""^4 S)$, $H(""^1 S)$, $N_2(A)$) of the original, full mechanism, but at a fraction of the computational cost. Traditional reduction methods often rely on sensitivity analysis or reaction flow analysis @turner_2015@terraz_2020@koelman_2019, which can be laborious, since it envolves an extremely high number of simulations. Machine learning offers an alternative approach by learning the most important reaction pathways directly from data generated by the full model. Instead of relying on local sensitivity coefficients, ML models can learn a global representation of reaction importance across a wide range of plasma conditions, providing a more robust basis for model reduction @ferreira2024machine. To apply machine learning techniques to a chemical reaction network, a formal mathematical representation of the network is required. Petri nets @petri_reisig_2008 provide an intuitive and powerful framework for this purpose.   

#figure(
  image("..\Images\petri.jpg", width: 80%),
  caption: [
    Example of Petri net for the reaction $N_2 + 3 H_2 arrow 2 N H_3$
  ],
)<petri-net>

A *Petri net* is a directed bipartite graph consisting of two types of nodes. Represented by circles, _*places*_ correspond to the chemical species in the system. @petri-net represents an example of a Petri net for one reaction synthetizing $N H_3$. Represented by thin dark rectangles, _*transitions*_ correspond to the chemical reactions. Arcs connect places with inputs/reactants to transitions, and transitions to places with outputs/products. The numbers in these conections correspond to the stoichiometric coefficients of the reactants and products in the chemical reaction. The state of the system is defined by a "marking," which is the number of *_tokens_* ("black dots") in each place, corresponding to the concentration or number density of each species @ferreira2024machine@petri_reisig_2008.   

The structure and stoichiometry of the entire reaction network can be encoded in a single incidence matrix, often denoted as $A$. For a system with $n$ species and $m$ reactions, $A$ is an $n times m$ matrix where the element $A_(i j)$ represents the net change in the number of molecules of species $i$ resulting from one occurrence of reaction $j$. Reactants have negative stoichiometric coefficients, and products have positive ones. The evolution of the vector of species concentrations, $y$, from an initial state $b$ after a vector of reaction occurrences (or fluxes), $x$, can be expressed concisely in matrix form @ferreira2024machine:

$
y = A x + b
$<petri-net-equation>

This linear algebraic representation is well-suited for integration with ML algorithms. A ML framework can be designed to learn the reaction flux vector $x$ that best explains the transformation from an initial species distribution $b$ to a final one $y$, as observed in simulations. This approach will be further discussed in @ml.
