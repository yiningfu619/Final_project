# Obesity Levels Analysis

> Carina Fu

------------------------------------------------------------------------

# Code Description

`code/00_clean_data.R`
- read in data set, label and create some new variables
- save data as a `.rds` object in `data/` folder

`code/01_make_table1.R`
- make summary table
- saves tables as a `.png` object in `tables/` folder

`code/02_make_plots.R`
- make bar plot and scatter plot
- saves the two plots as `.png` objects in `figures/` folder

`code/03_render_report.R`
- renders `report.Rmd`

`report.Rmd`
- loads data sets saved by the `.R` scripts
- makes table and plots of each

`Makefile`
- contains rules for building the report
- contains rules for cleaning the report
- contains rules for installing packages

------------------------------------------------------------------------

# Generate the final report

To generate the final report, use: 

```bash
make report.html  
```
------------------------------------------------------------------------

## How to synchronize the environment

To synchronize the project environment, use:
```bash
make install
```
This command has been tested on a Mac computer, so it should work and the environment
will be built very quickly.

However, if you receive any errors that corresponds to the package "Matrix",
please try the following command:
```bash
brew install gcc
which gfortran
```

The second command will return the correct path to your Fortran compiler. Please 
copy it and use it to replace /opt/homebrew/bin/gfortran in the configuration.
```bash
mkdir -p ~/.R

cat <<EOF > ~/.R/Makevars
FC = /opt/homebrew/bin/gfortran
F77 = /opt/homebrew/bin/gfortran
FLIBS = -L/opt/homebrew/opt/gcc/lib/gcc/\$(/opt/homebrew/bin/gfortran -dumpversion | cut -d. -f1) -lgfortran -lquadmath -lm
EOF
```

Then, try to rerun make install.

If failed, please follow the instructions here again.
```bash
/opt/homebrew/bin/gfortran -dumpversion
```
This command will give you a version of your gfortran. Usually it's 13 or 14.
Please 
copy it and use it to replace 14 in the configuration.
```bash
cat <<EOF > ~/.R/Makevars
FC = /opt/homebrew/bin/gfortran
F77 = /opt/homebrew/bin/gfortran
FLIBS = -L/opt/homebrew/opt/gcc/lib/gcc/14 -lgfortran -lquadmath -lm
EOF
```

If it's still not working, which might happen sometimes, please directly run the 
following command in your console and terminal.
I strongly recommend you run as administrator at this point.
```console
renv::restore()
```
```bash
make report.html
```
------------------------------------------------------------------------

# Generate the Dockerfile

The link of image from Docker hub:
https://hub.docker.com/repository/docker/yiningfu/project_image/general

```bash
docker pull yiningfu/project_image:latest
```
or

docker build:

```bash
make project_image
```

docker run:

```bash
make report/report.html
```
