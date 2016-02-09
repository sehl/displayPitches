# ui.R

shinyUI(fluidPage(

	titlePanel(h1("Strikezone Maps")),

	sidebarLayout(
		sidebarPanel(
			checkboxGroupInput(
				'which_sz', label="Choose one or more Strike Zone Plots",
				choices=c('Strikezone 1'=1, 'Strikezone 2'=2),
				selected=c(1,2),
				inline=T),

			radioButtons('view', label="Viewpoint", ##
				choices=c("Catcher/Umpire", "Pitcher"), inline = T),

			selectInput('batter', label="Batter",
				choices=append(c("All"), sort(levels(pitches$batter)))),

			radioButtons('stance', label="Stance",
				choices=c("All"="All", "Left-Handed"="L", "Right-Handed"="R"),
				inline = T),

			sliderInput('b_height',
				label="Batter Height",
				min=minis["b_height"], max=maxes["b_height"],
				value=c(minis["b_height"], maxes["b_height"]), step=1.0),

			selectInput('pitcher', label="Pitcher",
				choices=append(c("All"), sort(levels(pitches$pitcher)))),

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
					h3("Strike Zone 1"),
					plotOutput("left_plot")
				),
				column(COL_WIDTH,
					h3("Strike Zone 2"),
					plotOutput("right_plot")
				)
			)
		)
)))
			
# shinyUI
# (
# 	fillPage
# 	(
# 		title=h1("Strikezone Maps"),
# 		fillCol(
# 			h3("Information"),
# 			width="20%"
# 		),
# 		fillCol(
# 			fillRow(
# 				plotOutput("left_plot"),
# 				height="75%"
# 			),
# 			fillRow(
# 				szCtrlPanel(right=F),
# 				height="25%"
# 			),
# 			width="40%"
# 		),
# 		fillCol(
# 			fillRow(
# 				plotOutput("right_plot"),
# 				height="75%"
# 			),
# 			fillRow(
# 				szCtrlPanel(right=T),
# 				height="25%"
# 			),
# 			width="40%"
# 		)
# 	)
# )
