library(leaflet)

df <- read.csv("./StationListsUSAFFiltered.csv", header=TRUE, sep=",")

df$Total_Years = df$Wind_speed._end_year - df$Wind_speed._start_year #figure out the length of observation period by taking start year from end year

saveRDS(df, "./df.rds")
