# Related work (19 papers)

Full review, with the search method, thematic discussion, gap verification and verified references:
[`writeup/literature_review.pdf`](../writeup/literature_review.pdf) (source `writeup/literature_review.tex`, bibliography
`writeup/references.tex`). "n.s." means not stated in the abstract we verified. For several papers only the abstract was
available, which is a limitation of the table.

**Closest reproduced baseline.** Foulds et al. (SDM 2020), the hierarchical Bayesian logistic regression, and Herlihy et al.
(FAccT 2024), structured regression. Our `struct` audit (notebook §6) is a **documented restricted version**:
`logit θ_g = β0 + β_race + β_sex + β_dis + u_g`, `u_g ~ N(0, τ²)`, empirical-Bayes β and τ by adaptive quadrature, applied
to TPRs. It is not an exact reproduction, because the priors, covariates and sampler were not matched.

**What the literature already answers, and how the claim was narrowed.** Hierarchical intersectional estimation (Foulds),
Bayesian uncertainty for fairness metrics (Ji), the bias of raw max−min gaps (Lum; Himmelreich), marginal-vs-subgroup
fairness (Kearns; Molina & Loiseau), fairness generalisation (Cotter) and contamination priors (Berger & Berliner;
Datta & Lahiri) are all prior work. We claim no new prior or metric. We claim (i) an evaluation of when pooled *audit
criteria* make false `ΔEOpp ≤ ε` claims for sparse intersections, including validation-time rule selection (H1), and
(ii) an audit protocol, design-matched calibration plus held-out certification, tested out of sample (H2).

| Paper | Key assumptions | Data | Graphical / statistical model | Fairness definition | Inference | Limitation for our question |
|---|---|---|---|---|---|---|
| Foulds et al. 2020 (SDM) | Sparse intersections can borrow strength through a probabilistic model | Criminal justice, census, synthetic | Four Bayesian models incl. hierarchical Bayesian logistic regression; model averaging | Intersectional fairness (differential fairness) | Bayesian posterior; n.s. beyond that | Outcome-rate fairness, not TPR-based EOpp; masking of an exceptional group and validation-time selection not studied (n.s.) |
| Foulds et al. 2020 (ICDE) | Protected attributes known; a privacy-style ratio bound is a meaningful fairness notion | COMPAS, census | – | Differential fairness (ε-DF) | Learning algorithm satisfying DF | Definition paper; no small-group uncertainty study |
| Kearns et al. 2018 | Subgroups from a structured function class | n.s. (primarily theory) | – | Subgroup fairness over rich classes | Learner–auditor zero-sum game; agnostic-learning oracle | Auditing is hard in the worst case; finite-sample small-group estimation not the focus |
| Hébert-Johnson et al. 2018 | Subpopulations computationally identifiable | n.s. (theory) | – | Multicalibration | Algorithms with complexity analysis | Calibration criterion, not EOpp tolerance audits |
| Molina & Loiseau 2022 | Relations between marginal and intersectional fairness | n.s. | – | Intersectional vs marginal fairness | High-probability bounds; grouping heuristic | Bounds loose in practice (authors) |
| Wang et al. 2022 | Including more identities creates small subgroups | US Census tabular | – | New intersectional evaluation metrics | Empirical | Pipeline guidance; no Bayesian audit calibration |
| Gohar & Cheng 2023 | – (survey) | – | – | Taxonomy of intersectional notions | – | Survey |
| Ji et al. 2020 | Many unlabeled, few labeled examples; scores calibratable per group | Several fairness datasets | Hierarchical latent-variable calibration model | Several group metrics | Bayesian posterior | Groups, not sparse intersections; no tolerance-decision error rates |
| Morina et al. 2019 | Single-attribute metrics extend to intersections | One real dataset | n.s. | Intersectional extensions of standard metrics | Estimation for small subgroups (n.s.); post-processing | No pooling-masking analysis |
| Lum et al. 2022 | Group metrics carry sampling noise | Simulation and one real dataset | Variance decomposition (frequentist) | Variance of performance across groups | Double-corrected variance estimator | Summary of spread; not max−min tolerance certification |
| Herlihy et al. 2024 | Subgroup performance has regression structure in group features | Two public datasets, semi-synthetic variants | Structured regression | Subgroup performance metrics | Confidence intervals; goodness-of-fit tests | Closest structured method; false-tolerance rates under an isolated interaction n.s. |
| Himmelreich et al. 2025 | Intersectional problem = statistical uncertainty | Partly empirical | – | Desiderata for intersectional fairness | Simple hypothesis testing (sketch) | Conceptual; no calibrated procedure |
| Cherian & Candès 2024 | Model-agnostic; bootstrap validity | Benchmark datasets | – | Any metric / group criterion | Simultaneous bootstrap bounds (multiple testing) | Frequentist; does not compare Bayesian pooling |
| Hardt et al. 2016 | Group-conditional rates estimable | n.s. | – | Equal opportunity; equalised odds | Post-processing threshold adjustment | Small-group estimation error not addressed |
| Cotter et al. 2019 | Constraints can be enforced on held-out data | n.s. | – | Data-dependent fairness constraints | Two-player constrained optimisation | Training-time generalisation, not audit claims |
| Ding et al. 2021 | Census-derived tasks represent the population | ACS PUMS, all states, multiple years | – | (benchmark) | – | Dataset; ours uses its ACSPublicCoverage task |
| Fogliato et al. 2020 | Observed label is a noisy proxy | Two criminal justice datasets | Sensitivity-analysis framework | Predictive bias | Sensitivity analysis | Different domain; motivates label caveat |
| Berger & Berliner 1986 | Base prior plus ε-contamination class | – (theory) | ε-contaminated priors | – | Posterior ranges; type-II ML | Not about fairness |
| Datta & Lahiri 1995 | Some small areas are outliers | n.s. | Hierarchical Bayes with scale-mixture-of-normal priors | – | Robust hierarchical Bayes | Not about fairness or tolerance claims |
| **This project** | Exchangeable or attribute-structured pooling of TPRs; binomial counts | ACS PUMS 2018 CA (core), TX (replication) | Discrete BN (predictor); beta-binomial, hierarchical logistic, contamination audit models | Intersectional EOpp (primary), DP (secondary) | VE / clique-tree; EB, grid full Bayes, quadrature; simulation calibration | EB plug-in under-covers; calibration design-specific; struct not an exact reproduction of |
