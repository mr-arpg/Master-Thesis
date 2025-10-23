= Kinetic Data Compilation

== Complete rate coefficient database

=== Electron-impact cross-sections
Comprehensive compilation of electron-impact cross-sections for N₂ and H₂:

*N₂ cross-sections*: Electronic excitation, vibrational excitation, rotational excitation, dissociation, and ionization cross-sections.

*H₂ cross-sections*: Electronic excitation, vibrational excitation, rotational excitation, dissociation, and ionization cross-sections.

*Energy range*: Cross-sections compiled for electron energies from 0.01 to 1000 eV.

*Data sources*: Experimental measurements, theoretical calculations, and recommended values from literature.

The cross-section database includes:
- Raw cross-section data
- Fitted analytical expressions
- Uncertainty estimates
- Source documentation

=== Heavy species rate coefficients
Rate coefficients for heavy species reactions in N₂-H₂ plasmas:

*Neutral-neutral reactions*: Rate coefficients for reactions between neutral species.

*Ion-molecule reactions*: Rate coefficients for ion-molecule reactions.

*Three-body reactions*: Rate coefficients for three-body recombination reactions.

*Surface reactions*: Rate coefficients for surface processes.

The rate coefficient database includes:
- Temperature-dependent expressions
- Pressure-dependent expressions
- Uncertainty estimates
- Validation status

=== Excited state reactions
Rate coefficients for reactions involving excited species:

*N₂\* reactions*: Rate coefficients for reactions involving excited N₂ molecules.

*H₂\* reactions*: Rate coefficients for reactions involving excited H₂ molecules.

*Energy transfer*: Rate coefficients for energy transfer between excited states.

*Quenching reactions*: Rate coefficients for quenching of excited states.

The excited state database includes:
- State-specific rate coefficients
- Energy transfer probabilities
- Quenching mechanisms
- Cross-validation data

== Cross-sections and Data Validation 

=== What is a cross-section? <cross-section>

The study of particle interactions and chemical reactions requires quantifying the probability at which these processes occur. The collisional *cross section ($sigma$)* provides this probability, corresponding in a certain extent to the 'collision likelihood' for a specific process between the particles involved in the collision.

Mathematically, the cross section is defined as:

$
sigma = frac(text("Number of interactions per unit time per unit volume"), text("Incident flux") times text("Number density of targets"))
$

where the incident flux is the number of projectile particles crossing unit area per unit time, and the number density represents the concentration of target particles. The cross section has dimensions of area and is typically expressed in units of square meters (m²).

Cross sections can be classified according to the type of interaction or the initial/final state of the collision. For example, an elastic cross section $sigma_"elastic"$ describes collisions where the sole energy exchange between the colliding particles is kinetic energy, with no changes of their internal energy-states; conversely, inelastic processes involve changes in the internal energy-states of the particles, like excitation, de-excitation, ionization, and dissociation processes.


Cross sections are generally functions of the kinetic energy of the colliding particles, and other relevant parameters, like the collision angles. Cross sections exhibit an energy threshold $u_"th"$, corresponding to the minimal energy for the collision to occur, i.e. $sigma(u) = 0$, for $u < u_"th"$. Above the threshold, the energy dependence can vary depending on the specific process and the nature of the interaction potential.

In the classical limit, cross sections can often be understood in terms of geometrical considerations and classical trajectories. The classical cross section for hard-sphere collisions of radius $R$ is simply $sigma_"classical" = pi R^2$. However, quantum effects become important when the _de Broglie_ wavelength of the collision partners becomes comparable to the range of the interaction potential.

Cross sections can be measured experimentally through several complementary approaches. Direct methods include beam experiments with well-defined particle streams and detection of reaction products, and cell experiments using time-resolved spectroscopy in controlled gas or plasma environments. Indirect methods determine cross sections from transport measurements in swarm/drift tube experiments or by inferring them from plasma diagnostics such as emission spectroscopy and population kinetics analysis[references!].

=== Experimental data sources
Primary experimental data sources for cross-sections:

*Beam experiments*: Cross-beam and merged-beam experiments for electron-molecule collisions.

*Swarm experiments*: Swarm experiments for electron transport and reaction coefficients.

*Optical experiments*: Optical emission and absorption experiments for excited state cross-sections.

*Mass spectrometry*: Mass spectrometry experiments for ionization cross-sections.

The experimental sources include:
- Measurement techniques
- Energy ranges
- Accuracy estimates
- Systematic uncertainties

=== Theoretical data sources
Theoretical calculations for cross-sections:

*Ab initio calculations*: Quantum mechanical calculations for cross-sections.

*Semi-empirical methods*: Semi-empirical methods for cross-section estimation.

*Scaling methods*: Scaling methods for estimating cross-sections.

*Interpolation methods*: Interpolation methods for cross-section data.

The theoretical sources include:
- Calculation methods
- Basis sets used
- Convergence criteria
- Accuracy estimates

