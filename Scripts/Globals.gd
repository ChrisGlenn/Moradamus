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
var year : int = 4092
var month : int = 2
var day : int = 6
var season : int = 1
var hour : int = 9 # 9am
var minutes : int = 0 # increments by 5
var seconds : int = 0
var weather : String = "Sunny" # the current weather
var weather_updated : bool = false # true if weather event is 'running'
var weather_event : String = "SUN" # the current weather event
var weather_lifespan : int = 0 # records how long the weather event will last
var months_trade : Array = ["Vellion", "Raptura", "Vasser", "Parser", "Pollux", "Bale", "Chema", "Ash", "Toth", "Artemis"] # standardized months
var month_max_days : Array = [28,22,26,29,30,24,26,24,25,22]
var days_in_game : int = 0
var cut_trees : Array = [] # holds trees that have been cut
var mined_rocks : Array = [] # holds stones that have been mined
var crops : Array = [] # holds crops that have been planted and their current statusii
# game start
var new_random : bool = true # if true the player has selected 'new random' at the main menu
# hud
var hud_mode : String = "MAIN" # defaults to splash to start the game
var hud_ctrl_mode : String = "main" # the current mode for the controls listing on the HUD
var hud_ctrl : Array = [
	{"mode": "","controls": "ERROR: NO MODE SET"},
	{"mode": "main","controls": "ESC = Menu\nJ = Journal S = Status\nI = Inventory\nSPACE = Interact"},
]