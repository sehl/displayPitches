# server.R

source("helpers.R")
source("plotPitches.R")


# Plots the chosen balls and strikes
szPlot <- function(plot_c, plot_r, bs, hr=F)
{
	data <- selectPitches(pitches, plot_c, plot_r, hr)

	plotPitches(data, bs)
}
	
getConstraints <- function(input) {
	constraints <- c()
	for (name in options)
	{
		val <- input[[name]]
		if (val == "All") next
		limiter <- val
		names(limiter) <- c(name)
		constraints <- append(constraints, limiter)
	}
	return(constraints)
}

# ranged constraints
getRConstraints <- function(input) {
	r_constraints <- c()
	for (name in c("b_height", "month", "inning"))
	{
		val <- input[[name]]
		op <- c(NA,NA)
		if (val[1] != minis[name])
			op[1] <- val[1]
		if (val[2] != maxes[name])
			op[2] <- val[2]
		names(op) <- c(paste(name, '.min', sep=''), paste(name, '.max', sep=''))
		r_constraints <- append(r_constraints, op)
	}
	return(r_constraints)
}


shinyServer(function(input, output) {
	plot_c <- reactive({getConstraints(input)})
	plot_r <- reactive({getRConstraints(input)})

	output$plot <- renderPlot(szPlot(plot_c(), plot_r(),
	input$ballsstrikes))
})