=== Validation procedures
Validation procedures for cross-section data:

*Cross-validation*: Comparison between different experimental and theoretical sources.

*Consistency checks*: Internal consistency checks for cross-section data.

*Sum rule validation*: Validation against sum rules and conservation laws.

*Uncertainty quantification*: Systematic uncertainty quantification for all data.

The validation procedures include:
- Statistical analysis
- Discrepancy identification
- Uncertainty estimation
- Recommendation procedures

=== Recommended values
Recommended cross-section values with uncertainties:

*Selection criteria*: Criteria for selecting recommended values from multiple sources.

*Uncertainty estimation*: Methods for estimating uncertainties in recommended values.

*Interpolation methods*: Methods for interpolating between available data points.

*Extrapolation guidelines*: Guidelines for extrapolating beyond available data.

The recommended values include:
- Best estimates
- Uncertainty ranges
- Confidence levels
- Usage guidelines

== Comparison tables between different authors

=== N₂ cross-section comparisons
Comprehensive comparison of N₂ cross-sections from different sources:

*Electronic excitation*: Comparison of electronic excitation cross-sections.

*Vibrational excitation*: Comparison of vibrational excitation cross-sections.

*Rotational excitation*: Comparison of rotational excitation cross-sections.

*Dissociation*: Comparison of dissociation cross-sections.

*Ionization*: Comparison of ionization cross-sections.

The comparison tables include:
- Numerical comparisons
- Relative differences
- Systematic biases
- Agreement metrics

=== H₂ cross-section comparisons
Comparison of H₂ cross-sections from different sources:

*Electronic excitation*: Comparison of electronic excitation cross-sections.

*Vibrational excitation*: Comparison of vibrational excitation cross-sections.

*Rotational excitation*: Comparison of rotational excitation cross-sections.

*Dissociation*: Comparison of dissociation cross-sections.

*Ionization*: Comparison of ionization cross-sections.

The H₂ comparisons include:
- Experimental vs. theoretical
- Different experimental techniques
- Different theoretical methods
- Systematic differences

=== Heavy species reaction comparisons
Comparison of heavy species reaction rate coefficients:

*Neutral-neutral reactions*: Comparison of neutral-neutral reaction rate coefficients.

*Ion-molecule reactions*: Comparison of ion-molecule reaction rate coefficients.

*Three-body reactions*: Comparison of three-body reaction rate coefficients.

*Surface reactions*: Comparison of surface reaction rate coefficients.

The heavy species comparisons include:
- Temperature dependence
- Pressure dependence
- Mechanism differences
- Uncertainty estimates

=== Statistical analysis
Statistical analysis of comparisons between different sources:

*Correlation analysis*: Correlation coefficients between different data sources.

*Bias analysis*: Systematic bias analysis between different sources.

*Outlier detection*: Detection of outliers in the comparison data.

*Trend analysis*: Analysis of trends in the comparison data.

The statistical analysis includes:
- Quantitative metrics
- Visual analysis
- Statistical tests
- Confidence intervals

== Recommended values with uncertainties

=== Selection methodology
Methodology for selecting recommended values:

*Quality assessment*: Assessment of data quality for each source.

*Weighting scheme*: Weighting scheme for combining multiple sources.

*Consistency checks*: Consistency checks for recommended values.

*Validation procedures*: Validation procedures for recommended values.

The selection methodology includes:
- Quality criteria
- Weighting factors
- Validation metrics
- Selection procedures

=== Uncertainty quantification
Methods for quantifying uncertainties in recommended values:

*Statistical uncertainties*: Statistical uncertainties from multiple measurements.

*Systematic uncertainties*: Systematic uncertainties from different sources.

*Model uncertainties*: Uncertainties in theoretical models.

*Interpolation uncertainties*: Uncertainties in interpolation procedures.

The uncertainty quantification includes:
- Uncertainty sources
- Propagation methods
- Confidence intervals
- Validation procedures

=== Temperature and pressure dependence
Temperature and pressure dependence of recommended values:

*Temperature dependence*: Analytical expressions for temperature dependence.

*Pressure dependence*: Analytical expressions for pressure dependence.

*Interpolation methods*: Methods for interpolating between available data.

*Extrapolation guidelines*: Guidelines for extrapolating beyond available data.

The dependence analysis includes:
- Functional forms
- Parameter fitting
- Uncertainty propagation
- Validation procedures

=== Validation against experiments
Validation of recommended values against experimental data:

*Direct validation*: Direct comparison with experimental measurements.

*Indirect validation*: Indirect validation through model predictions.

*Sensitivity analysis*: Sensitivity analysis for key reactions.

*Uncertainty analysis*: Analysis of uncertainties in validation.

The validation procedures include:
- Comparison metrics
- Agreement analysis
- Discrepancy identification
- Improvement recommendations

The kinetic data compilation provides a comprehensive and validated database for N₂-H₂ plasma modeling, with systematic uncertainty quantification and validation against experimental data. 