#data
#reading 100 from 100k.csv, with separator
#you should save 100k.csv without BOM before importing
records <- read.csv("data/100k.csv",sep ="|", header= TRUE, nrows=100)

#reading diapazons of payments (min,max)
diapazon <- read.csv("catalog/diapazon.csv",sep=",", header=TRUE)
