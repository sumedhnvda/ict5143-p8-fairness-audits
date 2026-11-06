# Data (not redistributed)

| Field | Value |
|---|---|
| Dataset | U.S. Census Bureau, American Community Survey (ACS) PUMS, 2018 1-Year, person files for California and Texas |
| Access | Folktables `ACSDataSource(survey_year="2018", horizon="1-Year", survey="person", root_dir="data").get_data(states=[...], download=True)` downloads from the Census FTP site on the notebook's first run. Offline fallback: if the download fails, place the Census state zip (`csv_pca.zip`, `csv_ptx.zip`) in the project root or in `data/`; the notebook extracts it into `data/2018/1-Year/` |
| Release | 2018 ACS 1-Year PUMS, as served by the Census Bureau (accessed October 2026) |
| Licence | U.S. government public-domain data; cite the Census Bureau and Folktables (Ding et al., NeurIPS 2021). Folktables code is MIT-licensed |
| Size | about 435 MB for CA + TX |
| Checksums | not recorded for the submitted run. Integrity is checked in-notebook instead: the features must equal Folktables' `df_to_numpy` output cell by cell, and the row count (CA 138,554; TX 98,928) must match |
| Exclusions | Folktables ACSPublicCoverage filter: AGEP < 65 and PINCP ≤ 30,000 |
| Preprocessing | Done inside the notebook only (§1–§2); nothing processed is stored |
| Permitted storage | Local only. `data/` is git-ignored apart from this file |

No credentials are needed. Do not commit raw or processed records.
