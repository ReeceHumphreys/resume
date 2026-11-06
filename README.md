# resume

Personal resume template for pdfLaTeX. Layout is in `src/techresume.cls`.

## Use it

1. Copy `src/template.tex` to `src/your-name.tex` and replace the placeholders. Keep the file in `src/` so it can find the class.
2. From this directory, run `make`. PDFs are written to `build/`.

`make watch` rebuilds `src/template.tex` on save. For another file:

```sh
make watch WATCH=src/your-name.tex
```

## CI

`src/reece-humphreys-resume.tex` is my filled-in resume using the same class. A push or pull request builds that file and uploads the PDF as an Actions artifact named `resume`.

## LICENSE

The class, the blank template, and the build files are [MIT](LICENSE).
