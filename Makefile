.NOTPARALLEL:

report.html: report.Rmd code/03_render_report.R
	Rscript code/00_clean_data.R
	Rscript code/01_make_table1.R
	Rscript code/02_make_plots.R
	Rscript code/03_render_report.R

.PHONY: clean
clean:
	rm -f data/*.rds && rm -f *.html && rm -f figures/*.png && rm -f tables/*.png
	
.PHONY: install
install:
    Rscript -e "renv::restore(prompt = FALSE)"