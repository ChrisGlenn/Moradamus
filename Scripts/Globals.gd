extends Node
# GLOBALS
# singletons, global variables, whatever they are it's kept here

# PLAYER GLOBALS
var can_play : bool = true # if the player can move/play
var in_combat : bool = false # true if combat is enabled
var selector_on : bool = false # true if the player has the selector on
var player_name : String = "Adan" # player's name
var player_credits : float = 100.0 # player's credits
var player_fame : int = 0 # player's overall reputation
var player_status : String = "Healthy" # player's health status
var player_hunger : float = 100.0 # player's hunger
var player_thirst : float = 100.0 # player's thirst
var player_reputations : Array = [] # array of reputations from -99 to 99 for each
var player_x : float = 0.0 # player_x location
var player_y : float = 0.0 # player_y location
var location = "Alpha Station: 15"

# SYSTEM GLOBALS
var timer_ctrl : int = 100 # timer control
var movement_speed : int = 97 # player/npc/ect. movement speed

# GAME GLOBALS
var permadeth : bool = false # if permadeth is on or off...
var selector_auto_off : bool = true # if the selector automatically shuts off
var year = 4092
var month = 2
var day = 6
var season = 1
var hour = 9 # 9am
var minutes = 0 # increments by 5
var seconds = 0
var weather = "Sunny" # the current weather
var weather_updated = false # true if weather event is 'running'
var weather_event = "SUN" # the current weather event
var weather_lifespan = 0 # records how long the weather event will last
var months_trade = ["Ale", "Ced"] # standardized months
var month_max_days = [28,22,26,29,30,24,26,24,25,22]
var seasons = ["Winter","Spring","Summer","Fall"]
var seasonal_attribute = 4 # the initial stat needed to beat for weather events
var seasonal_weather_mod = [3,1,2,2] # the odds for a weather event for each season
var seasonal_rain = 15 # when it rains this gets incremented from 0 and affects crop output
var days_in_game = 0
var cut_trees = [] # holds trees that have been cut
var mined_rocks = [] # holds stones that have been mined
var crops = [] # holds crops that have been planted and their current statusii
# game start
var new_random : bool = true # if true the player has selected 'new random' at the main menu
# hud
var hud_mode : String = "SPLASH" # defaults to splash to start the game