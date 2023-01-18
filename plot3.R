# Question (3)
# Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in emissions 
# from 1999–2008 for Baltimore City? Which have seen increases in emissions from 
# 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

png(file = "./plot3.png")
NEI %>% 
    filter(fips == "24510") %>% 
    group_by(type) %>% 
            ggplot(aes(year, Emissions, fill = type)) +
            geom_bar(stat = "identity") +
            scale_x_continuous(breaks = c(1999, 2002, 2005, 2008)) +
            facet_wrap(~ type) +
            theme_bw() +
            labs(title = "PM2.5 Emissions in Baltimore City by sources, 1999–2008", 
                 x = "Year",
                 y = "PM2.5 emissions (tons)")
dev.off()
# Answer: All the four sources decreased in emissions from 1999 to 2008.