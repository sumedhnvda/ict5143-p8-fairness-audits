# Contributions

Team 5: **Sumedh Navuda** (Student 1, 261090830007) and **Aldino** (Student 2, 261090830006). Signed statements:
[`writeup/contribution_statements.pdf`](../writeup/contribution_statements.pdf). The work was divided by pipeline stage.
Each student reviewed the other's stages and can explain the whole pipeline. Commit count is not a measure of
contribution.

| Work item | Lead | Support / reviewer | Artefact | What was verified |
|---|---|---|---|---|
| Research question, preregistration, confirmatory family | Sumedh Navuda | Aldino | notebook top cells, `docs/proposal.md` | confirmatory family matches §11 Holm family |
| Literature review (19 papers), comparison table, narrowed claim, H1 | Sumedh Navuda | Aldino | `writeup/literature_review.tex`, `docs/related_work.md` | closest-work rows against the `struct` and contamination audits |
| Data acquisition, label reversal, data card, household split | Sumedh Navuda | Aldino | §1–§2, `docs/data_card.md` | no SERIALNO in two splits; label is exactly 1 − 1[PUBCOV = 1] |
| Predictive BN, VE, clique-tree check, LR/GBT baselines | Sumedh Navuda | Aldino | §3–§4.1 | VE vs clique tree 3.3e-16; CI check |
| Experiment 1 | Sumedh Navuda | Aldino | §5 | 21 of 35 test groups with ≥ 30 positives |
| Audit models (EB, full Bayes, `struct`, contamination) and verification | Aldino | Sumedh Navuda | §6, §6.1 | beta-binomial posterior mean by hand; quadrature and gradient checks |
| Experiments 3 and 4, calibration, semi-synthetic worlds, robustness | Aldino | Sumedh Navuda | §7–§9.2, §12 | frozen §9 rule reused unchanged in §9.2 |
| Experiments 2 and 5, bootstrap, Holm, survey weights | Aldino | Sumedh Navuda | §10, §11, §13 | Holm p recomputed (0.368 → 0.736) |
| Texas replication and H1 test | Sumedh Navuda | Aldino | §14, `results/h1_texas_test.csv` | decision rule fixed before the run; 27/27 count |
| Improved audit (design-matched calibration, held-out certification), H2 | Aldino | Sumedh Navuda | §15, `results/v2_*.csv` | J recomputed from `v2_eval_*.csv`; paired CI |
| Manuscript, report, slides | both | both | `writeup/`, `report/`, `slides/` | every number traced to `results/` |
| Model card, assumptions register | Aldino | Sumedh Navuda | `writeup/` | statuses match notebook evidence |
| README, repository, reproducibility | Sumedh Navuda | Aldino | `README.md`, `docs/`, `results/manifest.csv` | setup commands and manifest |

**Talk split.** Sumedh Navuda: slides 1–5 (question, closest work, data, graphical model and inference). Aldino:
slides 6–10 (fairness criterion and method, protocol, results, ablations, conclusion).

## Individual statements (short form)
**Sumedh Navuda.** *Technical decision:* split by household (SERIALNO) rather than by person, so that people who share
circumstances never sit on both sides of a split. *Difficulty or failure:* the draft claim that the contamination prior
halves false certification failed (0.503 vs the required 0.490). We kept it on record, narrowed the claim, and tested
H1 out of sample on Texas. *Cross-check:* recomputed Aldino's beta-binomial posterior mean by hand, the Holm adjustment,
and J with its paired interval from `results/v2_eval_*.csv`.

**Aldino.** *Technical decision:* rank audit procedures by J = ACC − FTS, fixed before calibration, so that a procedure
cannot win by never or always certifying. *Difficulty or failure:* the calibration chosen on invented group sizes did not
transfer (fair-world acceptance 0.83 → 0.32 on the California design). This motivated design-matched calibration.
*Cross-check:* verified Sumedh's household-disjoint splits, the exact label reversal, VE vs clique-tree agreement and the
Experiment 1 denominators.

**Assistance disclosure.** An AI coding assistant (Claude Code) helped draft code, LaTeX and documentation. Every reported
number was checked against the saved notebook outputs in `results/`.
