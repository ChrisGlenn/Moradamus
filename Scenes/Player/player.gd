extends CharacterBody2D
# PLAYER SCRIPT
# the player script that controls the player and all the player's needs
@onready var AUDIOPLAYER = $AudioStreamPlayer
@onready var RAY = $RayCast2D
@onready var SELECTOR = $Selector
var selector_active : bool = false # if the selector is active
var select_pos : int = 1 # 0 to 3 clockwise from up to left
var move_dir : int = 0 # 0 to 3 clockwise from up to left
var move_to : float = 0 # position to move to based on the move_dir
var moving : bool = false # if the player is moving currently
var combat_steps : int = 0 # how many steps the player can take in combat
var minute_check : int = 0 # checks minutes
var day_check : int = 0 # checks days


func _ready():
	Globals.player_x = global_position.x # update player X
	Globals.player_y = global_position.y # update player Y
	SELECTOR.visible = false


func _process(_delta):
	pass

func _physics_process(delta):
	player_movement(delta) # movement function
	selector() # selector function


func player_movement(clock):
	Globals.player_x = global_position.x # update player X
	Globals.player_y = global_position.y # update player Y
	# player movement
	# if the player is not already moving and the selector is not active then check for input
	if !moving and !selector_active:
		# movement input check
		if Input.is_action_pressed("mora_up"):
			# move up
			if RAY.target_position.y != -16:
				RAY.target_position = Vector2(0,-16)
				select_pos = 0 # set select pos
			else:
				if !RAY.is_colliding():
					move_dir = 0 # up
					move_to = global_position.y - 16
					moving = true
		if Input.is_action_pressed("mora_right"):
			# move right
			if RAY.target_position.x != 16:
				# face right
				$Body.flip_h = false
				$Hair.flip_h = false
				$Clothing.flip_h = false
				RAY.target_position = Vector2(16,0)
				select_pos = 1 # set select pos
			else: 
				if !RAY.is_colliding():
					move_dir = 1 # right
					move_to = global_position.x + 16
					moving = true
		if Input.is_action_pressed("mora_down"):
			# move down
			# cast the ray and check for collision
			if RAY.target_position.y != 16:
				RAY.target_position = Vector2(0,16)
				select_pos = 2 # set select pos
			else:
				if !RAY.is_colliding():
					move_dir = 2 # down
					move_to = global_position.y + 16
					moving = true
		if Input.is_action_pressed("mora_left"):
			# cast the ray and check for collision
			if RAY.target_position.x != -16:
				# face left
				$Body.flip_h = true
				$Hair.flip_h = true
				$Clothing.flip_h = true
				RAY.target_position = Vector2(-16,0)
				select_pos = 3 # set select pos
			else:
				if !RAY.is_colliding():
					move_dir = 3 # left
					move_to = global_position.x - 16
					moving = true
		# selector input check
		if Input.is_action_just_pressed("mora_selector"):
			selector_active = true # set the selector to true (on)
	elif moving and !selector_active:
		# move the player and flip the sprite if needed
		if move_dir == 0:
			# up
			if global_position.y > move_to:
				# move the player
				position.y -= Globals.movement_speed * clock
			else:
				# PLAY STEP SOUND
				global_position.y = move_to # make sure it hasn't gone past
				moving = false # complete move
		elif move_dir == 1:
			# right
			if global_position.x < move_to:
				# move the player
				position.x += Globals.movement_speed * clock
			else:
				# PLAY STEP SOUND
				global_position.x = move_to # make sure it hasn't gone past
				moving = false # complete move
		elif move_dir == 2:
			# down
			if global_position.y < move_to:
				# move the player
				position.y += Globals.movement_speed * clock
			else:
				# PLAY STEP SOUND
				global_position.y = move_to # make sure it hasn't gone past
				moving = false # complete move
		elif move_dir == 3:
			# left
			if global_position.x > move_to:
				# move the player
				position.x -= Globals.movement_speed * clock
			else:
				# PLAY STEP SOUND
				global_position.x = move_to # make sure it hasn't gone past
				moving = false # complete move
	# DEBUG
	if Input.is_action_just_pressed("mora_end"):
		get_tree().quit() # quit the game

func time_check():
	pass

func selector():
	if selector_active:
		# set the cursor positiion
		SELECTOR.visible = true # show selector
		if select_pos == 0:
			# UP
			SELECTOR.position = Vector2(0,-16)
		elif select_pos == 1:
			# RIGHT
			SELECTOR.position = Vector2(16,0)
		elif select_pos == 2:
			# DOWN
			SELECTOR.position = Vector2(0,16)
		elif select_pos == 3:
			# LEFT
			SELECTOR.position = Vector2(-16,0)
		# controls
		# get player input and move the selector
		if Input.is_action_just_pressed("mora_up"):
			select_pos = 0
		elif Input.is_action_just_pressed("mora_right"):
			#ANIM.flip_h = false # turn towards selector
			$Body.flip_h = false
			$Hair.flip_h = false
			$Clothing.flip_h = false
			$Weapon.flip_h = false
			select_pos = 1
		elif Input.is_action_just_pressed("mora_down"):
			select_pos = 2
		elif Input.is_action_just_pressed("mora_left"):
			#ANIM.flip_h = true # turn towards selector
			$Body.flip_h = true
			$Hair.flip_h = true
			$Clothing.flip_h = true
			$Weapon.flip_h = true
			select_pos = 3
		# elif Input.is_action_just_pressed("tae_select"):
		# 	pass
		elif Input.is_action_just_pressed("mora_esc"):
			#Globals.hud_controlable = true # can swap huds
			selector_active = false # turn off select mode
		# selector user setting check
		if Globals.selector_auto_off:
			if !Globals.selector_on:
				#Globals.hud_controlable = true # can swap huds
				selector_active = false # turn off select mode
	else:
		# hide the selector if outside of select_mode
		SELECTOR.visible = false # hide selector icon
		SELECTOR.position = Vector2(0,0) # reset selector position to player character
		Globals.selector_on = true # the player can use the selector again if auto_off is on

func update_selector():
	pass

func death():
	pass
