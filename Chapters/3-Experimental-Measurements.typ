#import "@preview/thesist:1.0.2": flex-caption, subfigure-grid
#show figure: set block(breakable: true)

= Experimental Measurements <cap3>


By this point, a plasma was already defined, but there's still a question in the air. How can one make it?

In this chapter not only this question is answered, but it's also described exactly what parameters are measured and taken into account to support all the work of modelling presented in @modelling-nh3-plasmas, and ultimately, to run simulations.


== Experimental Setup and Diagnostics

From all the popular sources of generating plasmas, this work 
explored two of them: Direct Current (DC) discharge and Radio 
Frequency (RF) discharge. For this thesis, only the DC discharge 
is addressed in detail. RF discharge was initially explored to 
investigate temporal ammonia density dynamics; however, the 
measured ammonia densities were too low to observe any meaningful 
temporal variation, likely due to limitations in the experimental 
setup or protocol used.


The *DC glow discharge* system consists usually of a cylindrical discharge tube excited by two planar electrodes positioned in a side-arm configuration, as in @dc. 

#figure(
  image("../Images/glow_discharge.jpg", width: 50%),
  caption: [Simple schematic of a DC glow discharge system, adapted from @alireza]
)<dc>


This classical geometry provides a positive column which is a quasi-neutral plasma volume characterized by axial uniformity and relatively low electric field. The discharge is generated within a cylindrical Pyrex tube; Pyrex is selected for its excellent vacuum properties, optical transparency for diagnostic access, and well-documented surface characteristics. Two cylindrical stainless steel electrodes are positioned in perpendicular side-arms, placing them outside the direct line-of-sight for axial optical diagnostics. Gas is introduced at one end of the main tube using mass flow controllers, and exhausted at the other end. A regulation valve is placed just before the pump in order to control independently the residence time and the pressure.

The discharge is sustained by a high-voltage DC power supply capable of delivering up to several kilovolts and tens of milliamperes. A critical component in the electrical circuit is a high-power, non-inductive ballast resistor (typically 4 kΩ or 68 kΩ, depending on the desired operating conditions) connected in series between the power supply and the anode. This resistor is necessary because glow discharges can exhibit negative differential resistance under certain operating conditions, where the voltage across the discharge decreases as current increases. This creates an electrically unstable situation that can lead to a runaway current increase, potentially causing the discharge to transition into an uncontrolled _arc_: a high-current, high-temperature discharge that could damage the electrodes and equipment. The current is primarily controlled by the fact that a stabilized power source is used, which itself limits the maximum current to the set point chosen. The ballast resistor is there more for security in case the reactor would be short-circuited. The use of a non-inductive resistor is essential to avoid self-inductance effects that could introduce time-dependent voltage oscillations and compromise both discharge stability and the accuracy of diagnostic measurements, particularly in the precise determination of the axial electric field.

A key advantage of this DC setup is the ability to directly measure the fundamental plasma parameter that governs electron kinetics: the axial electric field, $E$. This is accomplished via two tungsten wire probes embedded in the reactor wall and separated by a known axial distance, $L$@MorilloCandas2019. By measuring the floating potential difference, $Delta V$, between these probes, the axial electric field in the positive column is determined as:

$ E = (Delta V) / L $

The gas number density, $N$, is calculated using the ideal gas law @alves2018foundations:

$ N = p / (k_B T_"gas") $

where the pressure $p$ is measured by a capacitance manometer and the gas temperature $T_"gas"$ is determined spectroscopically. The reduced electric field, $E\/N$, is thus obtained directly from experimental measurements. This parameter is of paramount importance as it uniquely determines the shape of the EEDF and, consequently, the rate coefficients for all electron-impact reactions (@modelling-nh3-plasmas).

In the DC experimental system, the gas flow rates are precisely regulated using digital mass flow controllers, which allow for accurate control of the total gas flow and the $N_2:H_2$ mixing ratio. The vacuum systems are designed to achieve a base pressure of approximately $10^(-2)$ mbar prior to each experiment using a dry scroll pump@ben. Achieving a low base pressure is critical for evacuating contaminants and the gases themselves, ensuring a clean experimental environment. The operating pressure is monitored with a temperature-independent capacitance manometer, which provides pressure readings irrespective of gas composition.   

=== Plasma Diagnostics <plasmas-diagnostics>

