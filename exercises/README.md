# Exercises · submission workflow

All submissions happen through **Pull Requests** from your personal
fork to `chrglez:main`. Christian reviews in the PR; PRs are never
merged — your fork is the audit trail of your work.

## One-off setup (Day 1, Git & GitHub session)

1. Install **R**, **RStudio** and **Git**.
2. Set your Git identity from R (no terminal):

   ```r
   usethis::use_git_config(
     user.name  = "Your Name",
     user.email = "you@ulpgc.es"
   )
   ```

3. Create a **GitHub account** and a Personal Access Token with 90-day
   expiration:

   ```r
   usethis::create_github_token(
     scopes      = c("repo", "user", "workflow"),
     description = "R on my laptop · TIDES course",
     expiration  = 90
   )
   gitcreds::gitcreds_set()   # paste the token
   ```

4. **Fork** the course repo and **clone** your fork from RStudio
   (*File → New Project → Version Control → Git*, HTTPS URL).
5. Add the `upstream` remote. **This is the only terminal command in
   the whole course.** Open *Tools → Terminal → New Terminal* inside
   RStudio and run:

   ```bash
   git remote add upstream https://github.com/chrglez/quantitative-methods-master-tides.git
   ```

## Daily workflow (Days 1–6)

Everything below happens inside **RStudio's Git pane**, except step 1
which happens in the browser.

1. **Sync your fork** — on your fork's GitHub page, click
   **Sync fork → Update branch** if the banner says "behind". Then in
   RStudio click **Pull** (blue arrow) to bring the updates locally.
2. **Create the day's branch** — Git pane → branch dropdown →
   *New Branch…* → name `day-N`, tick *Sync branch with remote*.
3. **Solve** the exercise (`.R` for Days 1–5, `.qmd` for Day 6).
   Save. Run top-to-bottom to confirm no errors.
4. **Commit** — Git pane → tick the file → *Commit* → descriptive
   message → *Commit*.
5. **Push** — Git pane → green up arrow.
6. **Open the Pull Request** on GitHub, title `Day N — Your Full Name`.

> [!IMPORTANT]
> Never commit on `main`. Every day has its own branch. If you are
> unsure where you are, look at the branch selector at the top of the
> Git pane.

## File format

- **Days 1–5** · plain **`.R` script**. Must run top-to-bottom without
  errors.
- **Day 6** · Quarto **`.qmd`**. Must render end-to-end with
  `quarto render` on a fresh clone.

Rendered outputs (`.html`, `.pdf`) are gitignored — do not commit
them.

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
