# When does pooling make intersectional fairness audits falsely reassuring?

**ICT 5143 Algorithms, Fairness and Graphical Models Laboratory: Capstone, Problem 8 (Reliable intersectional fairness
audits).** Team 5: **Sumedh Navuda** (261090830007, sumedh.mitmpl2026@learner.manipal.edu) and **Aldino**
(261090830006, aldino.mitmpl2026@learner.manipal.edu).

| | |
|---|---|
| Report (3 pages) | [`report/AFGML_Report.pdf`](report/AFGML_Report.pdf) |
| Slides (10 + 3 backup) | [`slides/AFGML_Presentation.pdf`](slides/AFGML_Presentation.pdf) |
| Executed notebook (all code) | [`Problem8_Intersectional_Fairness.ipynb`](Problem8_Intersectional_Fairness.ipynb) |
| Full manuscript | [`writeup/manuscript.pdf`](writeup/manuscript.pdf) |
| Requirement matrix | [`docs/requirements_matrix.md`](docs/requirements_matrix.md) |

We built this repository so that anyone can check every number in our report. The 3-page report stands on its own:
it shows our model diagram, equations, closest work, results table and intervals. As the AFGML report template asks,
it then points to this repository for the full evidence: the 19-paper comparison, the requirement matrix, the
contribution table and the machine-readable results.

## 1. Task
- **Data:** ACS PUMS 2018 1-Year, Folktables `ACSPublicCoverage`; California (core, 138,554 people in 85,182
  households) and Texas (replication, 98,928 people).
- **`Y = 1`:** *no public health coverage* in the ACS record (`Y = 1 − 1[PUBCOV = 1]`). This is not uninsurance and not
  programme eligibility.
- **`D = 1`:** selected for *hypothetical* information outreach at 30% capacity.
- **Protected attributes:** recorded race (9 codes) × sex × disability, giving 36 intersections.

## 2. Question and contribution
**Our question.** When does hierarchical pooling stabilise intersectional TPR estimates, and when does it mask a harmful
small-group disparity, so that an audit wrongly reports `ΔEOpp ≤ ε`?

**Closest work.** Foulds et al. (SDM 2020), hierarchical Bayesian intersectional fairness; Herlihy et al. (FAccT 2024),
structured regression for small subgroups. Our `struct` audit is a restricted version of the first, not an exact
reproduction. The ε-contamination prior is classical (Berger & Berliner 1986). We claim **no new prior and no new
metric**.

**What we contribute.**
1. *Evaluation (H1):* when a group-threshold rule is chosen on validation and a pooled audit certifies `ΔEOpp ≤ 0.10`,
   the frozen rule fails on test in more than half of cases.
2. *Audit protocol (H2):* design-matched calibration plus held-out certification beats every established audit
   out of sample.

## 3. Model and fairness
- **Predictive graph:** augmented naive-Bayes BN, `p(y, x) = p(y) ∏ p(x_j | pa(x_j))`. `Y` is a parent of 18 features,
  plus 10 feature edges; Dirichlet α = 1; exact variable elimination for `P(Y = 1 | x)`. It is associational, not causal.
- **Audit graph:** `k_g ~ Bin(n_g, θ_g)` for selected positives, with these priors on `θ_g`:
  - none (raw);
  - independent Beta;
  - complete pooling;
  - exchangeable Beta (EB or a full-Bayes grid);
  - `struct`: logit main effects `+ u_g`;
  - contamination `π·Beta(a, b) + (1 − π)·slab` (proposed, design-matched).
- **Primary criterion:** intersectional equal opportunity (TPR range), ε = 0.10. The harm is people who need outreach
  and are not reached.
- **Utility:** recall at capacity, with at most 0.02 loss.
- **Protected attributes at prediction time:** yes. They are BN features, and they set the thresholds for λ > 0.

