# Build every src/*.tex into build/.
#   make
#   make build/template.pdf
#   make watch
#   make watch WATCH=src/your-resume.tex
#   make clean

CLS := src/techresume.cls
# GUI apps often miss the TeX Live bin directory. Prefer PATH, then MacTeX.
LATEXMK := $(or $(shell command -v latexmk 2>/dev/null),/Library/TeX/texbin/latexmk)

TEX := $(wildcard src/*.tex)
PDFS := $(patsubst src/%.tex,build/%.pdf,$(TEX))
WATCH ?= src/template.tex

.PHONY: all watch clean

all: $(PDFS)

build/%.pdf: src/%.tex $(CLS) latexmkrc Makefile
	$(LATEXMK) $<

watch:
	$(LATEXMK) -pvc -view=none $(WATCH)

clean:
	$(LATEXMK) -C $(TEX)
	rm -rf build
