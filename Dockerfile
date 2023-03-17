# Pulling Rocker image with RStudio and R version 4.2
FROM rocker/verse:4.2

# copy rstudio preferences
COPY /rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json
RUN sudo chown -R rstudio /home/rstudio/.config/rstudio/rstudio-prefs.json

# Install sys deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    vim \
    && rm -rf /var/lib/apt/lists/*  

# installing R packages
RUN R -q -e 'install.packages("glue")'

EXPOSE 8787
