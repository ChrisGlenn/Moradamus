extends CanvasLayer
# HUD
# the main HUD for the game that is static throughout the entire game


func _ready():
	# spawn the splash screen
	var splash_load = load("res://Scenes/UI/HUD_Modes/HUD_Splash/hud_splash.tscn")
	var splash = splash_load.instantiate()
	add_child(splash)
