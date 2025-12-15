#import "@preview/thesist:1.0.2": flex-caption, subfigure-grid
#show figure: set block(breakable: true)

= Tool Development

== Variable Energy Grid Implementation in LoKI-B

The implementation of a non-uniform energy grid in LoKI-B represents a significant advancement in computational efficiency for solving the EBE. Traditional Boltzmann equation solvers employ uniform energy grids, which, while straightforward to implement, prove inefficient for molecular gases where the cross sections exhibit complex structures with sharp features at low energies and smooth decay at high energies @hendrikx2025nonuniform. The variable energy grid implementation addresses these limitations by providing fine resolution where needed and coarse resolution elsewhere, thereby optimizing both computational cost and accuracy.

In traditional implementations with uniform grids, the energy workspace is divided into $N$ equally-spaced cells with constant step-size $Delta u$. However, the EEDF typically varies by many orders of magnitude (10 to 25 decades) between low and high energies, with many relevant physics phenomena occurring at low energies where collision cross sections are larger. This motivates the use of a non-uniform grid that concentrates grid points where they are most needed.

The non-uniform energy grid is defined in the energy workspace $[0, u_max]$ adopting a variable energy step-size $Delta u_n$ for $n = 1, 2, dots, N$, where each cell $n$ has energy $u_n^"cell" equiv u_n = sum_(p=1)^n Delta u_p - Delta u_n\/2$, defined at the middle point of the cell. Each cell is bounded by nodes $n$ and $n+1$, with node energies given by:

$ u_n^"node" = u_n - Delta u_n\/2 = u_(n+1)^"node" - Delta u_n $

$ u_(N+1)^"node" = sum_(p=1)^N Delta u_p equiv u_max" ." $

To provide fine resolution at low energies, this work constructs the variable grid using a geometric progression where consecutive energy steps grow according to:

$ Delta u_(n+1) = a Delta u_n = a^n h, quad a > 1 $

where $h equiv Delta u_1$ is the minimum energy step and $a$ is the progression ratio. This yields node energies:

$ u_n^"node" = h(1 + a + a^2 + dots + a^(n-2)) = h (1 - a^(n-1))/(1-a)" ." $

For $a = 1$, the formulation retrieves the uniform grid with constant step-size $h$. In general, the progression ratio $a$ is determined from the maximum energy by solving:

$ u_max = h (1 - a^(N))/(1-a)" ." $

This transcendental equation is solved iteratively using the Newton-Raphson method applied to the function:

$ F(a) = exp[(ln[u_max\/h (a-1) + 1])/(N)] - a = 0$

with the iterative update:

$ d a = -F(a)/(F'(a)) = -(exp[dots] - a)/([u_max]/([u_max (a-1)+h] N) exp[dots])" ." $

Typical values for the progression ratio range from $a approx 1.05$ to $1.10$, providing optimal balance between resolution and computational cost.

The discretization adopts a finite-volume-like procedure, defining the EEDF $f$ at grid cells, as usually done in uniform grids, and the first-anisotropy $f^1$ and flux functions $G$ at grid nodes, as update to the usual procedure for uniform grids. Linear interpolation between cells and nodes is achieved through weighted averages. For the EEDF at node $n+1$:

$ f_(n+1)^"node" = [(f_(n+1))/(Delta u_(n+1)) + (f_n)/(Delta u_n)] [(Delta u_(n+1) Delta u_n)/(Delta u_(n+1) + Delta u_n)] = w_n f_(n+1) + (1-w_n) f_n $

where the weight factor is:

$ w_n equiv (Delta u_n)/(Delta u_(n+1) + Delta u_n) = 1/(1 + a)" ." $

For uniform grids, $w_n = 1\/2$ and the interpolation reduces to the arithmetic mean. 

The energy difference between adjacent cells is:

$ u_(n+1) - u_n = (Delta u_(n+1) + Delta u_n)/2 = (Delta u_n)/(2w_n) $

#v(.5cm)

In this work, the variable energy grid was utilized only for the discretization of the continuous operators of the EBE, as described in @Alves2025Lokijun:

- The electric field operator, 
- The elastic collisions operator,
- The continuous approximation for rotation (CAR) operator,
- The electron-electron collisions operator.

The discretization scheme is designed to preserve fundamental physical conservation laws, such as particle conservation and energy conservation. For example: the normalization condition satisfies 

$ integral_0^infinity f(u) sqrt(u) d u = 1 arrow.r sum_(n=1)^N f_n sqrt(u_n) Delta u_n = 1" ;" $

#v(-.5cm)

the continuous operator for the electric field, elastic collisions, and CAR are discretized according to @Alves2025Lokijun:


$
  - 1/N 1/gamma (d G_x(u))/(d u) |_n =
$
#v(0cm)


#align(left)[
  #h(5cm)
  $=  (g_(x_n)^"node")/(Delta u_n) [c_x (2w_(n-1))/(Delta u_(n-1)) - d_x (1-w_(n-1))] f_(n-1) \
  - (g_(x_(n+1))^"node")/(Delta u_n) [c_x (2w_n)/(Delta u_n) - d_x (1-w_n)] f_n 
  - (g_(x_n)^"node")/(Delta u_n) [c_x (2w_(n-1))/(Delta u_(n-1)) + d_x w_(n-1)] f_n \
  + (g_(x_(n+1))^"node")/(Delta u_n) [c_x (2w_n)/(Delta u_n) + d_x w_n] f_(n+1)
$ <eq-discrete-G>]

#v(.5cm)

for $gamma equiv sqrt(2e slash m_e)$, $g_x(u)$ derived from the upflux function $G_x(u)$, with a definition for each $x={E, "el", "CAR"}$ (please refer to @Alves2025Lokijun), $c_x$ and $d_x$ being operator-dependent constants and where the flux boundary conditions $G(0) = G(u_max) = 0$ ensure proper behavior at the grid boundaries, implying $g_x^"node"_1 = g_x^"node"_(N+1) = 0$ and $u_1^"node" f_1^"1,node" = u_(N+1)^"node" f_(N+1)^"1,node" = 0$; and the matrix elements of the electron-electron collision operator $a_(n,m)$, $b_(n,m)$, are defined to ensure energy conservation through the relationship @Alves2025Lokijun

$ (Delta u_n)/(2w_n) a_(n,m) - (Delta u_(n-1))/(2w_(n-1)) b_(n,m) = -(Delta u_m)/(2w_m) a_(m,n) + (Delta u_(m-1))/(2w_(m-1)) b_(m,n)" ," $

which yields

$ a_(m,n) = (w_(m) Delta u_(n-1))/(w_(n-1) Delta u_(m)) b_(n,m)" ," $

and to yield a Maxwellian distribution for collisional equilibrium under electron-electron collisions alone, which is achieved by balancing upper and lower matrix elements @Alves2025Lokijun:

$ 
b_(n,m) = sqrt((w_(n-1))/(w_m) (Delta u_m) / (Delta u_(n-1)) exp[1/T_e ((Delta u_(n-1))/(2w_(n-1)) - (Delta u_m)/(2w_m))] b_(m+1,n-1) times b_(n,m) )", " \

1≤n≤N "; " 1≤m≤N−1
$

where $T_e$ is the electron temperature calculated from the EEDF.


=== Variable Energy Grid Benchmark

The discretization of the energy domain is a critical factor in the Boltzmann solver, directly influencing both the accuracy of the computed EEDF and the computational cost of the simulation. A variable-step grid, which concentrates points in regions of high variation (typically at low energies), is hypothesized to offer superior efficiency over a standard uniform grid, especially for large decays in the EEDF. To quantify this, a benchmark analysis was performed comparing results for a uniform energy grid against a variable-step grid based on a geometric progression.