A comprehensive understanding of the $N_2$-$H_2$ plasma chemistry necessitates a multi-faceted diagnostic approach. A suite of complementary techniques is employed to characterize the plasma's electrical properties, gas-phase composition, and internal energy distributions. The following advanced spectroscopic and analytical methods are widely employed in plasma chemistry research:

*Laser-Induced Fluorescence (LIF)* detects low-concentration radicals by exciting specific rovibronic transitions with tunable lasers and measuring the subsequent fluorescence intensity, which is proportional to ground-state density @van_2007. NH is detected via $A^3 Pi arrow.l X^3 Sigma^-$ (336 nm) @dai_2025@pastorek2022time@ubachs_1984, while $N H_2$ uses $tilde(A)^2 A_1 arrow.l tilde(X)^2 B_1$ (385 nm) @gong_gong@brackmann_2017. *Two-photon Absorption LIF (TALIF)* extends this to atomic species like $H$ and $O$, using two-photon excitation to access higher energy states, enabling absolute density measurements through calibration with noble gases @kristaq2021. 

*Photofragment Translational Spectroscopy (PFTS)* measures photodissociation dynamics by tracking fragment velocities after UV laser breaking of molecules, following $E_"photon" = "BDE" + E_"int" + "TKER"$ @michael_king_michael_thomas_2011@michael_yuan_yang_2018. Variants include H-atom Rydberg tagging (HRA-PTS) and Velocity Map Imaging (VMI) @suits_2018, providing benchmarks for dissociation models @felder1994photofragment@king_oliver_nix_ashfold_2009.   

*Vacuum Ultraviolet (VUV) Absorption Spectroscopy* probes high-energy transitions ($< 200$ nm) accessing $sigma -> sigma^*$ bonds, providing near-universal molecular fingerprints @hermann_zander_hannes@du2005experimental@krishnan2023uv. Requires vacuum optical paths ($< 10^(-5)$ mbar) and specialized optics ($"MgF"_2$ or LiF windows) due to atmospheric absorption. 

*Electron Paramagnetic Resonance (EPR/ESR)* detects species with unpaired electrons via microwave-induced transitions between Zeeman-split spin states: $Delta E = h nu = g mu_B B_0$ @bendix_2017@wertz1972electron. The g-factor and hyperfine splitting patterns ($2N I + 1$ lines for $N$ nuclei) fingerprint radical species and provide structural information.

*Gas-Phase Chemiluminescence Titration* quantifies species via light emission from stoichiometric reactions, achieving ppb-ppt detection limits against dark backgrounds @stedman1972analysis@prok1961effect.

#v(.5cm)

For this work, the following techniques were employed:

*Optical Emission Spectroscopy (OES)* was used to obtain the plasma temperature. OES analyzes the light emitted by electronically excited species. The emission is collected via an optical fiber, dispersed by a USB spectrometer, and recorded by a CCD chip detector@MorilloCandas2019. The resulting spectrum contains characteristic emission lines and bands that serve as fingerprints for the excited species present in the discharge@jamroz2006optical@yadava2022vibrational. For $N_2$-$H_2$ plasmas, key features include the $N_2$ Second Positive System ($C^3 Pi_u -> B^3 Pi_g$), the $N_2^+$ First Negative System ($B^2 Sigma_u^+ -> X^2 Sigma_g^+$), the NH ($A^3 Pi -> X^3 Sigma^-$) transition around 336 nm, and atomic hydrogen lines from the Balmer series (e.g., $H_alpha$ at 656.3 nm)@li_zhang_chen_zhang_wang_xia_2014@wróbel_i. The rotational temperature ($T_"rot"$) is determined by analyzing the intensity distribution within the rotational structure of a molecular emission band. A common and reliable method involves fitting a simulated spectrum of the $N_2$ Second Positive System (e.g., the 0-0 band at 370 nm) to the experimentally measured spectrum, with $T_"rot"$ as the fitting parameter. For the low-pressure conditions investigated here, the rotational-translational relaxation is sufficiently fast to assume that the rotational temperature of the $N_2(C^3 Pi_u)$ state is in thermal equilibrium with the kinetic temperature of the background gas, i.e., $T_"rot" approx T_"gas"$@bruggeman2014gas@zhang_shi_xu_miao_ma_ren_zhang_yi_2015. 

