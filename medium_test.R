library(animation)

price.ani_ag = function(
  price, time, time.begin = min(time), span = 15 * 60, ..., xlab = 'price',
  ylab = 'frequency', xlim, ylim, main
) {
  time1 = time.begin
  miss.main = missing(main)
  tab.max = 0
  
  # #{snipet1:}
  # while (time1 < max(time)) {
  #   time2 = time1 + span
  #   sub.price = price[time >= time1 & time <= time2]
  #   if (length(sub.price) > 0) {
  #     tab.max = max(tab.max, max(table(sub.price)))
  #   }
  #   time1 = time2
  # }

  tab.max = max(table(price)) #my addtion : can ignore loop and use this line, change axis lim of y axis
  if (missing(xlim))
    xlim = range(price)
  if (missing(ylim))
    ylim = c(0, tab.max)
  
  
  #{snipet2:}
  df <- data.frame()
  df_time <- data.frame()
  time1 = time.begin
  time2=time1 + span
  while (time1<max(time)) {
    sub.price<-price[time>=time1 & time<=time2]
    if (length(sub.price)>0) {
      tab.price <- t(table(sub.price))
      print(tab.price)
      df<-rbind(df, tab.price, ptn = time1)
      print(df)
      if(miss.main){
        df_time<-rbind(df, paste(time1, time2, sep = '-'), ptn = time1)
      }
    } #removed else if part 
    time1 = time2
  }  
  
  #plotting in animint
  
  
  # while (time1 < max(time)) {
  #   dev.hold()
  #   time2 = time1 + span
  #   sub.price = price[time >= time1 & time <= time2]
  #   if (length(sub.price) > 0) {
  #     tab.price = table(sub.price)
  #     if (miss.main)
  #       main = paste(time1, time2, sep = ' - ')
  #     plot(as.numeric(names(tab.price)), as.numeric(tab.price), type = 'h',
  #          ..., xlab = xlab, ylab = ylab, xlim = xlim, ylim = ylim,
  #          main = main, panel.first = grid())
  #   } else if (interactive()) {
  #     message('no prices between ', time1, ' and ', time2)
  #     flush.console()
  #   }
  #   time1 = time2
  #   ani.pause()
  # }
}

#vanke1127
data_set <- vanke1127[1:1000,]
price.ani_ag(data_set$price, data_set$time, lwd=2)
