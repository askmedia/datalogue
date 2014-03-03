year  <- c(1924,1928,1932,1936,seq(1948,1992,by = 4),seq(1994,2010,by=4))
sport  <- c("biathlon" = 31666, "bobsleigh" = 31688, "cross country" = 31872, "figure skating" = 31759, "ice hockey" = 31910, "nordic combined" = 31911, "ski jumping" = 32498, "speed skating" = 31853, "curling" = 31704, "alpine skiing" = 58171, "freestyle skiing" = 31896, "luge" = 32503, "short track" = 31821, "skeleton" = 31698, "snowboard" = 32514)
length(sport)

llist  <- list()
dlist  <- list()
for (i in 1:length(sport)){
  llist[[i]]  <- list()
    for (k in 1:length(year)) {
      llist[[i]][[k]]  <- do.call(rbind, readHTMLTable(paste0("http://www.olympic.org/content/results-and-medalists/gamesandsportsummary/?sport=",sport[i],"&games=",year[k],"%2f2&event=")))
      #llist[[i]][[k]]$year  <- year[k]
      }
  names(llist[[i]])  <- year
  dlist[[i]] <- do.call(rbind, llist[[i]])
  }
llist
dlist
names(dlist)  <- sport
dd  <- do.call(rbind, dlist)
dd$V1  <- NULL
dd  <- subset(dd, V2 != "")
row.names(dd)

pat  <- "([[:digit:]]{5})\\.([[:digit:]]{4})\\.NULL\\.([[:digit:]])[[:digit:]]*"
dd$id  <- as.numeric(gsub(pattern = pat, replacement = "\\1", x = row.names(dd)))
dd$year  <- as.numeric(gsub(pattern = pat, replacement = "\\2", x = row.names(dd)))
dd$no  <- as.numeric(gsub(pattern = pat, replacement = "\\3", x = row.names(dd)))
table(dd$no)

dd$sport  <- ""
for (i in 1:length(sport)) {
  dd$sport[dd$id == sport[i]]  <- names(sport[i])
  }
table(dd$sport)

dd$medal  <- ""
dd$medal[dd$no == 2]  <- "gold"
dd$medal[dd$no == 3]  <- "silver"
dd$medal[dd$no %in% c(4,5)]  <- "bronze"
table(dd$medal, dd$no)

dd$country  <- as.character(dd$V3)
dd  <-  dd[(dd$sport == "curling" & dd$year == 1992) == FALSE,] 

country_list  <- unique(dd$country)
country_list

dd$pays  <- ""
for (k in 1:length(country_list)) {
  dd$pays[dd$country == country_list[k]]  <- ioc$country[ioc$code == country_list[k]]
}

str(dd)
dd$host  <- FALSE
dd$host[dd$year %in% c(1924,1992,1968) & dd$country == "FRA"]  <- TRUE
dd$host[dd$year %in% c(1928,1948) & dd$country == "SUI"]  <- TRUE
dd$host[dd$year %in% c(1932,1960, 1980, 2002) & dd$country == "USA"]  <- TRUE
dd$host[dd$year %in% c(1936) & dd$country == "GER"]  <- TRUE
dd$host[dd$year %in% c(1952, 1994) & dd$country == "NOR"]  <- TRUE
dd$host[dd$year %in% c(1956, 2006) & dd$country == "ITA"]  <- TRUE
dd$host[dd$year %in% c(1964, 1976) & dd$country == "AUT"]  <- TRUE
dd$host[dd$year %in% c(1972, 1998) & dd$country == "JPN"]  <- TRUE
dd$host[dd$year %in% c(1984) & dd$country == "YUG"]  <- TRUE
dd$host[dd$year %in% c(1988, 2010) & dd$country == "CAN"]  <- TRUE
table(dd$host)

dd$country[dd$country == "GDR"]  <- "GER"
dd$country[dd$country == "FRG"]  <- "GER"
dd$country[dd$country == "EUA"]  <- "GER"

save(llist, dlist, dd, file = "data/ioc.Rda")