*Fourier-Transform Infrared (FTIR) Spectroscopy* identifies molecules concentrations by probing quantized vibrational modes (stretching and bending). IR absorption occurs when photons match vibrational energy differences and cause dipole moment changes. Homonuclear diatomics like $"N"_2$ and $"O"_2$ are therefore IR-inactive; their vibration does not cause a change in dipole moment @smith_2011. FTIR uses a Michelson interferometer @michelson_morley_1887: a moving mirror creates an interferogram (time-domain signal containing all IR frequencies), which is Fourier-transformed to produce the frequency-domain spectrum. This offers simultaneous measurement of all frequencies, faster acquisition, no restrictive slits and a higher signal-to-noise. The resulting spectrum (wavenumber versus intensity) provides unique molecular "fingerprints."

#subfigure-grid(
  figure(
    image("../Images/ftir.png", width: 70%),
    caption: [Schematic of a FTIR spectrometer@delrue_2023]
  ), <ftir>,


  figure(
    image("../Images/bruker.png", width: 100%),
    caption: [Bruker Vertex 70 FTIR spectrometer, used in this work@vandenbrouckeafbraak]
  ), <bruker>,

  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 7cm,
  caption: [FTIR spectrometer setup]
)

For $"NH"_3$ detection, the key vibrational modes include the N-H symmetric stretching (\~3300 $"cm"^(-1)$), the N-H bending (\~1600 $"cm"^(-1)$), and the umbrella mode (\~950-1200 $"cm"^(-1)$)@hargreaves_li_bernath_2011. In this work, ammonia concentration was quantified by fitting the FTIR absorption spectra in the three regions.

The temperature of the plasma tube wall ($"T"_"wall"$) was monitored using an optical fiber probe with a thermosensitive Gallium Arsenide crystal at its tip, which enabled non-intrusive temperature measurements without electromagnetic interference from the plasma environment. Light transmitted through the optical fiber causes an excitation which emits a temperature-dependent fluorescent response that was transmitted back through the fiber to a monitoring unit. This setup allowed for continuous real-time temperature monitoring throughout the plasma treatment process, ensuring precise control of the thermal conditions during ammonia activation.


== Experimental Campaign at LPP Laboratory

A research stay was conducted at the LPP to re-take measurements previously performed at the laboratory, used as input data for the group's plasma simulations. The primary objectives of this campaign were to measure wall and gas temperatures, determine the ammonia concentration ($["NH"_3]$) produced under various operating conditions, validate these measurements against previous LPP data and ensure reliable comparison with the simulation results. The measurements were performed using the same experimental conditions and a similar setup as the previous ones.


=== DC Discharge Setup

The experimental setup used in the re-measurements campaign (@dcScheme) consisted of a cylindrical discharge tube with a *length of 0.54 m* and *radius of 0.01 m*. The plasma was generated using DC glow discharge with discharge currents of 20, 30 and 40 mA at pressures ranging from 133 Pa to 665 Pa. Special attention was given to the *40 mA* discharge current, as this is the condition for which previous LPP measurements have ammonia concentration results available for direct comparison. Two pressure measurement points were installed along the gas line to monitor pressure gradients, as seen in @dcScheme. 

#figure(
  image("../Images/dc/scheme.png", width: 70%),
  caption: [Schematic of the DC discharge setup used in the re-measurements campaign. The "adapter" connected to the DC power supply represents the non-inductive ballast resistor used for current limitation and discharge stabilization.]
)<dcScheme>

Gas flow rates were controlled using Bronkhorst F-201 mass flow controllers, factory-calibrated for nitrogen ($"N"_2$). Since mass flow controllers measure flow based on the thermal properties of gases, correction factors were required when using gases other than the calibration gas. Each gas species has a characteristic thermal conductivity constant, and the conversion factor between gases is determined by the ratio of these constants: the thermal constant of the actual gas divided by the thermal constant of the calibration gas ($"N"_2$). To achieve a desired flow rate for a given gas, the setpoint on the controller was adjusted by multiplying the target flow rate by the appropriate gas-specific conversion factor obtained from the manufacturer's gas conversion tables@bronkhorst_manual2025. The mass controllers were interconnected, requiring only one connection to the computer for control via FlowDDE communication protocol and FlowView software interface. Gas mixtures with hydrogen percentages varying from 0% to 93% were investigated.

