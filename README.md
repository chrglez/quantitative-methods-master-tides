# Quantitative Methods in Tourism

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC_BY--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![Quarto](https://img.shields.io/badge/Built%20with-Quarto-75aadb)](https://quarto.org/)

Slides, code and exercises for the **Quantitative Methods in Tourism**
core course (6 ECTS) of the **Master in Tourism and Sustainable
Development**, [TIDES Institute](https://tides.ulpgc.es/), [Universidad de
Las Palmas de Gran Canaria](https://www.ulpgc.es/).

Rendered site: <https://chrglez.github.io/quantitative-methods-master-tides/>

Campus Virtual: <https://aep26.ulpgc.es/course/view.php?id=2942>
(announcements and final grade only).

## Instructors

- **Christian González Martel** — <christian.gonzalez@ulpgc.es> · Office D-4-07 · Modules I & II
- **Juan M. Hernández Guerra** — <juan.hernandez@ulpgc.es> · Office D-4-20 · Module III

Both at the Department of Quantitative Methods in Economics and
Management, ULPGC. Full tutorial hours on the welcome deck.

## Programme

The subject has **three modules**. This repository covers Modules I
and II (30 h, 6 days of 5 h); Module III is taught separately.

| # | Module | Slides | Status |
|---|---|---|---|
| I | Introduction to R | [Data in R](01-introduction-to-r/01-data-in-r.qmd) · [Git & GitHub](01-introduction-to-r/02-git-github.qmd) · [Data wrangling](01-introduction-to-r/03-data-wrangling.qmd) · [Basic statistics](01-introduction-to-r/04-basic-statistics.qmd) | 🚧 Draft |
| II | Visual exploratory analysis | [One variable](02-visual-exploratory-analysis/01-one-variable.qmd) · [Multiple variables](02-visual-exploratory-analysis/02-multiple-variables.qmd) · [Editing documents](02-visual-exploratory-analysis/03-editing-documents.qmd) | 🚧 Draft |
| III | Introduction to machine learning | Regression · Classification · Text classification (NLP) | Out of scope |

Each deck is served both as **HTML** (live, via GitHub Pages) and
**PDF** (exported via `quarto render`).

## Evaluation

Within each of Modules I and II:

| Component | Weight |
|---|---:|
| Guided exercises (Days 1–2) | 25 % |
| Proposed exercises (Days 3–5) | 25 % |
| Final exercise (Day 6) | 50 % |

Pass threshold: **50 %** overall. Modules I + II together contribute
**50 %** of the subject mark; Module III contributes the other 50 %.

Classroom **EA 0.1** · Official exam dates **June 8** and **June 29, 2026**.

## Day-by-day schedule (Modules I & II, 30 h over 6 days of 5 h)

Sessions run **16:00–21:00** at classroom **EA 0.1**, with a short break
around 18:00.

| Day | First half · lecture | Second half · hands-on |
|---|---|---|
| 1 | 3 h Data in R · 1 h Git & GitHub essentials | 1 h guided exercise |
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
submit by pushing to their **own fork** of this repository.

- **First-time setup** · [`SETUP.md`](SETUP.md) — install, fork, clone,
  PAT, packages, data download.
- **Daily loop** · [`exercises/README.md`](exercises/README.md) — branch,
  solve, commit, push, open PR.

The same flow is also covered live in the Day 1 session
*Git & GitHub essentials*.

## Building the site (instructors only)

```r
# 1) Install R packages used by the slide examples
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
