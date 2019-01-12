library(animint2)

MC_ag = function(
  FUN = function(x) x - x^2, n = 50, from = 0, to = 1,
  col.points = c('black', 'red'), pch.points = c(20, 4), ...
) {
  nmax = n
  x1 = runif(n, from, to)
  ymin = optimize(FUN, c(from, to), maximum = FALSE)$objective
  ymax = optimize(FUN, c(from, to), maximum = TRUE)$objective
  x2 = runif(n, ymin, ymax)
  y = FUN(x1)
  if (any(y < 0))
    stop('This Hit-or-Miss Monte Carlo algorithm only applies to\n',
         '_non-negative_ functions!')
  
  #creating dataframe
  res = as.integer(x2 > y) ++ 1
  #print(res)
  col <- col.points[res]
  #print(col)
  df <- data.frame(x_coor = x1, y_coor = x2, point = col, iteration = 1:nmax))
  # print(df)
  
  func_df <- data.frame(x_coor = x1, y_coor = y)
  x_end = 1
  y_end = FUN(x_end)
  
  #doing something for continuous plotting
  library(plyr)
  df <- ldply(df$iteration, function(i) {
    df_new <- subset(df, iteration <= i)
    cbind(df_new, iteration2 = i)
  })
  df2 <- subset(df, iteration == iteration2)
  #print(df)
  
  gg <- ggplot(df) + geom_point(data=df, aes(x = x_coor, y = y_coor, color = point), showSelected = df$iteration2) + 
    geom_curve(data=func_df, aes(x = x_coor, y = y_coor, xend = 1, yend = FUN(x_end)))
    

  viz <- list(plot = gg,
              time = list(variable = "iteration2", ms = 2000),
              title = "MC")
  #animint2dir(viz, out.dir = "MC")
  animint2gist(viz, out.dir = "MC")
}


MC_ag()
