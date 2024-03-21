extends Node
# GLOBALS
# singletons, global variables, whatever they are it's kept here

# PLAYER GLOBALS
var can_play : bool = true # if the player can move/play
var in_combat : bool = false # true if combat is enabled
var selector_on : bool = false # true if the player has the selector on
var player_name : String = "" # player's name
var player_fame : int = 0 # player's overall reputation
var player_reputations : Array = [] # array of reputations from -99 to 99 for each
var player_x : float = 0.0 # player_x location
var player_y : float = 0.0 # player_y location

# SYSTEM GLOBALS
var timer_ctrl : int = 100 # timer control
var movement_speed : int = 97 # player/npc/ect. movement speed

# GAME GLOBALS
var permadeth : bool = false # if permadeth is on or off...
var selector_auto_off : bool = true # if the selector automatically shuts off
# game start
var new_random : bool = true # if true the player has selected 'new random' at the main menu
# hud
var hud_mode : String = "SPLASH" # defaults to splash to start the game