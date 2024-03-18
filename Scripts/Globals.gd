extends Node
# GLOBALS
# singletons, global variables, whatever they are it's kept here

# PLAYER GLOBALS
var can_play = true # if the player can move/play
var player_name = "" # player's name
var player_fame = 0 # player's overall reputation
var player_reputations = [] # array of reputations from -99 to 99 for each

# SYSTEM GLOBALS
var timer_ctrl = 100 # timer control

# GAME GLOBALS
# game start
var new_random = true # if true the player has selected 'new random' at the main menu
# hud
var hud_mode = "SPLASH" # defaults to splash to start the game