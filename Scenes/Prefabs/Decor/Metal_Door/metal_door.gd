extends Area2D
# METAL DOOR
# a basic metal door
@onready var SPRITE = $AnimatedSprite2D
@export var hit_point : int = 12 # door's hit points
@export var has_owner : String = "" # who/what faction the door belongs too
@export var locked : bool = false # if the door is locked or not
@export var door_open : bool = false # if the door is open or closed
# HUD information
@export var TITLE : String = "" # the title/name for the HUD
@export var DESCRIPTION : String = "" # the description for the HUD
@export var HUD_MODE : String = "door_closed" # the hud 'control' mode (default is door_closed)
var selector_in : bool = false # if the selector is currently 'in' or not


func _ready():
	door_update() # update the door frame, control mode, ect.

func _process(_delta):
	pass


func door_update():
	if door_open:
		HUD_MODE = "door_opened" # set hud control mode
	else:
		HUD_MODE = "door_closed" # set hud control mode

func operate_door(direction : String):
	if direction == "open":
		pass
	elif direction == "close":
		pass
	else:
		pass


func _on_animated_sprite_2d_animation_finished():
	SPRITE.stop() # stop the animation
	SPRITE.frame = 0 # stop the frame at the beginning