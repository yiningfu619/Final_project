FROM --platform=linux/amd64 rocker/tidyverse:latest as base

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir code
RUN mkdir data
RUN mkdir figures
RUN mkdir tables

#be careful to copy only the essential renv files and not the renv library
RUN mkdir renv
COPY .Rprofile .
COPY renv.lock .

COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt=FALSE)"

#copy all relevant files 
COPY code code
COPY data data
COPY Makefile .
COPY report.Rmd .

RUN mkdir report 

CMD make && mv report.html report 