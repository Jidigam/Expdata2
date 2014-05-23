# Setting the Path

setwd("C:\\Users\\ravitejaj\\Desktop\\Exploratory_Data\\")

#Loading the Data

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

#Converting the thing to a datatable

NEI.DT = data.table(NEI)


##6.Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

#Removing the motor vehicle data from the SCC using grep command

MotorVehicle_Data = SCC[grep("[Mm]obile|[Vv]ehicles",SCC$EI.Sector),]

# Converting it at storing for the match
c<-MotorVehicle_Data$SCC

#Calculating the Motor Vehicle emission based on year and fips

motor.vehicle.emissions = NEI.DT[SCC %in% c, sum(Emissions), by=c("year", "fips")]

# Emission in the baltimore county (From Problem 5)

Emissions_motors_Baltimore=with(NEI[(NEI$fips == "24510" & NEI$SCC %in% MotorVehicle_Data$SCC),], aggregate(x=Emissions, by=list(year), FUN=sum))

# Emission in the LoS Angeles county 
Emissions_motors_LosAngeles=with(NEI[(NEI$fips == "06037" & NEI$SCC %in% MotorVehicle_Data$SCC),], aggregate(x=Emissions, by=list(year), FUN=sum))

# Copying the Plot to a Graphic Device

png(filename="plot6.png", width=480, height=480, units="px")

library(ggplot2)
# Comparing the Plots using GGplot

g = ggplot(motor.vehicle.emissions[fips == "24510" | fips == "06037"], aes(year, log(V1)))

# Attributes of GGplot
g + geom_point() +
  geom_line(aes(color = fips)) +
  scale_color_discrete(name = "County", breaks = c("06037", "24510"), labels = c("Los Angeles", "Baltimore")) +
  labs(x = "Year") + labs(y = "Emissions in Log Scale") +
  labs(title = "Los Angeles Versus Baltimore")

dev.off()

