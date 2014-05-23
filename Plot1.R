## Setting the Current Working Directory

setwd("C:\\Users\\ravitejaj\\Desktop\\Exploratory_Data\\")

# Loading the data

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

##1.Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Condition using aggregate function 
total_emissions_US <- aggregate(Emissions~year, data=NEI, FUN=sum)

#Plotting the graph
plot1=plot(total_emissions_US,type="b",col="Green",xlab="years",ylab="Emission of Pm2.5 in tons",main="Emission Of US")

# Copying the Graph to Graphics Driver
dev.copy(png,file="plot1.png")

dev.off
