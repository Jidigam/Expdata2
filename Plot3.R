## Setting the Current Working Directory

setwd("C:\\Users\\ravitejaj\\Desktop\\Exploratory_Data\\")

#Loading the data

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

##3.Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

# Condition applied on baltimore city based on the year(Aggregate Function)
Emission_sources=with(NEI[NEI$fips == "24510",], aggregate(x=Emissions, by=list(year,type), FUN=sum))

# Copying a file to device driver

png(filename="plot3.png", width=480, height=480, units="px")

# 
library(ggplot2)
# Plotting  the Emission_sources

g = ggplot(Emission_sources, aes(Group.1,x))
#Adding Plot Attributes

g + geom_point() +geom_line(aes(color = Group.2)) +

  labs(x = "Year") + labs(y = "Emissions") +
  labs(title = "Baltimore City Emissions")

dev.off()