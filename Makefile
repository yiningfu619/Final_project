report.html: report.Rmd \
  code/03_render_report.R \
	Rscript code/03_render_report.R

# create data/data_clean
.data_clean: data/data_clean.rds

.data/data_clean.rds: code/00_clean_data.R
  Rscript code/00_clean_data.R

# creates tables/
.tables/*.png: tables/table_one.png

.tables/table_one.png: code/01_make_table1.R
  Rscript code/01_make_table1.R

# creates figures/
.figures/*.png: figures/figure_one.png figures/figure_two.png

.figures: code/02_make_plots.R
  Rscript code/02_make_plots.R

.PHONY: clean
clean:
	rm -f data/*.rds && rm -f *.html && rm -f figures/*.png && \ 
	rm -f tables/* .png
	
.PHONY: install
install:
    Rscript -e "renv::restore(prompt = FALSE)"