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

dev.print(png, file = "coursera/ExData_Plotting1/plot2.png", width = 480, height = 480, units = "px")
png(file = "coursera/ExData_Plotting1/plot2.png", bg = "transparent")

ggplot(data, aes(x = Time, y = Global_active_power)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  geom_line(color = "black") +
  scale_x_continuous(breaks = c(0, 0.5, 1),
                     labels = c("Thu", "Fri", "Sat")) +
  xlab("") +
  ylab("Global Active Power (kilowatts)")

dev.off()