For safety reasons, the tube transporting hydrogen from the gas bottle to the first mass controller was constructed of metal. Prior to each experimental campaign, a cleaning procedure was performed by flowing gases through the system to evacuate residual gases and contaminants from previous experiments.

Diagnostics included in-situ and external FTIR spectroscopy for species concentration measurements, optical emission spectroscopy for plasma characterization, and fiber optic temperature sensors for monitoring wall temperature. The concentration of ammonia was monitored using a Bruker Vertex 70 FTIR spectrometer operated with OPUS software. The FTIR detector required periodic refilling (every 4 hours) with liquid nitrogen to maintain low temperature and reduce contamination from ambient infrared radiation. Background spectra were recorded before each experimental run to ensure accurate measurements. The dual FTIR configuration allowed simultaneous measurement of species concentrations at different positions along the reactor, though the in-situ FTIR measurements suffered from incomplete purging of the optical path, being even discarded completely due to reasons later discussed.

The detailed experimental protocol for the DC discharge measurements follows:

+ Laboratory lights were turned off to minimize background optical signals
+ OES background spectra were recorded with the plasma off to establish the baseline for emission measurements
+ The system was allowed to thermally equilibrate, with the wall temperature monitored until it dropped below 60°C from any previous discharge
+ The system was evacuated to low pressure to remove residual gases from previous experiments
+ The operating pressure was verified and stabilized at the target value
+ New gas flow conditions were established using the mass flow controllers for the desired $"N"_2$-$"H"_2$ mixture
+ FTIR background spectra were acquired with the gas mixture flowing but without plasma
+ The DC plasma discharge was ignited by activating the high-voltage power supply
+ The discharge was maintained for 20 minutes to allow the system to approach thermal steady-state conditions
+ Wall temperature was recorded
+ OES spectra were collected
+ FTIR spectra were recorded from both the in-situ sample compartment and the external optical path for ammonia concentration measurements
+ Laboratory lights were turned on after measurements were completed
+ The plasma discharge was terminated by deactivating the power supply
+ The system was prepared for the next measurement cycle

A critical aspect of this experimental campaign was the careful monitoring of thermal equilibration. Previous measurements had not adequately accounted for the long thermal time constants of the system. Temperature measurements revealed that wall temperatures continued to evolve over extended periods during plasma operation (see @graph). For a typical operating condition at 40 mA current, 665 Pa pressure, and 70% hydrogen content, the wall temperature was monitored continuously for nearly four hours. At 35 minutes into the discharge, the wall temperature had reached 146°C, but by the end of the monitoring period at approximately three hours, it had increased further to 161°C. This represented a change of approximately 10% even after the initial thermal transient appeared to have settled (see @temp).


#subfigure-grid(
  figure(
    image("../Images/temp/temp.png", width: 117%),
    caption: []
  ),<temp>,
  figure(
    image("../Images/temp/graph.jpg", width: 90%),
    caption: []
  ),<graph>,
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 6cm,
  caption: [Measured wall temperature (in ºC) evolution during the discharge for a typical operating condition at 40 mA current, 665 Pa and 70% $H_2$ content over a period of nearly four hours (a) and Wall temperature recorded in real time with the thermosensor during a discharge of 40 mA as well, 266 Pa and 5% $H_2$, showing the initial thermal transient (b).]
)

These substantial temperature variations had important implications for the interpretation of experimental results. The compromise would be settled at 20 minutes after the beginning of the discharge, time where the wall temperature would be registered. The long thermal equilibration times and the magnitude of temperature variations observed inspired the adoption of 50 K uncertainty bands in subsequent kinetic modeling work performed with the LPP data. This uncertainty estimate was deemed necessary to capture the range of thermal conditions that could exist during measurements. Wall temperature measurements for a discharge current of 40 mA and for pressures of 199,5 Pa and 665 Pa can be seen in @W40_199 and @W40_665.

#subfigure-grid(
  figure(
    image("../Images/temp/W40_199.png", width: 80%),
    caption: []
  ),<W40_199>,
  figure(
    image("../Images/temp/W40_665.png", width: 90%),
    caption: []
  ),<W40_665>,
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 6cm,
  caption: [Wall temperature for the current of 40 mA, at 199,5 Pa (a) and 665 Pa (b), both for this work (A Gonçalves label) and for the previous LPP measurements (M Budde label).]
)

