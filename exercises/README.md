# Exercises · submission workflow

This folder holds the **templates** for every exercise in the course.
Solutions are **never** committed to this repository.

## How to submit

1. **Fork** the course repo on GitHub (one-off, Day 1):
   <https://github.com/chrglez/quantitative-methods-master-tides>
2. **Clone** your fork to your laptop:
   ```bash
   git clone git@github.com:<your-user>/quantitative-methods-master-tides.git
   cd quantitative-methods-master-tides
   ```
3. For each day, work on the file under `exercises/dayN/exercise-template.qmd`.
   Fill in your name and the date in the YAML header.
4. `git add`, `git commit -m "Day N solution"`, `git push` to your fork.
5. Paste the URL of your rendered file (or your fork URL) into the
   submission form on the course portal.

## Layout per day

```
exercises/dayN/
├── README.md                 description of the exercise
└── exercise-template.qmd     Quarto template you fill in and push
```

## Schedule

| Day | Type | Weight |
|---:|---|---:|
| 1 | Guided | formative |
| 2 | Guided | formative |
| 3 | Graded | 20 % |
| 4 | Graded | 20 % |
| 5 | Graded | 20 % |
| 6 | Final submission | 40 % |

## Grading criteria

- **Correctness** of the R code and the reported results.
- **Reproducibility** · the `.qmd` renders end-to-end on a clean clone.
- **Clarity** of the exposition (one conclusion per paragraph, labelled plots).
- **Git hygiene** · descriptive commit messages, no stray artefacts.
