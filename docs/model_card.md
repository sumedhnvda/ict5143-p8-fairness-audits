# Model card (summary)

The full card is [`writeup/model_card.pdf`](../writeup/model_card.pdf) (source `writeup/model_card.tex`). Developers:
Sumedh Navuda and Aldino (contact sumedhnavuda@outlook.com). Licence: MIT (code).

| Field | Summary |
|---|---|
| Purpose | Research artefact for studying intersectional fairness **audits**. It must not be used for decisions about real people. |
| Predictive model | Discrete augmented naive-Bayes BN: Y parent of 18 features plus 10 feature edges; Dirichlet α = 1; exact variable elimination. Associational, not causal. |
| Decision rule | Top 30% by score (validation threshold); group-threshold family R(λ) for selection experiments |
| Audit models | raw, independent Beta(1,1), complete, hierarchical EB, full-Bayes grid, `struct` (hierarchical logistic), contamination prior (proposed, design-matched) |
| Protected attributes at prediction time | **Yes.** Race, sex and disability are BN features; for λ > 0 the thresholds use the intersection |
| Group performance | Test AUROC 0.729 ± 0.004, log loss 0.577, Brier 0.196, max group ECE 0.110; recall at capacity 0.388. Intersectional ΔEOpp 0.719 ± 0.018 (5 splits); disabled groups' TPR ≤ 0.08 |
| Calibration | Group reliability curves (§4.1); the BN is the least calibrated of BN, LR and GBT |
| Audit reliability | Design-matched audit on fresh Texas worlds: ACC 0.832, FTS 0.168, J 0.664 (vs ≤ 0.385 for established audits; ΔJ +0.279 [0.235, 0.322]). On the California design it ties (−0.004 [−0.057, 0.046]) |
| Prohibited extrapolations | Calling any rule here "fair" (minimum test gap 0.227); reading BN edges causally; treating Y as need or eligibility; using simulated TPRs as population facts; applying the calibrated audit to a different design without recalibrating |
| Limitations | One generator family for simulations; zero held-out claims shows abstention, not sensitivity; `struct` under-covers (0.665 at nominal 0.90); no stakeholder input on ε or capacity |