Initial verification was conducted using known analytical solutions for a Maxwellian and Druyvesteyn distributions, to ensure the correct implementation of both grid types. @maxwellian-elastic-comparison (left) presents the numerical EEDF calculated for $E/N$ = 0 Td at the gas temperature of 300 K, for both uniform and variable-step grids, along with an analytical Maxwellian distribution at the same temperature. The numerical calculations were done using *$Delta u = 5 dot 10^(-3)$*eV for the uniform energy grid and a smaller first step size of *$h = 10^(-3)$*eV for the variable-step grid, yet adopting the same *1000* grid points and maximum energy of 5 eV. In both the uniform and variable grids, EEDFs are visually indistinguishable from the analytical distribution, confirming the correct implementation of the elastic collision operator. However @maxwellian-elastic-comparison (middle) shows relative errors between the numerical and analytical EEDFs for the variable-step grid, in the range of 2-50% for uniform grid calculations and 2-85% for variable-step grid calculations, the error increasing with energy. The larger errors obtained for the variable-step grid are due to the fact that the last large energy intervals are for very low values of the EEDF ($< < 10^(-20)$eV$""^(-3/2)$). Conversely, at at low energies the relative error for the variable-step grid is smaller than the uniform grid. Overall, the mean relative error depicted in @maxwellian-elastic-comparison (right), corresponding to the mean absolute value of the EEDF relative errors across the energy range, is smaller for the variable-step grid, remaining below 30% for both grid types.

#figure(
  image("../Images/benchmark/maxwellian_elastic_comparison.png", width: 95%),
  caption: [Comparison between variable-step and uniform energy grid implementations for solution of the EBE, under the sole influence of the elastic collisional operator ($E/N$ = 0 Td and $T_g$ = 300 K), with an analytical Maxwellian distribution at the same gas temperature. Left: EEDF comparison. Middle: Relative error vs energy. Right: Mean relative error for both grid types. Results were obtained for a 1000 grid points and $u_max = 5$ eV, using $Delta u = 5 dot 10^(-3)$eV and $h = 10^(-3)$eV for the uniform and variable-step grids, respectively.]
)<maxwellian-elastic-comparison>

@maxwellian-ee-comparison presents a verification similar to the previous one, but considering the presence of electron-electron collisions in addition to elastic collisions. In this case the numerical results were obtained for $E\/N$ = 1 Td and $T_g$ = 300 K at the electron density of $10^20$ m$""^(-3)$ and an ionization degree of $3 dot 10^(-3)$. These results were compared with an analytical Maxwellian distribution at the electron temperature of $\~ 0.15$ eV obtained from the numerical solution. As before, the EEDFs are visually indistinguishable being associated to relative errors below 2% (7%) and mean relative errors below 0.4% (2%) for the variable-step grid (uniform grid).


#figure(
  image("../Images/benchmark/maxwellian_ee_comparison.png", width: 95%),
  caption: [As in @maxwellian-elastic-comparison, but considering the presence of electron-electron collisions in addition to elastic collisions at $E/N$ = 1 Td, $T_g$ = 300 K, $n_e = 10^20$ m$""^(-3)$ and an $frac(n_e, N) = 3 dot 10^(-3)$. The analytical Maxwellian distribution is for $T_e approx 0.15$eV obtained from the numerical solution.]
)<maxwellian-ee-comparison>

 Similarly, @druyvesteyn-comparison compares numerical and analytical results under conditions for a Maxwellian distribution created with ficticious collision frequencies set to a constant value ($nu_c = 3,54 dot 10^(-9)"s"^(-1)$).
 
 The results in @druyvesteyn-comparison (left) show that the EEDFs exhibit a very small decay with energy, as a result of the very high $E/N$ adopted. In this case, choosing the variable-step grid yielded relative errors larger than uniform grid, as shown in @druyvesteyn-comparison (middle and right). However, the mean relative errors are very small, below 0.14% for both grid types.

