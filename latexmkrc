# Shared by `make` and editor integrations that call latexmk from the repo root.
# Sources live in src/, including techresume.cls beside the .tex files.
$pdf_mode = 1; # pdflatex
$out_dir = 'build';
ensure_path('TEXINPUTS', './src');
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
