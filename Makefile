all: resume preview
resume:
	pdflatex -interaction=batchmode main.tex
preview: resume
	convert -density 300 main.pdf -alpha remove -quality 90 main.png
.PHONY: clean
clean:
	rm -f main.aux main.log main.pdf main.png
