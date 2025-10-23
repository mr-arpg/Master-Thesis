#import "@preview/thesist:1.0.2": flex-caption, subfigure-grid
#import "@preview/glossarium:0.5.6": gls, glspl

= Mathematical Derivations

== Complete derivation of the Electron Boltzmann Equation

=== Kinetic theory foundation
The electron Boltzmann equation is derived from the fundamental principles of kinetic theory. Consider a system of electrons in a plasma, where the electron distribution function $f(arrow(v), arrow(r), t)$ describes the number of electrons per unit volume in velocity space at position $arrow(r)$ and time $t$.

The total time derivative of the distribution function is given by:

$frac(d f, d t) = frac(partial f, partial t) + arrow(v) dot nabla_r f + arrow(a) dot nabla_v f$

where $arrow(a)$ is the acceleration due to external forces.

=== Force term derivation
In a plasma, the main force acting on electrons is the electric field force:

$arrow(F) = -e arrow(E)$

where $e$ is the electron charge and $arrow(E)$ is the electric field. The acceleration is then:

$arrow(a) = frac(arrow(F), m_e) = -frac(e arrow(E), m_e)$

where $m_e$ is the electron mass.

=== Collision integral formulation
The collision integral represents the rate of change of the distribution function due to collisions:

$(frac(partial f, partial t))_"coll" = integral integral [f(arrow(v)') f(arrow(v)_1') - f(arrow(v)) f(arrow(v)_1)] sigma(arrow(v), arrow(v)_1) d arrow(v)_1 d Omega$

where $sigma(arrow(v), arrow(v)_1)$ is the differential cross-section for electron-molecule collisions, and the primed velocities represent post-collision velocities.

=== Final equation form
Combining all terms, the electron Boltzmann equation becomes:

$frac(partial f, partial t) + arrow(v) dot nabla_r f - frac(e arrow(E), m_e) dot nabla_v f = (frac(partial f, partial t))_"coll"$

This equation describes the evolution of the electron velocity distribution function in the presence of external electric fields and collisions.

== Two-term approximation mathematical details

=== Spherical harmonic expansion
The two-term approximation expands the velocity distribution function in spherical harmonics:

$f(arrow(v)) = f_0(v) + frac(arrow(v), v) dot arrow(f)_1(v)$

where $f_0(v)$ is the isotropic part and $arrow(f)_1(v)$ is the anisotropic part.

=== Isotropic equation derivation
For the isotropic part, the Boltzmann equation becomes:

$frac(partial f_0, partial t) + frac(e E, 3 m_e v^2) frac(partial, partial v)(v^2 f_1) = (frac(partial f_0, partial t))_"coll"$

where $E$ is the magnitude of the electric field and $f_1$ is the magnitude of the anisotropic part.

=== Anisotropic equation derivation
For the anisotropic part, the equation becomes:

$frac(partial f_1, partial t) + frac(e E, m_e) frac(partial f_0, partial v) + nu_m f_1 = 0$

where $\nu_m$ is the momentum transfer collision frequency.

=== Collision terms
The collision terms for the two-term approximation are:

$(frac(partial f_0, partial t))_"coll" = sum_j integral_0^infinity [f_0(v') N_j sigma_j(v') v' - f_0(v) N_j sigma_j(v) v] d v'$

where $N_j$ is the density of species $j$ and $sigma_j(v)$ is the total cross-section for collisions with species $j$.

== Discrete operator derivations for variable grids

=== Finite difference approximations
For a variable energy grid with energy points $epsilon_i$, the finite difference approximations are:

$frac(partial f, partial epsilon) approx frac(f_(i+1) - f_i, epsilon_(i+1) - epsilon_i)$

$frac(partial^2 f, partial epsilon^2) approx frac(2, epsilon_(i+1) - epsilon_(i-1)) (frac(f_(i+1) - f_i, epsilon_(i+1) - epsilon_i) - frac(f_i - f_(i-1), epsilon_i - epsilon_(i-1)))$

=== Conservation-based discretization
To ensure conservation properties, the discrete operators are constructed to satisfy:

$sum_i f_i Delta epsilon_i = "constant"$ (particle conservation)

$sum_i f_i epsilon_i Delta epsilon_i = "constant"$ (energy conservation)

where $Delta epsilon_i$ is the energy interval around point $i$.

=== Matrix formulation
The discrete operators can be written in matrix form:

$A f = b$

where $A$ is the coefficient matrix, $f$ is the vector of distribution function values, and $b$ is the source term vector.

The matrix elements are constructed to ensure:
- Conservation properties
- Numerical stability
- Accuracy requirements

== Conservation laws in discretized form

=== Particle conservation
Particle conservation in discretized form requires:

$sum_i f_i Delta epsilon_i = N_e$

where $N_e$ is the total electron density.

This is enforced by:
- Proper boundary conditions
- Conservation-based discretization schemes
- Source term balancing

=== Energy conservation
Energy conservation requires:

$sum_i f_i epsilon_i Delta epsilon_i = E_"total"$

where $E_"total"$ is the total electron energy.

Energy conservation is maintained through:
- Proper treatment of energy exchange in collisions
- Accurate representation of electric field work
- Conservation-based numerical schemes

=== Positivity preservation
The distribution function must remain positive:

$f_i >= 0$ for all $i$

This is ensured by:
- Positive-definite discretization schemes
- Proper boundary conditions
- Source term limitations

=== Numerical implementation
The conservation laws are implemented numerically through:

*Constraint equations*: Additional equations that enforce conservation
*Penalty methods*: Adding penalty terms to the discretized equations
*Projection methods*: Projecting the solution onto the conservation manifold
*Adaptive schemes*: Adjusting the discretization to maintain conservation

The numerical implementation ensures that the physical conservation laws are satisfied to within numerical precision, providing confidence in the accuracy of the computed solutions.
