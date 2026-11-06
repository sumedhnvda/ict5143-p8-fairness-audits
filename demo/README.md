# Demonstration (about 2 minutes)

**1. Live, about 15 s: regenerate the headline uncertainty from saved outputs.**
```bash
python writeup/make_tables.py        # needs numpy + pandas only
```
Expected first lines (deterministic, seed 20261106):
```
state  ...  comparator                          role              dJ    lo95   hi95
   TX  ...  fullbayes · plugin                  best established  0.279 0.235  0.322
   TX  ...  §9 procedure (robust@0.8 · plugin)  §9 calibration    0.475 0.422  0.525
   CA  ...  fullbayes · plugin                  best established -0.004 -0.057 0.046
```
It also rewrites `writeup/tables/*.tex` and `results/v2_paired_J_ci.csv`.

**2. Show the evidence in the executed notebook** (no re-run needed): §3.1 inference agreement (3.33e-16), §14.1 H1
verdict (27/27), §15.3 J table, §15.4 held-out certification.

**3. Full regeneration, about 30 min on 1 CPU core, downloads about 435 MB:**
```bash
.venv/bin/jupyter nbconvert --to notebook --execute --inplace Problem8_Intersectional_Fairness.ipynb \
    --ExecutePreprocessor.timeout=7200 --ExecutePreprocessor.kernel_name=p8
```

**Offline fallback:** [`saved_trace.txt`](saved_trace.txt) contains the verbatim saved outputs of those four cells and of
step 1.

**Failure to explain during the demo:** the §9 calibration chosen on invented group sizes accepts only 22% of fair Texas
worlds (J = 0.189). That is why the audit is recalibrated on the target design.
