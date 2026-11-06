# Requirement-to-evidence matrix

Command for every row: execute the notebook (`jupyter nbconvert --to notebook --execute --inplace
Problem8_Intersectional_Fairness.ipynb`, config = notebook §0 constants, mirrored in `configs/frozen_settings.yaml`).
Rows marked † also need `python writeup/make_tables.py`. "§" = notebook section; "R" = report section; "S" = slide.
Status: complete / partial / failed / missing, with justified N/A listed separately at the end.

| ID | Source requirement | Location | Artefact and key finding | Status / limitation | Report / slide |
|---|---|---|---|---|---|
| C-DATA | ACSPublicCoverage via Folktables, CA 2018; target reversal | §1 | features identical to `df_to_numpy`; exact label reversal; 138,554 rows | complete | R2 / S4 |
| C-SPLIT | Problem-specific split unit (household) | §2 | household-disjoint 60/20/20, 5 seeds | complete | R2 / S4 |
| C-GM | Exact VE and clique-tree agreement on a tractable instance | §3.1 | max abs error 3.33e-16 < 1e-9 over 200 evidence masks | complete | R3 / S5, S12 |
| C-NORM | Factor scopes, normalisation, evidence handling | §3, §3.1 | Factor class validates shapes; normalised posteriors; fast scorer == VE | complete | S12 |
| C-CI | Relevant joint conditional independence | §3.1 | SEX ⟂ {AGEP, DIS} given Y in the fitted model | complete | S5, S12 |
| C-PRED | Predictive baselines (LR, GBT) at matched capacity | §4.1 | `predictive_and_fairness_by_seed.csv`: AUROC BN 0.729, LR 0.716, GBT 0.768 | complete | R4 / S5 |
| C-PROB | Log loss, Brier, group calibration | §4.1 | BN log loss 0.577, Brier 0.196; `group_calibration.png` | complete | R4 |
| C-METRIC | ΔDP, ΔEOpp, ΔEOdds, R_sel, denominators, < 30 flags | §4, §5 | `exp1_single_two_three_way.csv` | complete | R2 |
| C-SEED | ≥ 5 seeds | §4.1, §10, §14, §15 | 5 household splits | complete | R3 / S7 |
| C-STAT | Paired uncertainty with a valid sampling unit, B ≥ 1000 | §11 | household bootstrap B = 1000; proposed − raw ΔEOpp −0.052 [−0.194, 0.051] | complete | R4 / S9 |
| C-HOLM | Declared confirmatory family with Holm correction and effect sizes | §11 | `confirmatory_bootstrap.csv`: Holm p 1.0, 0.736 | complete; inconclusive | R4 / S12 |
| C-LIT | ≥ 8 papers incl. recent, comparison table, closest method | `docs/related_work.md` | 19 papers 1986–2025 | complete; several rows from abstracts only | R1 / S3 |
| C-CLAIM | Falsifiable contribution; claim narrowed where literature answers it | top cell, §14.1 | H1 tested on TX: supported (27/27) | complete | R1 / S2, S3 |
| C-SYN | Synthetic results labelled | §6.1, §8, §9, §9.2, §15 | SYNTHETIC / SEMI-SYNTHETIC labels | complete | R5 |
| P8-M1 | Compact predictive BN, Dirichlet smoothing, VE | §3 | `bn_structure.png`; α = 1 | complete | R2 / S5 |
| P8-M2 | Hierarchical beta-binomial audit, EB and a small hierarchical sampler | §6 | EB, full-Bayes grid, contamination prior | complete | R2 / S6 |
| P8-T1 | Attribute-structured hierarchical audit (`struct`) | §6, §6.1 | quadrature 9.6e-11, gradient 2.0e-6; coverage 0.665 vs oracle 0.905 | complete; restricted version, not an exact reproduction of Foulds et al. | R1, R4 / S6 |
| P8-T2 | Semi-synthetic simulation on the real validation design | §9.2 | `semisynthetic_summary.csv`; EB pulls a 0.18 target to ≈ 0.38 | complete | R4 / S9 |
| P8-E1 | Single-attribute vs intersectional audit | §5 | ΔEOpp 0.162 (sex) → 0.746 (three-way) | complete | R4 / S4 |
| P8-E2 | Thin train/val intersections, independent evaluation | §10 | 4 thinning levels × 5 seeds, `selection_all.csv` | complete | S7 |
| P8-E3 | Empirical vs independent vs pooled on real counts | §7 | `exp3_estimates_real.csv`; supported groups move ≤ 0.032; P(Δ > 0.10) = 1 | complete | R4 |
| P8-E4 | Homogeneous vs exceptional worlds: coverage, false fairness conclusions | §8, §9.2 | EB upper 0.9 false-certifies 98% | complete | R4 / S9 |
| P8-E5 | Ordinary vs uncertainty-aware selection at matched capacity and utility | §10 | 116/116 CA pooled claims false on test; recall cost 0.008 | complete | R4 / S8 |
| P8-A1 | Ablation: no pooling / complete pooling / posterior mean vs upper quantile | §8, §10 | raw and independent never certify; complete gives gap 0 by construction | complete | R4 |
| P8-A2 | Ablation of the proposed method: without design matching; without held-out certification | §15 | J 0.189 vs 0.664; same-data 10/10 false claims vs held-out 0 | complete | R4 / S9 |
| P8-R1 | Robustness: priors and pooling strength, prevalence, tolerance | §9.1, §12 | `sim_robustness.csv`; real gap exceedance 1.0 at ε ∈ {0.05, 0.10, 0.15} | complete | S9 |
| P8-R2 | Robustness: thinning rates, atypical small group | §9.2, §10 | keep 1 / 0.5 / 0.25 / 0.10 | complete | S9 |
| P8-R3 | Second state | §14 | Texas 2018 baseline and H1 | complete | R4 / S8 |
| P8-R4 | Household dependence; declared survey estimand | §2, §11, §13 | weighted TPRs with 80 replicate weights | complete; sex × disability groups only | R2 |
| P8-COV | Frequentist coverage of Bayesian intervals by repeated simulation | §6.1, §8, §9.2 | `struct_coverage_check.csv` | complete | S12 |
| P8-VIS | Visualise the hierarchy, quantify the pull, compare with raw counts | §6, §7 | `audit_model_structure.png`, `real_pooling_pull.png` | complete | — |
| P8-CAL | Calibrate the tolerance procedure by simulation | §9, §15 | §9 Youden choice robust@0.8 plug-in; design-matched choices per state | complete | R2 / S6 |
| P8-H2 | Proposed improvement tested out of sample | §15 † | ΔJ +0.279 [0.235, 0.322] TX; CA tie −0.004 [−0.057, 0.046]; H2a–c supported | complete; one generator family; CA not improved on J | R4 / S8 |
| D-CARD | Data card, model card, assumptions register | `docs/`, `writeup/` | data_card.md, model_card.pdf, assumptions_register.pdf (39 rows) | complete | — |
| D-CONTRIB | Individual contributions and cross-review | `docs/contributions.md`, `writeup/contribution_statements.pdf` | lead/reviewer table, individual statements | complete; signatures by hand | R6 / S10 |
| D-REPORT | 2–3 page report and Beamer slides | `report/`, `slides/` | 3-page report; 10 + 3 slides | complete | — |
| D-DEMO | Short demonstration with saved trace | `demo/` | `make_tables.py` regenerates ΔJ in about a minute; `saved_trace.txt` | complete | S13 |

**Justified N/A.** `src/`, `scripts/` and `tests/`: by design, all code lives in one self-contained executed notebook,
and the correctness tests are 11 `assert` checks inside it (§3.1 inference agreement, §6.1 quadrature and gradient,
§15.3 truth-label assertions, label-reversal and feature-equality checks in §1). `data/raw`, `data/processed`: restricted
storage, so the data are downloaded locally and git-ignored. `results/logs/`: the executed notebook's saved outputs are
the run log, with runtime 29.3 min.
