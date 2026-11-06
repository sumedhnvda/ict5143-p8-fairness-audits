# Proposal and dated amendments

Problem 8, ICT 5143 capstone. Team: Sumedh Navuda and Aldino. This file separates choices made **before** seeing test
results from decisions made **retrospectively**. The notebook's first two cells hold the same record.

## Original preregistration (frozen before any test-set inspection)
| Item | Value |
|---|---|
| Question | When does hierarchical pooling improve intersectional fairness assessment, and when does it mask a harmful small-group disparity? |
| Decision | D = 1: selected for *hypothetical* information outreach, fixed capacity 30% |
| Label | Y = 1: no public coverage (Folktables ACSPublicCoverage label reversed) |
| Primary utility | recall at capacity; acceptable loss ≤ 0.02 vs the unconstrained rule |
| Primary fairness | intersectional ΔEOpp over race × sex × disability; ε = 0.10 (sensitivity 0.05, 0.15) |
| Tolerance procedure | chosen by simulation calibration (§9, Youden J = ACC − FTS) **before** real-data selection |
| Confirmatory family (Holm) | calibrated procedure vs hierarchical plug-in; vs raw plug-in (test ΔEOpp) |
| Everything else | exploratory |

**Original falsifiable claim (draft):** with one ≤ 20-positive intersection 0.20 below an otherwise homogeneous
population, an EB beta-binomial audit with an upper-quantile rule certifies ΔEOpp ≤ 0.10 in more than 50% of
replicates, and an ε-contamination prior cuts that rate at least in half.

## Amendments (in order; exact calendar dates were not recorded, so the order is given relative to the runs)
| # | When | Amendment | Prospective or retrospective |
|---|---|---|---|
| A1 | before §10–§11 were run | The confirmatory arm is "whatever §9 selects". An earlier draft named "proposed-upper" because a pre-bug-fix calibration (κ bound) chose an upper rule. The literal proposed-upper comparisons are kept as exploratory. | prospective for §10–§11 |
| A2 | after §8–§9 | Draft claim verdict: part 1 holds (0.980); part 2 **not supported** for the calibrated procedure (0.503 > 0.490). Kept on record and not replaced by a post-hoc setting. | retrospective (reporting) |
| A3 | after the CA §10 results, before any Texas run | **H1** formed on CA: pooled validation-time claims fail on test in > 50% of cases. Decision rule fixed in §14.1 before running Texas. | prospective for Texas |
| A4 | after diagnosing §9.2 transfer failure, before the §15 evaluation | **H2a–c**: design-matched calibration beats every established audit by ≥ 0.10 J (H2a) and the §9 calibration by ≥ 0.10 (H2b) on fresh TX worlds; held-out certification makes no false claim (H2c). | prospective for the fresh-seed evaluation; the design itself was motivated by CA results |
| A5 | after the final run (this submission) | Paired bootstrap 95% CIs for ΔJ added from saved per-replicate outputs (`writeup/make_tables.py`). No model refitted. | retrospective (uncertainty reporting only) |

## Outcomes
H1 supported (27/27 Texas claims failed). H2a, H2b and H2c supported. The confirmatory real-gap comparisons are
inconclusive (Holm p = 1.0 and 0.736).