## 4. What we found (all numbers from `results/`)
| Finding | Estimate |
|---|---|
| Intersections expose hidden disparity (same decisions, seed 0) | ΔEOpp 0.162 by sex → **0.746** over race × sex × disability (21 of 35 groups with ≥ 30 positives) |
| Pooling masks an isolated deficit (synthetic) | EB upper-0.9 falsely certifies **98%** of worlds with one 20-positive group 0.20 below the rest |
| H1: validation claims do not transfer | **116/116** CA and **27/27** TX pooled validation-time claims failed on test (test gap 0.110–0.888). **Supported** |
| H2a/b: design-matched audit, fresh Texas worlds | J = ACC − FTS = **0.664** (ACC 0.832, FTS 0.168) vs ≤ 0.385 for every established audit; paired **ΔJ = +0.279 [0.235, 0.322]**, and +0.475 [0.422, 0.525] vs the earlier calibration |
| H2c: held-out certification, real CA + TX | same-data certification: 10/10 claims, all false; held-out: 0 claims; mean test recall 0.365 in both |
| Probabilistic quality (BN, 5 splits) | AUROC 0.729 ± 0.004, log loss 0.577, Brier 0.196 (GBT 0.768 / 0.541 / 0.182) |
| **Failure case** | On the California design ΔJ = −0.004 [−0.057, 0.046], a tie. No rule in the family is fair on test (min gap 0.227). The preregistered real-gap comparison is inconclusive (Holm p = 0.736) |

## 5. Installation and data
```bash
uv venv --python 3.12 .venv                  # or: python3.12 -m venv .venv
uv pip install --python .venv/bin/python -r requirements-lock.txt   # exact versions of the submitted run
#   (requirements.txt = loose minimum versions)
.venv/bin/python -m ipykernel install --sys-prefix --name p8
```
We ran it on Linux (Fedora) with Python 3.12.13 on one CPU core. No GPU is used, and we did not profile peak memory. The ACS data (about 435 MB)
download automatically into `data/` on first run and are **not** redistributed; see [`data/README.md`](data/README.md).
No credentials are needed.

## 6. Reproduction
```bash
# full run: every table, figure and verdict (about 30 min, 1 CPU core)
.venv/bin/jupyter nbconvert --to notebook --execute --inplace Problem8_Intersectional_Fairness.ipynb \
    --ExecutePreprocessor.timeout=7200 --ExecutePreprocessor.kernel_name=p8
# headline ΔJ intervals and LaTeX tables from the saved outputs (about 15 s)
.venv/bin/python writeup/make_tables.py
# documents (needs tectonic or a LaTeX installation)
(cd writeup && ./build.sh); (cd report && tectonic -X compile AFGML_Report.tex); (cd slides && tectonic -X compile AFGML_Presentation.tex)
```
We fixed all seeds. Settings are the notebook §0 constants, mirrored in
[`configs/frozen_settings.yaml`](configs/frozen_settings.yaml). Every artefact and its command are listed in
[`results/manifest.csv`](results/manifest.csv). For a short demonstration, see [`demo/README.md`](demo/README.md).

## 7. Evidence
| Path | Content |
|---|---|
| [`docs/proposal.md`](docs/proposal.md) | preregistration and dated amendments (prospective vs retrospective) |
| [`docs/protocol.md`](docs/protocol.md) | splits, selection, metrics, seeds, uncertainty, confirmatory family |
| [`docs/requirements_matrix.md`](docs/requirements_matrix.md) | every requirement → notebook section, artefact, status, report or slide |
| [`docs/related_work.md`](docs/related_work.md) | 19-paper comparison table and closest baseline |
| [`docs/data_card.md`](docs/data_card.md), [`docs/model_card.md`](docs/model_card.md), [`docs/assumptions.md`](docs/assumptions.md) | cards and assumptions (full versions in `writeup/`) |
| [`docs/contributions.md`](docs/contributions.md) | lead/reviewer table and individual statements |
| `results/`, `figures/` | machine-readable outputs and figures written by the notebook |
| `writeup/` | LaTeX manuscript, literature review, model card, assumptions register, contribution statements |
| `report/`, `slides/` | 3-page evaluation report and Beamer deck (source + PDF) |

We have no `src/`, `scripts/` or `tests/` directories, by design. All our code lives in the single self-contained
notebook, and its correctness checks are 11 `assert` statements inside it (inference agreement, factor shapes,
normalisation, conditional independence, quadrature and gradient, truth labels, data equality). See the N/A note in
the requirement matrix.

## 8. Contributions and attribution
We split the work by pipeline stage, and each of us can explain the whole project:
- **Sumedh Navuda:** question and preregistration, literature review, data and household splits, BN and exact
  inference, Experiment 1, Texas replication and H1.
- **Aldino:** audit models and their verification, simulations and calibration, threshold selection, bootstrap and Holm,
  design-matched / held-out audit (H2).

Each of us cross-checked the other's work ([`docs/contributions.md`](docs/contributions.md)). Data: U.S. Census Bureau
ACS PUMS via Folktables (Ding et al., NeurIPS 2021). We used an AI coding assistant (Claude Code) to help
draft code and documents, and we checked every reported number against the saved outputs. Code licence: MIT ([`LICENSE`](LICENSE)).
