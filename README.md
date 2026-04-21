# Quantitative Methods in Tourism

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC_BY--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![Quarto](https://img.shields.io/badge/Built%20with-Quarto-75aadb)](https://quarto.org/)

Slides, code and exercises for the **Quantitative Methods in Tourism**
core course (6 ECTS) of the **Master in Tourism and Sustainable
Development**, [TIDES Institute](https://tides.ulpgc.es/), [Universidad de
Las Palmas de Gran Canaria](https://www.ulpgc.es/).

Rendered site: <https://chrglez.github.io/quantitative-methods-master-tides/>

## Instructors

- **Christian González** — Topics 1 & 2 (Introduction to R, Visual exploratory analysis)
- **Juan Hernández Guerra** — Topics 3 & 4 (Machine learning, NLP)

Both at the Department of Quantitative Methods in Economics and
Management, ULPGC.

## Programme

| # | Topic | Sessions | Slides | Status |
|---|---|---|---|---|
| 1 | Introduction to R | Days 1–3 (15 h) | [Git & GitHub](01-introduction-to-r/01-git-github.qmd) · [Data in R](01-introduction-to-r/02-data-in-r.qmd) · [Data wrangling](01-introduction-to-r/03-data-wrangling.qmd) · [Basic statistics](01-introduction-to-r/04-basic-statistics.qmd) | 🚧 Draft |
| 2 | Visual exploratory analysis | Days 4–6 (15 h) | [One variable](02-visual-exploratory-analysis/01-one-variable.qmd) · [Multiple variables](02-visual-exploratory-analysis/02-multiple-variables.qmd) · [Editing documents](02-visual-exploratory-analysis/03-editing-documents.qmd) | 🚧 Draft |
| 3 | Introduction to machine learning | Instructor: Juan Hernández Guerra | — | — |
| 4 | Text classification (NLP) | Instructor: Juan Hernández Guerra | — | — |

Each deck is served both as **HTML** (live, via GitHub Pages) and
**PDF** (exported via `quarto render`).

## Day-by-day schedule (Topics 1 & 2, 30 h over 6 days of 5 h)

| Day | Morning | Afternoon |
|---|---|---|
| 1 | 1 h Git & GitHub essentials · 3 h Data in R | 1 h guided exercise |
| 2 | 4 h Data wrangling with the tidyverse | 1 h guided exercise |
| 3 | 2 h Basic statistics with R | 3 h graded exercise |
| 4 | 2 h One-variable visualisation | 3 h graded exercise |
| 5 | 2 h Multi-variable visualisation | 3 h graded exercise |
| 6 | 2 h Editing reproducible documents | 3 h final graded submission |

## Repository layout

```
.
├── _quarto.yml               project-level config shared by every deck
├── custom.scss               style overlay on top of the clean theme
├── index.qmd                 landing page for the published site
├── assets/                   institute logos (TIDES, Dpto. Métodos Cuantitativos)
├── 00-welcome/               course presentation deck
├── 01-introduction-to-r/     Topic 1 decks
├── 02-visual-exploratory-analysis/  Topic 2 decks
├── exercises/                per-day exercise templates (no solutions)
├── datasets/                 ISTAC and Eurostat tourism data loaders
└── .github/workflows/        GH Pages publication
```

## How students submit exercises

The course repository hosts **only templates** — no solutions. Students
submit by pushing to their **own fork** of this repository. The full
workflow is covered in the Day 1 session *Git & GitHub essentials*; a
summary lives in [`exercises/README.md`](exercises/README.md).

## Local setup

```r
# 1) Install R packages
install.packages(c("tidyverse", "rmarkdown", "knitr", "here",
                   "readxl", "haven", "janitor", "eurostat"))

# 2) Install the Quarto theme extension (run once per clone)
# From the project root, in a terminal:
#   quarto install extension grantmcdermott/quarto-revealjs-clean

# 3) Render everything
#   quarto render
```

Quarto ≥ 1.4, R ≥ 4.3 and Git are required.

## Datasets

We anchor examples on two public tourism data sources:

- [**ISTAC**](https://www.gobiernodecanarias.org/istac/) — Instituto Canario
  de Estadística: local tourism statistics for the Canary Islands.
- [**Eurostat tourism**](https://ec.europa.eu/eurostat/web/tourism/data/database)
  — European-level nights spent, arrivals and capacity.

See [`datasets/README.md`](datasets/README.md) for download scripts and
references.

## Credits

This course is adapted from the earlier R course by Jaime Pinilla and
Christian González for ESSSCAN (October 2022):
<https://github.com/chrglez/slidescursoessscan>.

Slide theme based on [`grantmcdermott/quarto-revealjs-clean`](https://github.com/grantmcdermott/quarto-revealjs-clean)
(MIT License) with local style overlay.

## License

Content released under [Creative Commons Attribution-ShareAlike 4.0
International](https://creativecommons.org/licenses/by-sa/4.0/).
