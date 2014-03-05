# Sources : http://public.opendatasoft.com/explore/dataset/correspondance-code-insee-code-postal/#?tab=export&start=20
dfm  <- read.csv2("data/correspondance-code-insee-code-postal.csv", stringsAsFactors = FALSE)
names(dfm)
str(dfm)
dfm$geo_shape  <- NULL
dfm$geo_point_2d
str(dfm)
coord  <- data.frame(t(as.data.frame(str_split(dfm$geo_point_2d, ","))))
str(coord)
names(coord)  <- c("lat", "lon")
coord$lat  <- as.numeric(as.character(coord$lat))
coord$lon  <- as.numeric(as.character(coord$lon))
dfm  <- cbind(dfm, coord)
str(dfm)
#dfm  <- subset(dfm, nom_region %in% c("GUYANE", "GUADELOUPE", "REUNION", "MARTINIQUE", "MAYOTTE") == FALSE) 
str(dfm)
dfm$insee_com[dfm$insee_com == "75101"]  <- "75056"
dfm$insee_com[dfm$insee_com == "69381"]  <- "69123"
dfm$insee_com[dfm$insee_com == "13201"]  <- "13055"
save(dfm, file = "data/dfm.Rda")
write.table(dfm, "data/dfm.csv", sep = ",", row.names = FALSE)

