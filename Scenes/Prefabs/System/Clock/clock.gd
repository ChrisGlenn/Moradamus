extends Node2D
# CLOCK
# time marches on...if the conditions are set right...
@onready var TIMER = $Timer
var time_on = true # if true then time can increment
var timer_started = false # timer start check to stop it from repeating to start (Godot is dumb like that sometimes...)
var new_day = false # 


func _process(delta):
	game_clock(delta) # game clock function


func game_clock(_clock):
	if time_on:
		if !timer_started:
			TIMER.start() # start the timer
			timer_started = true # set the timer check to true
		# SET THE MINUTES
		if Globals.seconds == 60:
			Globals.seconds = 0 # reset seconds
			if Globals.minutes < 55:
				# increment the minutes by 5
				Globals.minutes += 5
			else:
				# reset the minutes and check the hours and advance the hour
				Globals.minutes = 0
				if Globals.hour < 23:
					Globals.hour += 1
				else:
					Globals.hour = 1 # reset hours to 1
					# month/year advance
					if Globals.day < Globals.month_max_days[Globals.month]:
						Globals.day += 1 # advance the day
						new_day = true # it's the start of a new day
					else:
						Globals.day = 1 # reset the day
						if Globals.month < 10:
							# advance the month if it's not a new year yet
							Globals.month += 1
						else:
							Globals.month = 0 # reset month
							Globals.year += 1 # advance the year
						new_day = true # it's the start of a new day
	else:
		TIMER.stop() # stop the timer
	if new_day:
		# if it's a new day then reset and update anything that may be necessary
		new_day = false


func _on_timer_timeout():
	Globals.seconds += 10 # increment by 10
