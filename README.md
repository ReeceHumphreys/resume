# techresume

A one-page resume for pdfLaTeX. Layout is `src/techresume.cls`. Your text goes in a `.tex` file in the same folder.

## Use it

1. Install [TeX Live](https://www.tug.org/texlive/) or [MacTeX](https://tug.org/mactex/). You need `pdflatex` and `latexmk`.
2. Copy `src/template.tex` to `src/your-name.tex` and replace the placeholders. Keep the file in `src/` so it can find the class.
3. From this directory, run `make`. PDFs are written to `build/`.

`make watch` rebuilds `src/template.tex` on save. For another file:

```sh
make watch WATCH=src/your-name.tex
```

`src/reece-humphreys-resume.tex` is a filled-in example of the same class. A push or pull request builds that file and uploads the PDF as an Actions artifact named `resume`.

The font is TeX Gyre Termes, a Times clone included with TeX. On the `\documentclass` line, `a4paper` switches from US Letter to A4.

The class, the blank template, and the build files are [MIT](LICENSE).
