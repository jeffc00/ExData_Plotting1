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

dev.print(png, file = "coursera/ExData_Plotting1/plot4.png", width = 480, height = 480, units = "px")
png(file = "coursera/ExData_Plotting1/plot4.png", bg = "transparent")

p1 <- ggplot(data, aes(x = Time, y = Global_active_power)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  geom_line(color = "black") +
  scale_x_continuous(breaks = c(0, 0.5, 1),
                     labels = c("Thu", "Fri", "Sat")) +
  xlab("") +
  ylab("Voltage")

p2 <- ggplot(data, aes(x = Time, y = Voltage)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  geom_line(color = "black") +
  scale_x_continuous(breaks = c(0, 0.5, 1),
                     labels = c("Thu", "Fri", "Sat")) +
  xlab("") +
  ylab("Global Active Power (kilowatts)")

p3 <- ggplot(data, aes(x = Time)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(color = "black"),
        legend.position = c(0.80, 0.80)) +
  geom_line(aes(y = Sub_metering_1, color = "Sub_metering_1")) +
  geom_line(aes(y = Sub_metering_2, color = "Sub_metering_2")) +
  geom_line(aes(y = Sub_metering_3, color = "Sub_metering_3")) +
  scale_x_continuous(breaks = c(0, 0.5, 1),
                     labels = c("Thu", "Fri", "Sat")) +
  scale_colour_manual(values = c("black", "red", "blue")) +
  labs(x = "", y = "Energy sub metering", colour = "")

p4 <- ggplot(data, aes(x = Time, y = Global_reactive_power)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  geom_line(color = "black") +
  scale_x_continuous(breaks = c(0, 0.5, 1),
                     labels = c("Thu", "Fri", "Sat")) +
  xlab("") +
  ylab("Global Active Power (kilowatts)")

figure <- ggarrange(p1, p2, p3, p4,
                    ncol = 2, nrow = 2)

dev.off()