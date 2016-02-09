# server.R
# "left_plot", "right_plot"

source("helpers.R")
source("plotPitches.R")


# Plots the chosen balls and strikes
szPlot <- function(plot_c, plot_r, hr=F)
{
	data <- selectPitches(pitches, plot_c, plot_r, hr)

	plotPitches(data)
}
	
getConstraints <- function(input, right=F) {
	if ((right && 2 %in% input$which_sz) ||
		(!right && 1 %in% input$which_sz))
	{
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
}
getRConstraints <- function(input, right=F) {
	if ((right && 2 %in% input$which_sz) ||
		(!right && 1 %in% input$which_sz))
	{
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
}


shinyServer(function(input, output) {
	plot1_c <- reactive({getConstraints(input)})
	plot1_r <- reactive({getRConstraints(input)})
	plot2_c <- reactive({getConstraints(input, T)})
	plot2_r <- reactive({getRConstraints(input, T)})

	output$left_plot <- renderPlot(szPlot(plot1_c(), plot1_r()))
	output$right_plot <- renderPlot(szPlot(plot2_c(), plot2_r()))
})

