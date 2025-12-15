#import "@preview/thesist:1.0.2": flex-caption, subfigure-grid
#show figure: set block(breakable: true)

= What is a cross-section? <cross-section>

The study of particle interactions and chemical reactions requires quantifying the probability at which these processes occur. The collisional *cross section ($sigma$)* provides this probability, corresponding in a certain extent to the 'collision likelihood' for a specific process between the particles involved in the collision.

Mathematically, the cross section is defined as:

$
sigma = frac(text("Number of interactions per unit time per unit volume"), text("Incident flux") times text("Number density of targets"))
$

where the incident flux is the number of projectile particles crossing unit area per unit time, and the number density represents the concentration of target particles. The cross section has dimensions of area and is typically expressed in units of square meters (m²).

Cross sections can be classified as elastic (only kinetic energy exchange, no internal state changes) or inelastic (involving excitation, de-excitation, ionization, or dissociation) @raizer1991gas. They are generally functions of the kinetic energy and exhibit an energy threshold $u_"th"$ below which $sigma(u) = 0$. Above threshold, the energy dependence varies with the specific process and interaction potential.

In the classical limit, cross sections can be understood geometrically (e.g., $sigma_"classical" = pi R^2$ for hard-sphere collisions @mcdaniel1973mobility), while quantum effects become important when the _de Broglie_ wavelength becomes comparable to the interaction range @joachain1983quantum. Cross sections are measured experimentally through direct methods (beam experiments @kjeldsen_2006, time-resolved spectroscopy @fleischmann_2004) or indirect methods (swarm/drift tube experiments @lxcat).

= Complete Experimental Dataset <experimental-measurements>


#subfigure-grid(
  figure(
    image("../Images/temp/W30_266.png", width: 100%),
    caption: []
  ),<W30_266>,
  figure(
    image("../Images/temp/W30_665.png", width: 105%),
    caption: []
  ),<W30_665>,
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 6cm,
  caption: [Wall temperature measurements for the current of 30 mA, at 266 Pa (a) and 665 Pa (b), both for this work (A Gonçalves label) and for the previous LPP measurements (M Budde label).]
)

#subfigure-grid(
  figure(
    image("../Images/temp/G30_266.png", width: 100%),
    caption: []
  ),<G30_199>,
  figure(
    image("../Images/temp/G30_665.png", width: 100%),
    caption: []
  ),<G30_665>,
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 6cm,
  caption: [Gas temperature ($T_"rot"$) for the current of 30 mA, at 266 Pa (a) and 665 Pa (b), both for this work (A Gonçalves label) and for the previous LPP measurements (M Budde label).]
)


#subfigure-grid(
  figure(
    image("../Images/temp/tvsp_30.png", width: 100%),
    caption: []
  ),<tvsp_30>,
  figure(
    image("../Images/temp/tvsp_40.png", width: 100%),
    caption: []
  ),<tvsp_40>,
  kind: image,
  align: top,
  columns: (1fr, 1fr),
  rows: 6cm,
  caption: [Gas temperature ($T_g$) and wall temperature ($T_w$) for different pressures at discharge current of 30 mA (a) and 40 mA (b).]
)

#figure(
  table(
    columns: 6,
    align: center,
    stroke: 0.5pt,
    [*Total flow (sccm)*], [*I (mA)*], [*P (Pa)*], [*H₂%*], [*Tg (K)*], [*Tw (K)*],
    
    [7.4], [20], [266], [5], [439], [359],
    [7.4], [40], [199.5], [0], [593], [366],
    [7.4], [40], [199.5], [4], [534], [380],
    [7.4], [40], [199.5], [10], [508], [379],
    [7.4], [40], [199.5], [40], [443], [375],
    [7.4], [40], [199.5], [55], [451], [370],
    [7.4], [40], [199.5], [70], [434], [366],
    [7.4], [40], [199.5], [85], [370], [363],
    [7.4], [40], [199.5], [93], [365], [362],
    [7.4], [40], [266], [0], [613], [373],
    [7.4], [40], [266], [1], [544], [386],
    [7.4], [40], [266], [3], [514], [388],
    [7.4], [40], [266], [5], [505], [384],
    [7.4], [40], [665], [0], [651], [418],
    [7.4], [40], [665], [1], [653], [437],
    [7.4], [40], [665], [3], [662], [436],
    [7.4], [40], [665], [4], [656], [435],
    [7.4], [40], [665], [5], [652], [434],
    [7.4], [40], [665], [10], [635], [437],
    [7.4], [40], [665], [25], [569], [443],
    [7.4], [40], [665], [40], [529], [441],
    [7.4], [40], [665], [55], [484], [437],
    [7.4], [40], [665], [70], [461], [431],
    [7.4], [40], [665], [85], [434], [425],
    [7.4], [40], [665], [93], [420], [419],
    [10], [30], [133], [0], [514], [344],
    [10], [30], [266], [0], [623], [366],
    [10], [30], [266], [10], [462], [370],
    [10], [30], [266], [20], [438], [375],
    [10], [30], [266], [30], [426], [374],
    [10], [30], [266], [40], [414], [375],
    [10], [30], [266], [50], [393], [369],
    [10], [30], [266], [60], [391], [365],
    [10], [30], [266], [70], [388], [365],
    [10], [30], [266], [80], [371], [364],
    [10], [30], [266], [90], [368], [361],
    [10], [30], [266], [95], [370], [358],
    [10], [30], [266], [100], [544], [360],
    [10], [30], [399], [0], [675], [376],
    [10], [30], [532], [0], [640], [385],
    [10], [30], [665], [0], [653], [392],
    [10], [30], [665], [10], [582], [413],
    [10], [30], [665], [20], [546], [418],
    [10], [30], [665], [30], [512], [418],
    [10], [30], [665], [40], [504], [418],
    [10], [30], [665], [50], [475], [413],
    [10], [30], [665], [60], [458], [417],
    [10], [30], [665], [70], [466], [412],
    [10], [30], [665], [80], [452], [407],
    [10], [30], [665], [90], [465], [405],
    [10], [30], [665], [95], [460], [403],
  ),
  caption: [Experimental data showing flow rate (Total flow), discharge current (I), pressure (P), hydrogen percentage ($H_2$%), gas temperature ($T_g$) and wall temperature ($T_w$)]
)

