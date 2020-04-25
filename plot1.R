library(tidyverse)
library(chron)

data <- read.table("coursera/ExData_Plotting1/household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- times(data$Time)
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

dev.print(png, file = "coursera/ExData_Plotting1/plot1.png", width = 480, height = 480, units = "px")
png(file = "coursera/ExData_Plotting1/plot1.png", bg = "transparent")

ggplot(data, aes(x = Global_active_power)) +
  theme_bw() +
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  geom_histogram(bins = 12, fill = "red", color = "black", boundary = 0) +
  ggtitle("Global Active Power") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Global Active Power (kilowatts)") +
  ylab("Frequency") +
  xlim(0, 6)

dev.off()