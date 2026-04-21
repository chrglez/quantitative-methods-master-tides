# Datasets

We anchor every example in the course on two public tourism data
sources. Raw downloads live under `datasets/raw/`, which is gitignored —
only the download script is versioned.

## Sources

### 1. ISTAC · Instituto Canario de Estadística

Local tourism statistics for the Canary Islands.

- Entry point: <https://www.gobiernodecanarias.org/istac/>
- Dissemination API (JSON-stat 2.0):
  <https://datos.canarias.es/api/estadisticas/>
- Series we use regularly:
  - *Encuesta sobre el gasto turístico* (tourism expenditure)
  - *Encuesta de alojamiento turístico* (hotel occupancy & capacity)
  - *Movimientos turísticos en frontera* (border tourism flows)

### 2. Eurostat tourism

Tourism statistics at the European level — nights spent, arrivals,
capacity, receipts.

- Database: <https://ec.europa.eu/eurostat/web/tourism/data/database>
- We pull data via the [`eurostat` R package](https://ropengov.github.io/eurostat/).
- Tables we use regularly:
  - `tour_occ_nim` — nights spent at tourist accommodation, monthly.
  - `tour_cap_nat` — capacity of tourist accommodation, annual.
  - `tour_dem_tqm` — tourism demand, quarterly.

## Download

From the project root, run:

```r
source("datasets/download.R")
```

The script fetches both sources into `datasets/raw/` and writes a
`datasets/raw/MANIFEST.md` recording filename, source URL, and
download date.

## Citation

If you use the data in a publication, cite:

- ISTAC — Gobierno de Canarias. *Estadísticas de turismo*. Las Palmas.
  Accessed YYYY-MM-DD.
- Eurostat — European Commission. *Tourism database*.
  Accessed YYYY-MM-DD.
