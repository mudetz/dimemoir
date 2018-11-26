.PHONY: all
all: memoir.pdf

%.pdf: %.tex **/*.*
	latexmk -pdf $<

.PHONY: clean
clean:
	find . -not -path './.git/*' -iname '*-eps-converted-to.pdf' -type f -delete
	find . -not -path './.git/*' -iname '*.aux' -type f -delete
	find . -not -path './.git/*' -iname '*.bbl' -type f -delete
	find . -not -path './.git/*' -iname '*.bcf' -type f -delete
	find . -not -path './.git/*' -iname '*.blg' -type f -delete
	find . -not -path './.git/*' -iname '*.dvi' -type f -delete
	find . -not -path './.git/*' -iname '*.fdb_latexmk' -type f -delete
	find . -not -path './.git/*' -iname '*.fls' -type f -delete
	find . -not -path './.git/*' -iname '*.glg' -type f -delete
	find . -not -path './.git/*' -iname '*.glo' -type f -delete
	find . -not -path './.git/*' -iname '*.gls' -type f -delete
	find . -not -path './.git/*' -iname '*.idx' -type f -delete
	find . -not -path './.git/*' -iname '*.ilg' -type f -delete
	find . -not -path './.git/*' -iname '*.ind' -type f -delete
	find . -not -path './.git/*' -iname '*.ist' -type f -delete
	find . -not -path './.git/*' -iname '*.lof' -type f -delete
	find . -not -path './.git/*' -iname '*.log' -type f -delete
	find . -not -path './.git/*' -iname '*.lot' -type f -delete
	find . -not -path './.git/*' -iname '*.nav' -type f -delete
	find . -not -path './.git/*' -iname '*.out' -type f -delete
	find . -not -path './.git/*' -iname '*.ps' -type f -delete
	find . -not -path './.git/*' -iname '*.pyg' -type f -delete
	find . -not -path './.git/*' -iname '*.snm' -type f -delete
	find . -not -path './.git/*' -iname '*.toc' -type f -delete
	find . -not -path './.git/*' -iname '*.vrb' -type f -delete
	find . -not -path './.git/*' -iname '_minted*' -type d -exec rm -r "{}" +

.PHONY: distclean
distclean: pdfclean

.PHONY: pdfclean
pdfclean:
	find . -not -path './.git/*' -iname '*.pdf' -type f -delete
