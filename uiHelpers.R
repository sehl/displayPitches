# uiHelpers.R

source("helpers.R")

COL_WIDTH <- 6

# Returns a shiny column containing the controls a single strike zone plot
szCtrlPanel <- function(right=F)
{
	side <- switch(right, T='r_', F='l_')
	column(COL_WIDTH,
		checkboxInput(paste(side,'match', sep=''),
			label="Match to Other", ##
			value=right
			)
	,
		radioButtons(paste(side, 'view', sep=''), label="Viewpoint", ##
			choices=c("Catcher/Umpire", "Pitcher"), inline = T)
	,
		selectInput(paste(side, 'batter', sep=''), label="Batter",
			choices=append(c("All"), sort(levels(pitches$batter)))),
		radioButtons(paste(side, 'stance', sep=''), label="Stance",
			choices=c("All"="All", "Left-Handed"="L", "Right-Handed"="R"),
			inline = T)
	,
		selectInput(paste(side, 'pitcher', sep=''), label="Pitcher",
			choices=append(c("All"), sort(levels(pitches$pitcher)))),
		radioButtons(paste(side, 'throws', sep=''), label="Pitcher Arm",
			choices=c("All"="All", "Left-Handed"="L", "Right-Handed"="R"),
			inline = T)
	,
		sliderInput(paste(side, 'b_height', sep=''),
			label="Batter Height",
			min=minis["b_height"], max=maxes["b_height"],
			value=c(minis["b_height"], maxes["b_height"]), step=1.0)
	,
		selectInput(paste(side, 'umpire', sep=''), label="Umpire",
			choices=append(c("All"), sort(levels(pitches$umpire))))
	,
		selectInput(paste(side, 'stadium', sep=''), label="Stadium",
			choices=append(c("All"), sort(levels(pitches$stadium))))
	,
		sliderInput(paste(side, 'inning', sep=''), label="Inning(s)",
			min=minis["inning"], max=maxes["inning"],
			value=c(minis["inning"], 9), step=1)
	,
		sliderInput(paste(side, 'month', sep=''), label="Month(s)",
			min=minis["month"], max=maxes["month"],
			value=c(minis["month"], maxes["month"]), step=1)

	)
	
# 		,
# 		checkboxInput(paste(name,'_hr', sep=''), label="Show Home Runs",
# 			value=F)
		
	
}