#figure(
  image("../Images/benchmark/druyvesteyn_comparison.png", width: 95%),
  caption: [As in @maxwellian-elastic-comparison, but for the conditions of a Maxwellian distribution at $E\/N$ = 100 Td, $T_g$ = 300 K and $nu_c = 3,54 dot 10^(-9)"s"^(-1)$ for $H_2$.]
)<druyvesteyn-comparison>


The advantage in using a variable-step grid is quantified in @efficiency-analysis and @grid-convergence-analysis, which present a convergence analysis. The results in @efficiency-analysis show that relative errors between calculations using a variable-step grid and a uniform grid decrease as the number of grid points is increased, remaining below 2% even when using only 20% of the points of the uniform grid (200 vs 1000 points, representing an 80% reduction). @grid-convergence-analysis confirms that the results obtained with a variable-step grid converge towards those of a comparable uniform grid, as the number of grid points increases.


#subfigure-grid(  
  
  figure(
    image("../Images/benchmark/efficiency_error_evolution.png", width: 79%),
    caption: []
  ), <efficiency-analysis>,
  figure(
    image("../Images/benchmark/grid_convergence_analysis.png", width: 100%),
    caption: []
  ), <grid-convergence-analysis>,
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  caption: [(a) Relative errors between variable-step and uniform energy grids for mean energy (blue) and drift velocity (orange) as a function of the percentage of points of the uniform grid ($N = 1000$ points). (b) mean energy as a function of the number of grid points for a variable-step grid (blue) and uniform grid (red). In all simulations $u_max = 10$ eV and $h = 10^(-3)$ eV.]
)


== Input Graphical User Interface Development

The development of an input graphical user interface (GUI) for LoKI-B addresses the accessibility barrier presented by command-line configuration of electron kinetics simulations. Implemented using MATLAB's App Designer framework, the GUI organizes simulation parameters into a hierarchical data structure (`Setup`) mirroring LoKI-B input files, with sections for `Working Conditions`, `Electron Kinetics`, `Gas Properties`, `State Properties`, `Numerics`, and `Output` (see @gui1).

#figure(
  image("../Images/gui1.png", width: 80%),
  caption: [`Working Conditions` tab of the Input GUI for LoKI-B.]
)<gui1>

Each section occupies a dedicated tab with grouped parameter panels. The interface provides dynamic bidirectional binding between visual elements and the underlying data structure, supporting both scalar values and MATLAB-generated arrays (e.g., `logspace(-3,3,100)`) for parameter sweeps. Key features include: integrated file browsers for cross-section and database files with automatic path validation; automatic normalization verification for gas mixture fractions; flexible state property specification using predefined functions (`harmonicOscillatorEnergy`, `boltzmannPopulation@gasTemperature`) or custom values; and real-time parameter validation with visual feedback (red/green indicators) for numeric limits and file existence.

The GUI automatically generates properly formatted input files compatible with LoKI-B syntax. The `Generate & Run` button streamlines workflow by creating timestamped input files and directly invoking the `lokibcl` solver, eliminating context switching between configuration and execution environments. The interface maintains full diagnostic capabilities of the original solver while reducing configuration complexity, serving both research workflows and educational applications. Available at https://github.com/mr-arpg/LoKI-B.





== Exploratory ML Approaches for Plasma Chemistry Reduction <ml>

The analysis of LTP chemistry involves complex reaction networks comprising hundreds of mechanisms. This section details an exploratory ML framework developed to infer reaction pathway importance, thereby enabling the reduction of complex chemical schemes.

The approach utilizes a representation of the chemical scheme inspired by Petri nets, which translates the problem of identifying important reactions into a mathematical optimization task. As discussed in @ml-plasma-chemistry, a transition is enabled to fire if its input places contain a sufficient number of tokens. When a transition fires, it removes tokens from its input places and adds tokens to its output places, according to the reaction stoichiometry.

The structure and dynamics of a Petri net can be represented mathematically in matrix form (see @matrix-formulation) and the relationship between these components is described by the linear approximation @petri-net-equation. 