For the dicharge current of 40 mA, the wall temperature measurements are generally larger than the previous LPP measurements, somewhat expected since the waiting time was longer. However, this is not evident in all cases, since for discharge current of 30 mA, temperatures measured are generally close to the previous LPP measurements, as seen in @experimental-measurements. The wall temperature appears to remain approximately constant across different hydrogen percentages for the different pressure and discharge current. It should be noted that the measurement at 25% $H_2$ for the 199.5 Pa case was excluded from the analysis due to identified inconsistencies after data acquisition.

Gas temperature measurements were obtained from analysis of the OES spectra. The raw OES spectra were first corrected by subtracting the background spectrum recorded before plasma ignition to remove contributions from ambient light and detector noise. A wavelength shift correction of 0.1 nm was applied to account for instrumental calibration. The corrected spectra were then fitted to extract the rotational and vibrational temperatures of the $N_2(C^3 Pi_u)$ state, which serves as a reliable proxy for the gas kinetic temperature under the low-pressure conditions of this study. 

The fitting procedure employed specialized code developed at LPP that simulates the emission spectrum of the $N_2$ Second Positive System (particularly the 0-0 band at 370 nm). The simulation function computes allowed rovibrational transitions using spectroscopic constants @ventura_2019@nassar_2004, calculates line intensities and applies line broadening (Voigt profiles) consistent with instrumental resolution and quantum selection rules (P, Q, R branches) @budo1937intensitatsformeln @Kovacs1969Rotational. The fitting algorithm adjusts both rotational ($T_"rot"$) and vibrational ($T_"vib"$) temperatures to minimize the residual between simulated and measured spectra, starting from initial guesses of approximately 600 K for $T_"rot"$ and 2000 K for $T_"vib"$, with lower bounds set at 293 K (see @fittemp). Since line positions are determined by quantum mechanics and relative intensities follow Boltzmann statistics, the best-fit temperatures uniquely characterize the energy distribution in the plasma. This fitting code is available upon request by contacting the author.

#subfigure-grid(
  figure(
    image("../Images/temp/untitled.png", width: 95%),
    caption: []
  ),<fittemp>,
  figure(
    image("../Images/dc/cilinder.jpg", width: 93%),
    caption: []
  ),<dc_setup>,
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 6.5cm,
  caption: [Fitting procedure for the rotational and vibrational temperatures of the $N_2(C^3 Pi_u)$ state, for a discharge current of 40 mA, 665 Pa and 70% $H_2$ (a) and detail of plasma entering the long tube (encapsulated in a tube furnace that was not used) in the DC setup (b).]
)

The gas temperatures ($T_"rot"$) obtained through this method provided essential input parameters for the subsequent kinetic modeling of the plasma chemistry. For the current of 40 mA, gas temperature measurements can be seen in @G40_199 and @G40_665. As expected, the gas temperatures continue to be generally larger than the previous LPP measurements, result that is coherent with the wall temperature measurements. An important observation is the decaying tendency of the gas temperature with increasing $H_2$ percentage, which is explained by the high thermal conductivity of hydrogen. For the 30 mA case, the comparison of temperature against pressure and the final table with all temperatures, please consult @experimental-measurements.

#subfigure-grid(
  figure(
    image("../Images/temp/G40_199.png", width: 83%),
    caption: []
  ),<G40_199>,
  figure(
    image("../Images/temp/G40_665.png", width: 93%),
    caption: []
  ),<G40_665>,
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 6.5cm,
  caption: [Gas temperature ($T_"rot"$) for the current of 40 mA, at 199,5 Pa (a) and 665 Pa (b), both for this work (A Gonçalves label) and for the previous LPP measurements (M Budde label).]
)

Ammonia concentration in the plasma discharge is determined by spectral transmittance, obtained by normalizing the data FTIR spectrum against the background FTIR spectrum. The background spectrum captures the infrared emission from the spectrometer's in the absence of absorbing species. The data spectrum, conversely, includes the attenuation caused by ammonia and other molecular species present in the discharge. The transmittance $T(tilde(nu))$ is a adimensional quantity that represents the fraction of incident infrared radiation transmitted through the plasma at each wavenumber, typically expressed as @smith_2011:

$ T(tilde(nu)) = (I_"data" (tilde(nu))) / (I_"background" (tilde(nu))) $

