# Question (5)
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(dplyr)
library(ggplot2)

# 1. Tidy data
veh <- grepl("Mobile.*Vehicles", SCC$EI.Sector, ignore.case = TRUE)
veh_SCC <- SCC[veh, "SCC"]
NEI_5 <- NEI[NEI[, "SCC"] %in% veh_SCC, ]

# 2. Plot
png(file = "./plot5.png")
NEI_5 %>% 
    filter(fips == "24510") %>% 
    ggplot(aes(year, Emissions)) +
        geom_bar(stat = "identity") +
        scale_x_continuous(breaks = c(1999, 2002, 2005, 2008)) +
        theme_bw() +
        labs(title = "PM2.5 emissions from motor vehicle sources changed in Baltimore City, 1999-2008", 
             x = "Year",
             y = "PM2.5 emissions (tons)")
dev.off()