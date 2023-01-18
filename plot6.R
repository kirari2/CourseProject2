# Question (6)
# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == "06037"),
# Which city has seen greater changes over time in motor vehicle emissions?

png(file = "./plot6.png", width = 8, height = 5)
NEI %>% 
    filter(type == "ON-ROAD" & (fips == "24510" | fips == "06037")) %>%
    mutate(fips = recode(fips, "24510" = "Baltimore City", "06037" = "Los Angeles")) %>% 
        ggplot(aes(year, Emissions, fill = fips)) +
            geom_bar(stat = "identity") +
            scale_x_continuous(breaks = c(1999, 2002, 2005, 2008)) +
            facet_wrap(vars(fips)) +
            theme_bw() +
            theme(legend.position = "none") +
            labs(title = "PM2.5 Emissions from Motor Vehicle Sources in Baltimore City and Los Angeles, 1999–2008", 
                 x = "Year",
                 y = "PM2.5 emissions (tons)")
dev.off()

# Answer: Los Angeles