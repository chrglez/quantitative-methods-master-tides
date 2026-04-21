# Download every dataset used in the course.
#
# Usage (from the project root):
#   source("datasets/download.R")
#
# Creates:
#   datasets/raw/*           data files
#   datasets/raw/MANIFEST.md record of filenames, URLs and dates

suppressPackageStartupMessages({
  library(here)
  library(fs)
  library(readr)
  library(dplyr)
})

raw_dir <- here("datasets", "raw")
dir_create(raw_dir)

manifest <- tibble::tibble(
  file   = character(),
  source = character(),
  url    = character(),
  date   = as.Date(character())
)

# --- Eurostat ---------------------------------------------------------------
if (!requireNamespace("eurostat", quietly = TRUE)) {
  install.packages("eurostat")
}

eurostat_tables <- c(
  nights_monthly   = "tour_occ_nim",
  capacity_annual  = "tour_cap_nat",
  demand_quarterly = "tour_dem_tqm"
)

for (nm in names(eurostat_tables)) {
  code <- eurostat_tables[[nm]]
  message("Fetching Eurostat ", code, " ...")
  dat <- eurostat::get_eurostat(code, time_format = "date")
  file <- path(raw_dir, paste0("eurostat-", nm, ".csv"))
  write_csv(dat, file)
  manifest <- add_row(manifest,
    file   = path_file(file),
    source = "Eurostat",
    url    = paste0("https://ec.europa.eu/eurostat/databrowser/view/", code),
    date   = Sys.Date()
  )
}

# --- ISTAC -----------------------------------------------------------------
# ISTAC exposes JSON-stat 2.0 endpoints. To keep this script self-contained,
# the example below pulls one representative series. Extend as needed.

istac_series <- list(
  nights_by_island = paste0(
    "https://datos.canarias.es/api/estadisticas/statistical-resources/",
    "v1.0/datasets/ISTAC/E16028A_000001/001.000?dim=GEOGRAPHICAL%5B",
    "CANARIAS%5D&format=CSV"
  )
)

for (nm in names(istac_series)) {
  url <- istac_series[[nm]]
  file <- path(raw_dir, paste0("istac-", nm, ".csv"))
  message("Fetching ISTAC ", nm, " ...")
  tryCatch({
    download.file(url, destfile = file, mode = "wb", quiet = TRUE)
    manifest <- add_row(manifest,
      file   = path_file(file),
      source = "ISTAC",
      url    = url,
      date   = Sys.Date()
    )
  }, error = function(e) {
    warning("ISTAC ", nm, " failed: ", conditionMessage(e),
            "\nDownload it manually from https://www.gobiernodecanarias.org/istac/")
  })
}

# --- Manifest --------------------------------------------------------------
manifest_path <- path(raw_dir, "MANIFEST.md")
manifest_lines <- c(
  "# Raw data manifest",
  "",
  paste0("Generated on ", Sys.Date(), "."),
  "",
  "| File | Source | URL | Downloaded |",
  "|---|---|---|---|",
  apply(manifest, 1, \(r) sprintf("| %s | %s | <%s> | %s |",
                                  r["file"], r["source"], r["url"], r["date"]))
)
writeLines(manifest_lines, manifest_path)

message("Done. Files in ", raw_dir)
