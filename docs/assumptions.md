# Assumptions (summary)

Full register, 39 numbered assumptions with location, check, evidence, consequence and status:
[`writeup/assumptions_register.pdf`](../writeup/assumptions_register.pdf). Status counts: 7 verified, 8 true by
construction, 12 partly checked, 5 untested, 3 value judgements, 4 violated. **All claims are associational.** The only
causal-sounding statements concern our own simulation generator, where truth is set by construction.

## The 12 assumptions that affect the conclusions
| ID | Assumption and evidence | Status | Sensitivity test / consequence |
|---|---|---|---|
| F4 | Validation-fitted thresholds transfer to test. All 116 (CA) and 27 (TX) pooled validation claims failed on test | **violated** | the basis of H1; addressed by held-out certification |
| A3 | Attribute-structured pooling captures the deficit. It masks interaction-only deficits (FTS 0.23–0.37) | **violated** | semi-synthetic interaction world (§9.2) |
| A4 | Empirical-Bayes plug-in intervals are adequate. `struct` covers 0.665 at nominal 0.90 (oracle 0.905) | **violated** | coverage study (§6.1) |
| C1 | The synthetic calibration design is representative. ACC falls from 0.830 to 0.32 on the real design | **violated** | addressed by design-matched calibration (C5) |
| F1 | Equality of opportunity is the right primary criterion for outreach | value judgement | ΔDP and ΔEOdds reported as diagnostics |
| F2 | ε = 0.10, 30% capacity and a 0.02 utility budget are acceptable to stakeholders | value judgement | ε ∈ {0.05, 0.10, 0.15}; no stakeholder input obtained |
| C2 | Youden J (equal weight on false certification and false alarm) selects the procedure | value judgement | ACC and FTS reported separately |
| D2 | PUBCOV is reported without group-dependent error | untested | group-dependent label noise would bias TPR gaps |
| S3 | The replicate-weight variance formula applies to the test subsample | untested | weighted results are secondary |
| P2 | The BN discretisation loses little information | untested | LR and GBT on raw features as baselines |
| A1 | Individuals within an intersection are independent (household clustering ignored in the audit likelihood) | untested | household bootstrap used for real comparisons |
| A7 | The 60 × 60 grid represents the full-Bayes hyperposterior | untested | grid resolution not varied; full-Bayes results are comparators only |