where $tilde(nu)$ denotes the wavenumber in $"cm"^(-1)$. In regions devoid of molecular absorption, the transmittance approaches unity. Absorption features manifest as dips below this baseline, with deeper troughs indicating higher concentrations or stronger absorption cross-sections.

However, raw transmittance spectra often exhibit baseline distortions arising from instrumental drift, etalon effects, or subtle differences in experimental conditions between background and data acquisition. To correct these artifacts, a baseline correction algorithm is applied. The algorithm identifies spectral regions expected to be free of absorption features and constructs a polynomial baseline through these reference zones. For regions containing absorption bands, an asymmetric least squares (asLS) smoothing technique @asls is employed to estimate the underlying baseline beneath the peaks. The measured transmittance is then divided by this constructed baseline, yielding a corrected spectrum where non-absorbing regions are normalized to unity. The corrected transmittance spectrum is subsequently fitted using a molecular absorption model, simulating the expected absorption based on spectroscopic databases (HITRAN @hitran) containing line positions, intensities, and broadening parameters for $N H_3$ and potentially other species like $H_2 O$ present in the discharge.

The fitting procedure adjusts several parameters to minimize the residual between measured and simulated spectra; once optimal parameters are determined, the ammonia mole fraction is extracted directly from the fit results. Combined with knowledge of the total gas flow rate and pressure, this yields the relative ammonia concentration in the discharge. 

The spectral fitting was performed in the three specific mid-infrared regions corresponding to the main vibrational bands of $N H_3$: the bending mode (umbrella mode) in the region \~950-1200 $"cm"^(-1)$, the bending mode in the region \~1550-1700 $"cm"^(-1)$ and the symmetric stretching mode around the region \~3300 $"cm"^(-1)$, as previously discussed (check @fit70_p665). However, a limitation was identified in the spectral region below 1000 $"cm"^(-1)$, where significantly elevated noise levels compromised data quality (see @noise and @transmittance). This is due to the limitation of the transmission of the infrared windows used, which are made of $"CaF"_2$ crystal. This is particularly unfortunate because the umbrella mode, expected to be the most intense ammonia absorption feature, falls precisely in this degraded spectral region (\~950-1250 $"cm"^(-1)$). Consequently, the analysis relied more heavily on the bending mode at higher wavenumbers, where transmission performance was superior.

#subfigure-grid(
  figure(
    move(dx:0cm,
    image("../Images/dc/ruido2.png", width: 100%)),
    caption: []
  ),<noise>,
  figure(
    move(dx:-.5cm,
    image("../Images/dc/ruido_e_nopeaks2.png", width: 68%)),
    caption: []
  ),<transmittance>,
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 8cm,
  caption: [Detail of noise in data and background (data and bg, respectively) spectra at a discharge current of 40 mA, 200 Pa and 70% $H_2$, for wavenumbers less than 1000 $"cm"^(-1)$ (a) and its propagation to the final transmittance spectrum (b).]
)

The experimental setup included both in-situ and external (or "ex-situ") FTIR measurement configurations. However, only the external measurements were ultimately used for concentration determination due to significant complications with the in-situ data. The in-situ optical path was not adequately purged prior to measurements, resulting in severe spectral contamination from atmospheric water vapor across nearly the entire measured range (see @purged). This contamination obscured the ammonia absorption features and rendered the in-situ data unsuitable for quantitative analysis. Beyond the contamination issue, a more fundamental challenge emerged with the in-situ measurements: the temporal separation between background and data spectrum acquisition. The data spectra were recorded approximately 20 minutes after plasma ignition, while background spectra were obtained before discharge initiation. This temporal mismatch led to baseline distortions and spectral "warping", as seen in @purged. The shift between the two spectra is not a consequence of the wall temperature but rather of the plasma itself, and is therefore unavoidable; however, this does not hinder the results significantly. What posed more of a problem in this case were the etalon fringes and the limitation of the transmission spectral range of the $"CaF"_2$ windows being used. This issue has been solved in future experiments with new windows.

#subfigure-grid(
  figure(
    image("../Images/dc/normal2.png", width: 73%),
    caption: []
  ),
  figure(
    image("../Images/dc/extern2.png", width: 74.5%),
    caption: []
  ),<purged>,
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 4cm,
  caption: [FTIR spectra for data and background (data and bg, respectively) at a discharge current of 40 mA, 665 Pa and 70% $H_2$, for ex-situ (a) and in-situ (b) measurements.]
)

