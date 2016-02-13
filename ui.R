# ui.R

source("helpers.R")
COL_WIDTH=6

shinyUI(fluidPage(

	titlePanel(h1("Strikezone Map")),

	sidebarLayout(
		sidebarPanel(
# 			radioButtons('view', label="Viewpoint", ##
# 				choices=c("Catcher/Umpire", "Pitcher"), inline = T),
			checkboxGroupInput('ballsstrikes', label=NULL,
				choices=c('Balls', 'Strikes'),
				selected=c('Balls','Strikes'), inline=TRUE),

			selectInput('batter', label="Batter",
				choices=append(c("All"), batterkey)),

			radioButtons('stance', label="Stance",
				choices=c("All"="All", "Left-Handed"="L", "Right-Handed"="R"),
				inline = T),

			sliderInput('b_height',
				label="Batter Height",
				min=minis["b_height"], max=maxes["b_height"],
				value=c(minis["b_height"], maxes["b_height"]), step=1.0),

			selectInput('pitcher', label="Pitcher",
				choices=append(c("All"), pitcherkey)),

			radioButtons('throws', label="Pitcher Arm",
				choices=c("All"="All", "Left-Handed"="L", "Right-Handed"="R"),
				inline = T),

			selectInput('umpire', label="Umpire",
				choices=append(c("All"), sort(levels(pitches$umpire)))),

			selectInput('stadium', label="Stadium",
				choices=append(c("All"), sort(levels(pitches$stadium)))),

			sliderInput('inning', label="Inning(s)",
				min=minis["inning"], max=maxes["inning"],
				value=c(minis["inning"], 9), step=1),

			sliderInput('month', label="Month(s)",
				min=minis["month"], max=maxes["month"],
				value=c(minis["month"], maxes["month"]), step=1),

			width=3
		),
		mainPanel(
			fluidRow(
				column(COL_WIDTH,
					plotOutput("plot")
				)
			)
		)
)))
