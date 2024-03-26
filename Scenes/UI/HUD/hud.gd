extends CanvasLayer
# HUD
# the main HUD for the game that is static throughout the entire game
@onready var CONTROLS = $Controls_Label
var hud_ctrl_check : String = "" # used to keep track of hud control update


func _ready():
	update_controls(true)

func _process(_delta):
	pass


func update_controls(scan):
	# update the hud controls
	if !scan:
		# if scan is false then just update without checking the hud mode
		for n in Globals.hud_ctrl.size():
			if Globals.hud_ctrl[n]["mode"] == Globals.hud_ctrl_mode:
				CONTROLS.text = Globals.hud_ctrl[n]["controls"]
	elif scan:
		# check to see if the hud_ctrl_mode Global has changed and if so then update the menu
		if Globals.hud_ctrl_mode != hud_ctrl_check:
			for n in Globals.hud_ctrl.size():
				if Globals.hud_ctrl[n]["mode"] == Globals.hud_ctrl_mode:
					CONTROLS.text = Globals.hud_ctrl[n]["controls"]
					hud_ctrl_check = Globals.hud_ctrl_mode # update the hud control check at the end
