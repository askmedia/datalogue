tx  <- readLines("http://www.olympic.org/content/results-and-medalists/searchresultpercountry/?athletename=&country=afg&sport2=&games2=&event2=&mengender=true&womengender=true&mixedgender=true&goldmedal=true&silvermedal=true&bronzemedal=true&worldrecord=true&olympicrecord=false&teamclassification=true&individualclassification=true&winter=true&summer=true")
ioc  <- data.frame(string = tx[1829:2056])
ioc$code  <- gsub(pattern = ".*value=\"([[:upper:][:digit:]]+)\".*", replacement = "\\1", x = ioc$string)
ioc$country  <- gsub(pattern = ".*>(.*)<.*", replacement = "\\1", x = ioc$string)
ioc$string  <- NULL
write.table(ioc, file = "code_ioc.csv", sep = ",", row.names = FALSE)
