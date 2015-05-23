#! /bin/bash

pandoc -S --natbib --to=latex -o parts/narrative.tex markdown/narrative.md
# pandoc -S --natbib --to=latex -o parts/figures.tex markdown/figures.md
#xelatex esl
#bibtex esl
#xelatex esl
#xelatex esl-short
#bibtex esl-short
#xelatex esl-short
#xelatex blackwell-template
xelatex orca
bibtex orca
xelatex orca
