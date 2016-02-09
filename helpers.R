# helpers.R

# load and format data
pitches <- read.csv('data/pitches.csv')

row.names(pitches) <- pitches$pitch_id
pitches <- pitches[,2:length(pitches)]

maxes <- c("b_height"=max(pitches$b_height),
	"inning"=max(pitches$inning), "month"=max(pitches$month))
minis <- c("b_height"=min(pitches$b_height),
	"inning"=min(pitches$inning), "month"=min(pitches$month))

# pitches$month <- as.factor(pitches$month)
# pitches$inning <- as.factor(pitches$inning)

options <- c("batter", "stance", "pitcher", "throws", "umpire", "stadium")

for (name in options)
{
	pitches[[name]] <- as.factor(pitches[[name]])
}

pitches$result <- as.factor(pitches$result)

plot_min_x <- min(pitches$x)
plot_max_x <- max(pitches$x)
plot_min_z <- min(pitches$z)
plot_max_z <- max(pitches$z)

