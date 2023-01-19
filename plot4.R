# Question (4)
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(dplyr)
library(ggplot2)

# 1. Tidy data
coal_c <- grepl("Fuel Comb.*Coal", SCC[, "EI.Sector"], ignore.case = TRUE)
coal_c_SCC <- SCC[coal_c, "SCC"]
NEI_4 <- NEI[NEI[, "SCC"] %in% coal_c_SCC, ]

# 2. Plot
png(file = "./plot4.png")
NEI_4 %>% 
    group_by(year) %>% 
    ggplot(aes(year, Emissions)) +
    geom_bar(stat = "identity") +
    scale_x_continuous(breaks = c(1999, 2002, 2005, 2008)) +
    theme_bw() +
    labs(title = "PM2.5 emissions from coal combustion-related sources in the United States, 1999–2008", 
         x = "Year",
         y = "PM2.5 emissions (tons)")
dev.off()