# Question (1) 
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

# 1. Download and unzip the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = "./data.zip", method = "curl")
unzip("./data.zip")
list.files()

# 2. Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 3. Plot
library(dplyr)

NEI_1 <- NEI %>% 
    group_by(year) %>%  
    summarise(total_emissions = sum(Emissions))

png(filename = "plot1.png")
with(NEI_1, barplot(total_emissions,
                    ylim = c(0,10000000),
                    names = year,
                    col = "red",
                    xlab = "Year",
                    ylab = "PM2.5 emissions (tons)"))
title(main = "Total PM2.5 Emissions in the United States, 1999-2008")
dev.off()

# Answer: Yes, the total emissions from PM2.5 decreased in the United States from 1999 to 2008.
