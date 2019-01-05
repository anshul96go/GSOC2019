#Easy Exercise

#reading data
df <- read.csv("futures data.csv")
#head(df)
df$Trade.Date <- as.Date(df$Trade.Date, format="%d/%m/%y")
#class(df$Trade.Date)
#df$Trade.Date

#standard ggplot2
library(ggplot2)
library(reshape2)
# gg<-ggplot(df) + geom_point(aes(x=df$Trade.Date, y=df$USD.AF8.FUT, color=df$USD.AF8.FUT)) + 
#   geom_smooth(method = "gam", aes(x=df$Trade.Date, y=df$USD.AF8.FUT))
# 
# gg_line<-ggplot(df) + geom_point(aes(x=df$Trade.Date, y=df$USD.AF8.FUT, color=df$USD.AF8.FUT)) + 
#   geom_line(aes(x=df$Trade.Date, y=df$USD.AF8.FUT))
# print(gg_line)

df_new <- melt(df[, c("Trade.Date", "USD.AF8.FUT", "JPY.AF8.FUT", "GBP.AF8.FUT", "EUR.AF8.FUT")], id="Trade.Date")
gg_mult <- ggplot(df_new) + geom_line(aes(x=df_new$Trade.Date, y=value, color=variable)) + 
  labs(title="Futures FX Data", subtitle="2010-2018", x="Dates", y="Future Exchange Rate(INR)", caption="Source: MSEI") + 
  theme(plot.background = element_rect(fill = "lightsteelblue2", colour = "red"), 
        plot.title = element_text(size = 20, face="bold", hjust = 0.5), 
        plot.subtitle = element_text(size = 10, hjust = 0.5), 
        plot.caption = element_text(size = 10), 
        axis.text.x = element_text(size = 10, angle=30, hjust = 0.5), 
        axis.text.y = element_text(size=10, angle = 30), 
        panel.background = element_rect(fill = "pink"),
        panel.grid.minor = element_line(color = "white", linetype = "dashed")) + 
  scale_color_discrete(name="Currency Pair", labels = c("USD/INR", "JPY/INR", "GBP/INR", "EUR/INR"))
print(gg_mult)
      
#animint2
library(devtools)
devtools::install_github("tdhock/animint2")
library(animint2)
iden <- c("df$USD.AF8.FUT", "df$JPY.AF8.FUT", "df$GBP.AF8.FUT", "df$EUR.AF8.FUT")
bp<-c("2011-01-01", "2012-01-01", "2013-01-01", "2014-01-01", "2015-01-01", "2016-01-01", 
           "2017-01-01", "2018-01-01")
bpoints = as.Date(bp, format="%Y-%m-%d")
class(bpoints)
df_new$year <- as.numeric(format(df$Trade.Date,'%Y'))
head(df_new$year)
df_new$bucket <- cut(df_new$year, breaks = c(2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018))
head(df_new)
gg_anm2_sel <- ggplot(df_new) + geom_line(aes(x=df_new$Trade.Date, y=value, color=variable , linetype=df_new$bucket,  clickSelects=df_new$bucket))
#gg_anm2_out <- ggplot(df_new) + geom_point(aes(x=df_new$Trade.Date, y=value, color=variable, showSelected=df_new$bucket)) 
plots <- list(plot1 = gg_anm2_sel)
#structure(plots, class = "animint")
animint2dir(plots, out.dir = "simple", open.browser = TRUE)
servr::httd("simple") 
