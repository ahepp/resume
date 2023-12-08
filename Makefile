all: resume
resume:
	pdflatex -interaction=batchmode main.tex
.PHONY: clean
clean:
	rm -f main.aux main.log main.pdf