For the ex-situ fitting procedure, a gas temperature of 300 K was assumed, as the ammonia reaching the external measurement cell had sufficient time to equilibrate with ambient temperature. Additionally, a pressure of approximately 11 Pa was applied during the fitting process. The fitting code searches for an optimal pressure parameter based on the broadening of the spectral lines, and this empirical value was found to consistently produce good agreement between simulated and measured spectra across different experimental conditions. The complete fitting code is available upon request by contacting the author.

Furthermore, measurements performed at extreme compositions of hydrogen percentages, including pure hydrogen (100% $H_2$) and pure nitrogen (0% $H_2$ or very low percentages below 10%), were excluded from the quantitative analysis for fundamental reasons. For the 100% $H_2$ case, the absence of nitrogen means there is no $N_2$ available in the discharge, the very species from which ammonia is synthesized and whose excited states are used for gas temperature determination via OES. Therefore, fitting FTIR spectra for this condition is just pointless. At the opposite extreme, for low hydrogen percentages ($lt.eq 10%$), ammonia production is minimal, resulting in extremely weak absorption features. Since $N_2$ and $H_2$ are both infrared-inactive (homonuclear diatomics with no permanent dipole moment), the FTIR spectra contain almost no signal beyond instrumental noise. Under these conditions, the fitting algorithm exhibits unstable behavior and produces unreliable concentration estimates. Even at 10% $H_2$, ammonia concentrations are already quite low (@fit10), and attempting to fit spectra with lower hydrogen content leads to unpredictable results.

#subfigure-grid(
  figure(
    move(dx:-.7cm,
    image("../Images/dc/fit10.png", width: 140%)),
    caption: []
  ),<fit10>,
  figure(
    move(dx:.7cm,
    image("../Images/dc/fit70_p665.png", width: 140%)),
    caption: []
  ),<fit70_p665>,
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 6cm,
  caption: [Fit of the final transmittance spectra for a discharge current of 40 mA and 665 Pa at 10% $H_2$ (a) and 70% $H_2$ (b).]
)

Finally, ammonia concentrations are shown in @nh3_200Pa and @nh3_665Pa. The 25% $H_2$ data point was excluded from both datasets due to inconsistencies identified during data acquisition, as previously mentioned. Additionally, the 55% $H_2$ measurement at 200 Pa exhibits anomalous behavior: the transmittance spectrum was particularly noisy with few discernible absorption peaks, and the resulting concentration value does not fit the overall trend observed for neighboring compositions. This suggests either an experimental error during measurement or a problem in the fitting procedure, and this data point should be interpreted with caution.

#subfigure-grid(
  figure(
    move(dx:0cm,
    image("../Images/dc/nh3_200Pa.png", width: 97%)),
    caption: []
  ),<nh3_200Pa>,
  figure(
    move(dy:-.2cm,
    image("../Images/dc/nh3_665Pa.png", width: 112%)),
    caption: []
  ),<nh3_665Pa>,
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 7.2cm,
  caption: [$N H_3$ concentrations in function of $H_2$% for a discharge current of 40 mA at 200 Pa (a) and at 665 Pa (b).]
)

The measured ammonia concentrations reveal clear trends with respect to both hydrogen content and operating pressure. For both pressure conditions, ammonia production increases with hydrogen percentage, reaching a maximum in the vicinity of 70% $H_2$. At 200 Pa, a peak concentration of 0.91% was observed, while at 665 Pa the maximum was 0.74%. Beyond this optimal composition, ammonia production begins to decline at higher hydrogen fractions.

From the comparison between the two operating conditions, at higher pressure (665 Pa) ammonia concentrations are generally lower than those observed at 200 Pa for equivalent hydrogen percentages. This behavior is counterintuitive when compared to the traditional Haber-Bosch process, where increased pressure thermodynamically favors ammonia formation due to the reduction in the number of moles ($N_2 + 3 H_2 arrow 2 N H_3$). This inverse relationship underscores the fundamentally non-equilibrium nature of plasma chemistry and motivates further investigation into the optimization of LTP processes for chemical synthesis. The comparison between the final $[N H_3]$ values at 200 Pa and 665 Pa for previous LPP measurements (refered to as "a" measurements) and for this work (refered to as "b" measurements) can be found in @NH3vsH2_longTube of @modelling-nh3-plasmas.



