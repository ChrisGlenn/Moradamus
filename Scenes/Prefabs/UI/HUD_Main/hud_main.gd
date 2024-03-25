extends Node2D
# HUD MAIN
# the main hud in the game that displays the base information for
@onready var CHAR_NAME = $Name_Label
@onready var LOC_NAME = $Location_Label


func _ready():
    # set the HUD elements from Globals
    CHAR_NAME.text = Globals.player_name
    LOC_NAME.text = Globals.location