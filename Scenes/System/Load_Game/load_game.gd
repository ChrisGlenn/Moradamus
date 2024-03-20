extends Node2D
# LOAD GAME
# the player has decided to load a saved game OR start a new game...OR start a new 'random' game
# for the alpha release there is no 'new' game just new random
# DESIGN
# the design of the load screen is a scrolling static screen (an attempt to emulate tape loading on old computers), and
# a random list of things that the game is 'loading' which are taken from an array set in this script.
@onready var STATIC = $ParallaxBackground
@export var Loading_Items : Array # random words for the loading screen
@export var scroll_speed : int = 150 # scrolling speed for static


func _process(delta):
    STATIC.scroll_offset.y -= scroll_speed * delta