# Setting the Current Working Directory

setwd("C:\\Users\\ravitejaj\\Desktop\\Exploratory_Data\\")

#Loading the data as given

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

##4.Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# Extracting Coal Emission using grep command

Emission_Coal = SCC[grep("[Cc]oal",SCC$SCC.Level.Three),]

# Condition check based on the year (Aggregate Function)
coal_emissions=with(NEI[NEI$SCC %in% Emission_Coal$SCC,], aggregate(x=Emissions, by=list(year), FUN=sum))

# Copying the file to Graphics driver
png(filename="plot4.png", width=480, height=480, units="px")

# Plotting of file
g1= ggplot(coal_emissions, aes(Group.1,x))

# Attributes of ggplot
g1 + geom_point() +geom_line() +
  labs(x = "Year") + labs(y = "Emissions") +
  labs(title = "Coal Combustion Emission")

dev.off()
