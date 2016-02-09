# plotPitches.R

source("helpers.R")

selectPitches <- function(data,
	constraints=c("batter"=NA, "stance"=NA, 
	"pitcher"=NA, "throws"=NA, "umpire"=NA, "stadium"=NA
	),
	r_constraints=c("height"=c("min"=NA,"max"=NA),
	"month"=c("min"=NA,"max"=NA),
	"inning"=c("min"=NA, "max"=NA)),
	hr=F # TODO: implement
	)
{
	select_lines <- !logical(length=nrow(data))

	for (name in names(constraints))
	{
		if (is.null(constraints[[name]]) | is.na(constraints[[name]])) next
		select_lines <- select_lines & c(data[name] == constraints[name])
	}
	for (name in names(r_constraints))
	{
		if (is.na(r_constraints[name])) next
		new_lines <- switch(substr(name, nchar(name)-2,nchar(name)),
			'min'=c(data[substr(name,1,nchar(name)-4)] >= r_constraints[name]),
			'max'=c(data[substr(name,1,nchar(name)-4)] <= r_constraints[name]),
			)
		select_lines <- select_lines & new_lines
	}

	data[select_lines,]

}

plotPitches <- function(data, title="Strikezone Plots")
{
	balls <- data[c(data$result == 'B'),]
	strikes <- data[c(data$result == 'S'),]

	plot(balls$x, balls$z, lwd=2, cex=4,
		main=title, axes=F,
		col=rgb(191, 2, 24, maxColorValue=255),
		xlim=c(plot_min_x, plot_max_x),
		ylim=c(plot_min_z, plot_max_z),
		asp=1
		)
	
	points(balls$x, balls$z, pch=19, cex=3,
		col=rgb(191, 2, 24, alpha=100, maxColorValue=255))
	points(strikes$x, strikes$z, lwd=2, cex=4,
		col=rgb(30, 191, 2, maxColorValue=255))
	points(strikes$x, strikes$z, pch=19, cex=3,
		col=rgb(30, 191, 2, alpha=100, maxColorValue=255))
	
	sz_top <- mean(data$sz_top)
	sz_bot <- mean(data$sz_bot)
	
	half <- 8.5/12 # homeplate = 17" across /2 / 12" per ft
	x <- c(-half, half, half, -half)
	z <- c(sz_top, sz_top, sz_bot, sz_bot)
	polygon(x, z, lty=2)
}


