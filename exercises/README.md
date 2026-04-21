# Exercises · submission workflow

This folder holds the **templates** for every exercise in the course.
Solutions are **never** committed to this repository — they live only
on each student's fork, reviewed via Pull Requests.

## One-off setup (Day 1)

1. **Fork** the course repo on GitHub:
   <https://github.com/chrglez/quantitative-methods-master-tides>
2. **Clone** your fork locally:
   ```bash
   git clone git@github.com:<your-user>/quantitative-methods-master-tides.git
   cd quantitative-methods-master-tides
   ```
3. Add the course repo as an `upstream` remote so you can pull updates:
   ```bash
   git remote add upstream git@github.com:chrglez/quantitative-methods-master-tides.git
   ```

## For every exercise (Days 1–6)

1. Start from an up-to-date `main`:
   ```bash
   git checkout main
   git pull upstream main
   ```
2. Create a branch for the day:
   ```bash
   git checkout -b day-N
   ```
3. Open the template (`exercises/dayN/exercise-template.R` for Days
   1–5, `exercises/day6/exercise-template.qmd` for Day 6), solve it,
   save it.
4. Commit and push the branch **to your fork**:
   ```bash
   git add exercises/dayN/
   git commit -m "Day N solution"
   git push -u origin day-N
   ```
5. On GitHub, open a **Pull Request** from
   `your-user:day-N` to `chrglez:main`. The PR title must be
   `Day N — <your full name>`.
6. Christian reviews the PR and leaves feedback in inline comments.

::: callout-important
PRs are **never merged**. The course `main` keeps the templates
unchanged; your solutions live on your fork's branch. Christian closes
the PR once the exercise is graded.
:::

## File format

- **Days 1–5** · plain **`.R` script**. Must run top-to-bottom without
  errors.
- **Day 6** · Quarto **`.qmd`**. Must render end-to-end with
  `quarto render` on a fresh clone.

Rendered outputs (`.html`, `.pdf`) are gitignored — do not commit them.

## Schedule and weights

| Day | Type | Weight |
|---:|---|---:|
| 1 | Guided `.R` | formative |
| 2 | Guided `.R` | formative |
| 3 | Graded `.R` | 25 % of module share |
| 4 | Graded `.R` | 25 % of module share |
| 5 | Graded `.R` | 25 % of module share |
| 6 | Final `.qmd` | 50 % of module share |

(Modules I and II together account for 50 % of the subject mark;
Module III accounts for the other 50 %.)

## Grading criteria

- **Correctness** of the R code and the reported results.
- **Reproducibility** · Day 6 `.qmd` renders end-to-end from a clean
  clone.
- **Clarity** of the exposition (one conclusion per paragraph,
  labelled plots, source notes).
- **Git hygiene** · meaningful commit messages, clean PR diff, no
  stray artefacts.
