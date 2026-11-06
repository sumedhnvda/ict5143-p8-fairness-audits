# Evaluation protocol

All settings are notebook §0 constants, mirrored in [`configs/frozen_settings.yaml`](../configs/frozen_settings.yaml).

| Item | Choice |
|---|---|
| Splits | 60/20/20 **household-disjoint** (SERIALNO), seeds 0–4. Train fits discretisation edges, CPTs, LR and GBT. Validation fits thresholds, λ and certification. Test only evaluates frozen rules. |
| Capacity | 30%, threshold set on validation; test selection rates 0.292–0.305 |
| Primary utility | recall at capacity; acceptable loss ≤ 0.02 vs λ = 0 (observed mean cost 0.008, max 0.013) |
| Primary fairness | intersectional ΔEOpp = max − min TPR over race × sex × disability groups with ≥ 30 positives (all-defined variant also reported); ε = 0.10 |
| Diagnostics | ΔDP (range of selection rates), ΔEOdds (max of TPR and FPR ranges), selection-rate ratio min/max (undefined if the max is 0), worst-group recall, group ECE, log loss, Brier, PPC, interval coverage and width |
| Small groups | groups with < 30 relevant observations are flagged exploratory and kept visible; zero-positive TPR is undefined |
| Audit criteria | plug-in (range of posterior means) or upper-q (q-quantile of the posterior range), certify if ≤ ε |
| Audit-procedure score | J = ACC − mean FTS on worlds with known truth (homogeneous; cell, interaction and disability-main-effect deficits of 0.20; keep 1 and 0.5), fixed **before** calibration; ties broken by lower FTS |
| Proposed procedure | design-matched calibration on the target state's seed-0 validation group sizes (200 worlds per cell); evaluation on a fresh seed (777); held-out certification: choose λ on validation half A, certify on half B (household split) |
| Seeds | 5 household splits for real data; fixed simulation seeds; BN, LR and EB fits are deterministic given the split; GBT uses random_state = split seed |
| Evaluation uncertainty | household-cluster Poisson(1) bootstrap, B = 1000, weights shared by both arms (paired); percentile 95% CI; effect size = estimate / bootstrap SD |
| Training uncertainty | paired differences across the 5 refits |
| Scenario uncertainty | simulation grids (prevalence, deficit size, ε, slab prior, thinning) and Texas replication |
| ΔJ uncertainty | paired bootstrap over simulated worlds within each (world, keep) cell, B = 2000 (`writeup/make_tables.py`) |
| Confirmatory family | {calibrated procedure vs hierarchical plug-in, calibrated procedure vs raw plug-in} on test ΔEOpp, Holm-corrected. Everything else, including all `struct` comparisons, is exploratory |
| Hypotheses tested out of sample | H1 on Texas (supported if > 50% of pooled validation claims fail on test); H2a/H2b on fresh Texas worlds (ΔJ ≥ 0.10); H2c on real CA+TX (no held-out claim fails) |
| Inference check | own VE (two orders), pgmpy VE, clique tree and enumeration on a 6-node sub-network with 200 evidence masks, tolerance 1e-9; full-BN fast scorer vs general VE; joint CI SEX ⟂ {AGEP, DIS} given Y |
