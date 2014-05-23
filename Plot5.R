# Setting the Current Working Directory

setwd("C:\\Users\\ravitejaj\\Desktop\\Exploratory_Data\\")

# Loading the data as given

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")


##5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

# Extracting the Motor Vehicle data using grep command

MotorVehicle_Data = SCC[grep("[Mm]obile|[Vv]ehicles",SCC$EI.Sector),]

#Condition to check for Baltimore county and SCC present in particluar Year

Emissions_motors_Baltimore=with(NEI[(NEI$fips == "24510" & NEI$SCC %in% MotorVehicle_Data$SCC),], aggregate(x=Emissions, by=list(year), FUN=sum))

#Copying of file to a Graphics driver

png(filename="plot5.png", width=480, height=480, units="px")

#
library(ggplot2)
#Plotting the graph

g2= ggplot(Emissions_motors_Baltimore, aes(Group.1,x))

#Attributes Usage

g2 + geom_point() +geom_line() +
  labs(x = "Year") + labs(y = "Emissions") +
  labs(title = "Emission For motor vehicle sources in Baltimore City")
dev.off()