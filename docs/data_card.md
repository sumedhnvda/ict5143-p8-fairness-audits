# Data card: ACSPublicCoverage, California 2018 (core) and Texas 2018 (replication)

| Field | Value |
|---|---|
| Source | U.S. Census Bureau, American Community Survey PUMS 2018 1-Year person files, via Folktables `ACSDataSource(survey_year="2018", horizon="1-Year", survey="person")` |
| Licence / terms | ACS PUMS is public-domain U.S. government data. Folktables code is MIT-licensed. Data are **not** redistributed in this repository (see `data/README.md`). |
| Task | Folktables `ACSPublicCoverage`: filter AGEP < 65 and PINCP ≤ 30,000; 19 features; features verified identical cell by cell to `df_to_numpy` |
| Label | **Y = 1 − 1[PUBCOV = 1]: no public health coverage** in the ACS record. Not uninsurance (private coverage counts as Y = 1), not programme eligibility. Exact reversal verified in code. |
| Population (CA) | 138,554 people in 85,182 households; P(Y = 1) = 0.631 |
| Population (TX) | 98,928 people |
| Protected attributes | RAC1P (9 recorded codes), SEX (2), DIS (2), used as recorded: never collapsed, never inferred. 36 possible intersections; 35 observed on the seed-0 CA test split, of which 21 have ≥ 30 positives |
| Sampling unit and dependence | Household (SERIALNO). Splits are 60/20/20 household-disjoint over 5 seeds; the bootstrap resamples households |
| Weights | PWGTP and 80 replicate weights kept for bookkeeping. The primary estimand is the **unweighted benchmark sample**. Weighted TPRs with replicate SEs are a robustness check (§13) |
| Missing values | PUMS "not applicable" coded 0, matching Folktables |
| Preprocessing | AGEP and SCHL fixed bins; PINCP training-split quartiles; all fitted on training only |
| Known limitations | Self-reported coverage, label noise unmodelled; very small intersections (1–7 positives); survey categories are constructs; results describe one year and two states |
| Intended estimand | Group TPRs of a frozen outreach rule on held-out households of the benchmark sample |
| Access | Automatic download on first notebook run (about 435 MB into `data/`), or the state zip from the Census FTP site |
