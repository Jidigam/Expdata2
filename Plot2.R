# # Setting the Current Working Directory
setwd("C:\\Users\\ravitejaj\\Desktop\\Exploratory_Data\\")

# Loading the Data

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

##2.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Condition for Baltimore City
total_emissions_baltimore=with(NEI[NEI$fips == "24510",], aggregate(x=Emissions, by=list(year), FUN=sum)) 

#Plotting a Graph

plot2=plot(total_emissions_baltimore,type="b",col="Green",xlab="years",pch = 19,ylab="Emission of Pm2.5 in tons",main="County Baltimore Emission")

dev.copy(png,file="plot2.png")
dev.off
