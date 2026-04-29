# Setup · from zero to ready

One-time onboarding for students of *Quantitative Methods in Tourism*.
Follow the steps in order. Stop at the end of section 3 and you are
ready to solve the Day 1 exercise.

> Full submission workflow (the daily loop) is in
> [`exercises/README.md`](exercises/README.md). Slides for the same
> material live at <https://chrglez.github.io/quantitative-methods-master-tides/>.

---

## 1 · Install R, RStudio and Git (once per laptop)

- **R** · <https://cloud.r-project.org>
- **RStudio Desktop** · <https://posit.co/download/rstudio-desktop/>
- **Git**
  - Windows · <https://git-scm.com/download/win> (accept all defaults)
  - macOS · `brew install git` or install the Xcode Command Line Tools
  - Linux · `sudo apt install git` (Debian/Ubuntu)

Restart RStudio after the Git install — it detects Git automatically.

## 2 · GitHub account and credentials (once per laptop)

In the **R console**:

```r
# 2.1 — Set your Git identity (use the email you'll register on GitHub)
usethis::use_git_config(
  user.name  = "Your Name",
  user.email = "you@ulpgc.es"
)

# 2.2 — Open the GitHub signup / sign-in page
#       https://github.com/signup  (skip if you already have an account)

# 2.3 — Create a Personal Access Token (browser opens)
usethis::create_github_token(
  scopes      = c("repo", "user", "workflow"),
  description = "R on my laptop · TIDES course",
  expiration  = 90
)

# 2.4 — Paste the token into the credential store
gitcreds::gitcreds_set()

# 2.5 — Verify everything is green
usethis::git_sitrep()
```

If `git_sitrep()` shows red rows, re-run the step it points to.

## 3 · Course repository and data (once per course)

### 3.1 · Fork the course repo

Go to <https://github.com/chrglez/quantitative-methods-master-tides>.
Click **Fork** (top-right). Leave the defaults; keep
*"Copy the main branch only"* ticked.

### 3.2 · Clone your fork from RStudio

On *your fork's* page click **Code → HTTPS** and copy the URL. Then
in RStudio:

1. *File → New Project → Version Control → Git*.
2. Paste the URL into *Repository URL*.
3. Choose a stable parent folder — `~/Documents` or equivalent. **Not**
   Desktop, **not** OneDrive, **not** Dropbox.
4. Click *Create Project*.

The Git pane appears in the top-right of RStudio.

### 3.3 · Add the `upstream` remote (safety net)

> The main way to sync your fork is the **Sync fork** button on GitHub
> (web). This step adds an `upstream` reference locally as a backup —
> useful if you ever need to sync from RStudio instead of the browser.

Inside RStudio open *Tools → Terminal → New Terminal* and run:

```bash
git remote add upstream https://github.com/chrglez/quantitative-methods-master-tides.git
git remote -v
```

The second line should print **two** remotes: `origin` (your fork) and
`upstream` (the course repo). Close the terminal — in the daily flow
you sync from the GitHub web button.

For the alternative ways to sync a fork, see GitHub's docs:
<https://docs.github.com/es/pull-requests/collaborating-with-pull-requests/working-with-forks/syncing-a-fork>.

### 3.4 · Install R packages

Back in the R console:

```r
install.packages(c(
  "tidyverse", "here", "fs", "readxl", "haven",
  "janitor", "broom", "gt", "knitr", "rmarkdown",
  "eurostat"
))
```

> **If `install.packages("eurostat")` fails** (CRAN sometimes archives
> it when a transitive dependency drops), use the R-universe binary:
>
> ```r
> options(repos = c(
>   ropengov = "https://ropengov.r-universe.dev",
>   CRAN     = "https://cloud.r-project.org"
> ))
> install.packages("eurostat")
> ```

### 3.5 · Download the course data

```r
source("datasets/download.R")
list.files("datasets/raw")
```

You should see CSV files for ISTAC and Eurostat plus a `MANIFEST.md`.
This step needs internet; re-run it whenever you want fresh data.

---

## You're ready

Open `exercises/day1/exercise-template.R` and start. The daily loop
(branch → solve → commit → push → PR) is documented in
[`exercises/README.md`](exercises/README.md).

If anything fails, the first place to look is the output of
`usethis::git_sitrep()` — it tells you which of the steps above is the
weak link.
