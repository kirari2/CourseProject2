# Question (2)
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
# plot answering this question.

NEI_2 <- NEI %>% 
    filter(fips == "24510") %>% 
    group_by(year) %>% 
    summarise(total_emissions = sum(Emissions))

png(file = "./plot2.png")
with(NEI_2, barplot(total_emissions,
                    names = year,
                    ylim = c(0, 3500),
                    col = "blue",
                    xlab = "Year",
                    ylab = "PM2.5 emissions (tons)"))
title(main = "Total PM2.5 Emissions in Baltimore City, Maryland, 1999-2008")
dev.off()

# Answer: Yes, the total emissions from PM2.5 decreased in the Baltimore City, Maryland, from 1999 to 2008.