The system $y = A x + b$ is typically under-determined, meaning the number of reactions ($m$) is much larger than the number of species ($n$). The goal of the ML approach is to find an approximation, $tilde(x)$, for the firing vector $x$ (reaction weights) that minimizes the difference between the predicted final marking $tilde(y) = A tilde(x) + b$ and the observed final marking $y$.

The ML model explored, proposed by Ferreira _et al._ @ferreira2024machine, enforces physical constraints through standard constructs. Every element in the approximated firing vector, $tilde(x)$, must be non-negative ($tilde(x)_i gt.eq 0$), as negative reaction rates are disallowed. This constraint is enforced using the Rectified Linear Unit (ReLU) function @nair2010rectified:

$ op("ReLU")(tilde(x)_i) = max(0, tilde(x)_i)" ." $

The input $b$ and output $y$ fractions are typically normalized (expressed in percentages). Normalization must be done separately for volume species ($V$) and surface species ($S$). This is enforced using the softmax function @bridle_1990 (see @softmax-function):

$ 
op("softmax")((A op("ReLU")(tilde(x)) + b)_(i in V,S)) = tilde(y)_(i in V,S) 
$

The model runs iteratively via gradient descent (specifically, the Adam optimizer @kingma2014adam) to minimize a loss function $cal(L)(tilde(x))$. Since $y$ and $tilde(y)$ are normalized distributions, the loss function used is the Kullback–Leibler (KL) divergence @kullback_leibler_1951, which measures the information lost by approximating the true distribution $y$ with the predicted distribution $tilde(y)$.

The ML framework was applied to argon-test oversimplified chemistry as a testbed for the methodology. This simple model was chosen test case to validate the approach, before applying it to the significantly more complex N₂-H₂ kinetic scheme required for ammonia synthesis modeling @ferreira2024machine@henriques2024mlplasma. The argon-test system provides a manageable number of species and reactions while still capturing the essential physics of electron-impact processes, metastable state dynamics, radiative decay and ionization-recombination balance. 



#subfigure-grid(
  figure(
    image("../Images/ml/axb.png", width: 120%),
    caption: []
  ),<matrix-formulation>,
  figure(
    image("../Images/ml/softmax.png", width: 89%),
    caption: []
  ),<softmax-function>,
  
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 5.5cm,
  caption: [Matrix formulation of the Petri net dynamics for the testbed $A r$ chemical scheme (a) and softmax function graph representation (b).]
)


This simplified chemical scheme considers ground-state argon $A r(""^1 S_0)$, metastable states $A r(""^3 P_2)$, $A r(""^3 P_0)$, resonant states $A r(""^3 P_1)$, $A r(""^1 P_1)$, and argon ions $A r^+(""^2 P_0)$. The scheme includes electron-impact inelastic/superelastic collisions with both ground and excited states, including ionization, radiative decay, heavy-species collisions, and transport to walls, which are represented in @argon-petri-net.


#figure(
  image("../Images/ml/pnArgon.png", width: 95%),
  caption: [Petri net representation of $A r$-test plasma chemistry. Species are represented by blue circles (places) and reactions by green rectangles (transitions). The color-coded arrows indicate different reaction types: excitation (blue), which refers to electron-impact processes from ground-state species, metastable transitions (purple), refering to electron-impact processes involving metastable and radiative states $A r(""^3 P_2)$, $A r(""^3 P_1)$, $A r(""^3 P_0)$, $A r(""^1 P_1)$, ionization (red), radiative decay (green), heavy collisions (yellow), transport to wall (pink), and electron destruction (gray).]
)<argon-petri-net>


Note that in @argon-petri-net, the "pseudo-species" `2e` (two electrons) is displayed separately from `e` (electron) for visual clarity only. Moreover, bidirectional arrows (e.g., $e + A r(""^1 S_0) arrow.l.r e + A r(""^3 P_2)$) represent forward and reverse reactions as implemented in the model.

