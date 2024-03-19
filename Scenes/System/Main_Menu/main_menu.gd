extends Node2D
# MAIN MENU SCENE
# while the main menu is displayed on the left-hand screen this scene will play out
# it will be some kind of intergalactic 'happening' but for right now it just scrolls up
# and has the title and 8.2667.94 branding
@onready var MENU_ELEMENTS = $Menu_Elements
@onready var MENU_TERMINAL = $Terminal
@export var scroll_speed : int = 40 # scroll speed
var main_on : bool = false # if on then the menu will become active


func _ready():
	MENU_TERMINAL.visible = false # hide the terminal

func _process(delta):
	main_menu(delta) # main menu fuction


func main_menu(clock):
	# check if the main_on is true and then if so scroll up
	if main_on:
		if MENU_ELEMENTS.global_position.y > 0:
			MENU_ELEMENTS.position.y -= scroll_speed * clock
		else:
			MENU_ELEMENTS.global_position.y = 0 # make sure it doesn't go beyond zero
		# INPUT
		# check the player input and react accordingly to their wishes
		# NEW GAME IS NOT AVAILABLE ONLY NEW RANDOM GAME
		if Input.is_action_just_pressed("mora_f1"):
			print("NEW RANDOM SELECTED")
		if Input.is_action_just_pressed("mora_f2"):
			print("LOAD GAME NOT IMPLEMENTED YET...")
		if Input.is_action_just_pressed("mora_f3"):
			print("MENU SETTINGS NOT IMPLEMENTED YET...")
		if Input.is_action_just_pressed("mora_f4"):
			# quit
			get_tree().quit()
	else:
		# check for the menu mode and then turn the main on when the global.menu_mode is MAIN_MENU
		if Globals.hud_mode == "MAIN_MENU":
			if !main_on: 
				MENU_TERMINAL.visible = true # show the terminal
				main_on = true # turn the main menu on
