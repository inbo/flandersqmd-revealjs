<!-- badges: start -->
![GitHub](https://img.shields.io/github/license/inbo/flandersqmd-revealjs)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/inbo/flandersqmd-revealjs/check-project)
![GitHub repo size](https://img.shields.io/github/repo-size/inbo/flandersqmd-revealjs)
<!-- badges: end -->

# `Reveal.js` quarto extension with the corporate identity of the Flemish government

[Onkelinx, Thierry![ORCID logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0001-8804-4216)[^aut][^cre][^inbo.be]
Research Institute for Nature and Forest (INBO)[^cph][^fnd]

[^cph]: copyright holder
[^fnd]: funder
[^aut]: author
[^cre]: contact person
[^inbo.be]: Research Institute for Nature and Forest (INBO)

**keywords**: quarto; reveal; corporate identity

<!-- community: inbo -->

<!-- description: start -->
This quarto extension builds on the quarto [`revealjs` format](https://quarto.org/docs/presentations/revealjs/) and provides the corporate identity of the Flemish government for slides.
A full example is available on the [GitHub repo](https://github.io/inbo/flandersqmd-revealjs/).
<!-- description: end -->

## Installation

**1.** Start by setting up a quarto project.
You can find more information on how to do this in the [quarto documentation](https://quarto.org/docs/tools/rstudio.html#projects).

**2.** Then open the terminal and go the root of your quarto project.
Run the command below to install the quarto extension and confirm when prompted.
Once installed, you can optionally view the documentation in your browser.

```
quarto install extension inbo/flandersqmd-revealjs
```

**3.** Replace the `project:` section in your `_quarto.yml` file with the following code:

```
project:
  type: default
  preview:
    port: 4201
    browser: true
  render:
    - "*.md"
    - "*.qmd"
    - "!LICENSE.md" #ignore LICENSE.md
    - "!README.md" #ignore README.md
  output-dir: output
```

**4.** Replace the `format:` section in your `_quarto.yml` file with the following code:

```
format:
  flandersqmd-revealjs: default
```

**5.** Then specify the `flandersqmd:` section in the `_quarto.yml` file.
[Below](#flandersqmd-settings) is the full list of settings that can be used.

## `flandersqmd` settings

### Required settings with default values

- `entity`: The entity that is publishing the report.
  Currently only `INBO` is supported.
  Defaults to `INBO` when omitted.
- `level`: The style guide level of the report.
  `1` refers to the global corporate identity of the Flemish government.
  `2` refers to the entity level corporate identity.
  Defaults to `1` when omitted.

### Required settings with no default

Missing settings are replaced by `!!! missing flandersqmd.settingname !!!` in the output.

- `title`: The title of the presentation.
- `author`: The author(s) of the presentation.
  This is a list of authors.
  Each author is a dictionary with the following keys:
  - `name`: The name of the author.
    This is a dictionary with the following keys:
    - `given`: The given name of the author.
    - `family`: The family name of the author.
  - `email`: The optional email address of the author.
    When set, the author name will be a `mailto` link.
  - `orcid`: The ORCID of the author.
    This if optional.
    Note that INBO requires you to provide an ORCID for all INBO personnel.
  - `affiliation`: The affiliation of the author.
    This is a list of strings.
    One item for each line.
    This is optional.
    Note that INBO requires you to provide at least `Research Institute for Nature and Forest (INBO)` as affiliation for all INBO personnel.
  - `cover`: The background image for the first slide.
    Path to a cover file.
    Should be a `png` or `jpg` file.

### Optional settings

- `subtitle`: The subtitle of the presentation.
- `data`: The date of the presentation.

## Render your quarto presentation

You can render your quarto presentation in two main ways:  

1. **Using RStudio's Build Pane**  
   - Open your quarto project in RStudio.
   - Click on the **Build** tab (usually found in the top-right panel).  
   - Click **Render Project** to generate the html presentation.
     If no `flandersqmd-revealjs` format is available, restart your quarto book project and try again.
   - The presentation is saved to disk.

2. **Using the Terminal**  
   - Open a terminal and navigate to the folder of your quarto presentation
   - Run the commands below in the terminal.
     This renders the presentation and saves it to disk like the **Render Project** button of the **Build** tab.
     Preview renders the presentation and starts a live preview, automatically updating the output when changes are detected.

```sh
# render the presentation
quarto render
# preview the presentation
quarto preview
```  

## Full example of the `_quarto.yml` file

```
project:
  type: default
  preview:
    port: 4201
    browser: true
  render:
    - "*.md"
    - "*.qmd"
    - "!LICENSE.md" #ignore LICENSE.md
    - "!README.md" #ignore README.md
  output-dir: output

execute:
  echo: false
  freeze: auto

lang: en-GB # nl-BE, fr-FR

bibliography: references.bib

format:
  flandersqmd-revealjs: default

flandersqmd:
  entity: INBO
  level: 2
  title: Title for the example presentation
  subtitle: The optional subtitle
  author:
    - name:
        given: Given
        family: Family
      email: given.family@vlaanderen.be
      corresponding: true
      orcid: 0000-0002-1825-0097
      affiliation:
        - Government of Flanders
    - name:
        given: Second
        family: Author
      email: second.author@vlaanderen.be
      corresponding: true
      orcid: 0000-0002-1825-0097
      affiliation:
        - Government of Flanders
    - name:
        given: Third
        family: Author
      email: third.author@vlaanderen.be
      orcid: 0000-0002-1825-0097
      affiliation:
        - Government of Flanders
  date: 2025-03-14
  cover: pexels-pixabay-355887.jpg #Photo by Pixabay: https://www.pexels.com/photo/plants-under-starry-sky-355887/
```
