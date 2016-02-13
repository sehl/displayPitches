# helpers.R

players <- read.csv('data/players.csv')

# load and format data
pitches <- read.csv('data/pitches.csv')

row.names(pitches) <- pitches$pitch_id
pitches <- pitches[,2:length(pitches)]

maxes <- c("b_height"=max(pitches$b_height),
	"inning"=max(pitches$inning), "month"=max(pitches$month))
minis <- c("b_height"=min(pitches$b_height),
	"inning"=min(pitches$inning), "month"=min(pitches$month))

options <- c("batter", "stance", "pitcher", "throws", "umpire", "stadium")

for (name in options)
{
	pitches[[name]] <- as.factor(pitches[[name]])
}

pitches$result <- as.factor(pitches$result)

plot_min_x <- min(pitches$x, na.rm=TRUE)
plot_max_x <- max(pitches$x, na.rm=TRUE)
plot_min_z <- min(pitches$z, na.rm=TRUE)
plot_max_z <- max(pitches$z, na.rm=TRUE)

batters <- players[players$id %in% pitches$batter,]
batterkey <- batters$id
names(batterkey) <- c(paste(batters$last, ', ', batters$first, sep=''))
batterkey <- batterkey[order(batterkey)]

pitchers <- players[players$id %in% pitches$pitcher,]
pitcherkey <- pitchers$id
names(pitcherkey) <- c(paste(pitchers$last, ', ', pitchers$first, sep=''))
pitcherkey <- pitcherkey[order(pitcherkey)]