A fundamental technical challenge emerged during implementation related to the construction of the stoichiometric matrix $A$: reactions that are physically distinct become mathematically indistinguishable in the matrix representation. This important degeneracy problem is in part, but not exclusively, related with the “pseudo-species” `wall`, which is included in the Petri net representation (@argon-petri-net) for completeness, but it is not yet incorporated in the matrix formulation.

For instance, consider the reverse electron-impact deexcitation $e + A r(""^3 P_2) -> e + A r(""^1 S_0)$ and the wall de-excitation $A r(""^3 P_2) + "wall" -> A r(""^1 S_0)$. In the current implementation of matrix $A$, electrons appearing on both sides of a reaction are reduced to zero stoichiometric coefficient ($+1 - 1 = 0$), effectively removing them from the balance equation; additionally, the "pseudo-species" `wall` is not included in the matrix $A$. Consequently, both reactions map to an identical column in $A$: a decrease in $A r(""^3 P_2)$ and an increase in $A r(""^1 S_0)$, with no other species involved. This mathematical equivalence prevents the ML model from distinguishing between fundamentally different physical processes, corrupting the learned reaction weights. As mentioned, the problem is not exclusive of wall reactions and is also found in heavy-species quenching collisions that confuse with electron-impact deexcitations.   

Several potential solutions exist to resolve this degeneracy. The most straightforward approach is to explicitly treat `wall` as a distinct species in the matrix formulation, allowing wall-mediated reactions to be properly distinguished by their stoichiometric signature. However, the degeneracy involving heavy-species collisions would still be unresolved. Alternatively, a dual-matrix representation could be implemented: one matrix containing the full stoichiometry (including spectator species like electrons) for reaction identification, and another containing the reduced stoichiometry for species balance calculations. A third approach involves augmenting each reaction with metadata such as rate coefficients or reaction type tags, enabling the framework to differentiate reactions even when their net stoichiometry is identical. Implementation of these solutions remains as future work.

Another implementation issue concerns the enforcement of non-negativity constraints on reaction weights and the normalization of species fractions. The current approach applies the ReLU activation function to enforce $tilde(x)_i gt.eq 0$, followed by the softmax function to normalize the predicted species fractions $tilde(y)$. However, this sequential application introduces a subtle inconsistency: the softmax function is designed to normalize vectors that may contain negative values by first applying an exponential transformation, thereby mapping the entire real line to positive values. When softmax receives an input batch that has been previously constrained to be non-negative by ReLU, it may perform a deficient normalization, potentially leading to unfair weighting in the normalization process.

This issue motivates the exploration of more rigorous constrained optimization frameworks. Karush-Kuhn-Tucker (KKT) conditions @kuhn_1951@karush_2013 provide a theoretically sound alternative by directly incorporating inequality constraints ($x_i gt.eq 0$) and equality constraints ($sum_i y_i = 1$) into the optimization framework. KKT conditions generalize Lagrange multipliers to handle both types of constraints simultaneously, allowing the system to solve the constrained optimization problem directly without relying on ad-hoc activation functions or penalty terms to enforce physical constraints after the fact. Implementation of KKT-based solvers or interior-point methods could significantly improve both the mathematical rigor and the convergence behavior of the solution, though at the cost of increased algorithmic complexity.

Upon convergence, the approximate firing vector $tilde(x)$ provides the weights for each reaction. Reactions for which $tilde(x)_i lt lt 1$ have a small contribution and are considered candidates for removal, thereby reducing the chemical scheme. The resulting reaction weights provide rankings of chemical pathway importance, enabling identification of rate-limiting steps and key species production mechanisms. The algorithm could be further trained by incorporating a statistical analysis of results generated with randomly created inputs.

The complete analysis framework, including data processing scripts, and visualization routines, is publicly available at #link("https://github.com/mr-arpg/PlasmaNetwork")[https://github.com/mr-arpg/PlasmaNetwork].
