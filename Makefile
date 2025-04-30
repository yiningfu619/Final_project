.NOTPARALLEL:

report.html: report.Rmd code/03_render_report.R
	Rscript code/00_clean_data.R
	Rscript code/01_make_table1.R
	Rscript code/02_make_plots.R
	Rscript code/03_render_report.R

.PHONY: clean
clean:
	rm -f data/*.rds && rm -f *.html && rm -f figures/*.png && rm -f tables/*.rds && rm -f report/*.html
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"

# rule to build image
project_image:
	docker build -t yiningfu/project_image:latest .

# rule to build the report automatically in our container
report/report.html: 
	docker run -v "$$(pwd)/report":/home/rstudio/project/report yiningfu/project_image