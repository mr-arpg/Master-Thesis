## Master’s thesis – Engineering Physics (MEFT)

This repository contains the Typst source for my master’s thesis in Engineering Physics Technology (MEFT, Instituto Superior Técnico).  
The work focuses on experimental measurements and modelling of low-pressure NH₃ plasmas, including diagnostic tools and numerical modelling workflows.

The final compiled thesis is available as `main.pdf`. A set of presentation slides summarising the work can be found here:  
[Master’s thesis presentation slides](https://ulisboa-my.sharepoint.com/:p:/g/personal/ist1100290_tecnico_ulisboa_pt/IQBOVlpZqKEVQaGlmYMff7FWAV9OfPUOkf8AT0Qwu5xLzdU?e=ChSoXe).

---

## Repository structure

- **`main.typ`**  
  Main Typst entry file for the thesis. Compiling this file produces `main.pdf`.

- **`main.pdf`**  
  Compiled version of the full thesis (for quick reference).

- **`Beginning/`**  
  Front matter and auxiliary pages:
  - `Abstract-en.typ`, `Abstract-pt.typ`: English and Portuguese abstracts.
  - `Keywords-en.typ`, `Keywords-pt.typ`: Keywords in both languages.
  - `Acknowledgments.typ` (and `Acknowledgments.pdf`): Acknowledgments section.
  - `Extra-page.typ`, `Glossary.typ`: Additional front-matter material.

- **`Chapters/`**  
  Individual chapters and appendices:
  - `0-Quick-guide.typ`: Quick guide to using/reading the document.
  - `1-Introduction.typ`
  - `2-Theoretical-Background.typ`
  - `3-Experimental-Measurements.typ`
  - `4-Modelling-NH3-Plasmas.typ`
  - `5-Tool-Development.typ`
  - `6-Conclusions.typ`
  - `Appendix-A.typ` … `Appendix-F.typ`: Additional technical material, data, and derivations.

- **`Images/`**  
  All figures used in the thesis, organised by topic (e.g. `dc/`, `sims/`, `benchmark/`, `ml/`, `temp/`).  
  These include experimental setups, simulation results, benchmarks, machine-learning schematics, and other illustrative material.

- **`extendedAbstract copy.typ`, `extendedAbstract copy.pdf`, `ExtendedAbstract.tex`**  
  Extended abstract of the thesis in Typst, PDF, and LaTeX formats.

- **`refs.bib`**  
  Bibliographic database (BibTeX), used for citations in the thesis.

- **`Module1.bas`**  
  Auxiliary Visual Basic module related to the tools or data processing used in the work.

---

## Requirements

- **Typst** (recommended: latest stable release)  
  Download and installation instructions: see the official Typst documentation.

Optional but recommended:

- A text editor / IDE with Typst support (e.g. Typst app, VS Code with Typst extension).
- A LaTeX distribution (only needed if you want to work with `ExtendedAbstract.tex` directly).

---

## Building the thesis

1. **Install Typst**  
   Make sure the `typst` binary is available in your shell.

2. **Navigate to the repository root**  
   This is the directory that contains `main.typ`.

3. **Compile the main document**

   ```bash
   typst compile main.typ
   ```

   This will produce `main.pdf` in the same directory.

4. *(Optional)* **Compile the extended abstract**

   ```bash
   typst compile "extendedAbstract copy.typ"
   ```

   or use your preferred LaTeX toolchain on `ExtendedAbstract.tex` if you work from LaTeX instead.

---

## Editing and structure

- **Chapter content** is split across files in `Chapters/`.  
  To modify a specific part of the thesis, edit the corresponding `.typ` file and then recompile `main.typ`.

- **Front matter** (abstracts, keywords, acknowledgments, glossary) is in the `Beginning/` directory.

- **Figures** are managed under `Images/`.  
  If you add new images, place them in an appropriate subfolder and update the corresponding Typst source.

---

## Reproducibility and data

The repository focuses on the written document and figures.  
Scripts, raw experimental data, simulation input files, or code for tool development may be partially represented (e.g. `Module1.bas`) or hosted elsewhere.  
If you are interested in the underlying data or code used to produce specific figures or results, please contact the author.

---

## Citation

If you use or reference this thesis, please cite it as a master’s thesis from the Engineering Physics (MEFT) programme at Instituto Superior Técnico, Universidade de Lisboa.  
Once an institutional or DOI reference is available, it can be added here in a standard citation format (e.g. BibTeX entry).

---

## Contact

For questions about the thesis, figures, or compilation instructions, please contact the author via the institutional email associated with the MEFT programme at Instituto Superior Técnico.


