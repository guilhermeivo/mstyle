#!/bin/bash
set -e

TEXTMF=${1:-"~/texlive/texmf-local"}
FILES=( "mstyle-core.sty" "mstyle.sty" "mstyle-slides.sty" )

for file in "${FILES[@]}"; do
    cp $file $TEXTMF/tex/latex/local/
done
texhash

cd examples
pdflatex article/main
BIBINPUTS=.:article: bibtex main
pdflatex article/main
pdflatex article/main

pdflatex slides/slide.tex
BIBINPUTS=.:slides: bibtex slide
pdflatex slides/slide.tex
pdflatex slides/slide.tex


#rm $TEXTMF/tex/latex/local/$FILE