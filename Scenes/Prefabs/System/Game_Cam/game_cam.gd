extends Camera2D
# GAME CAMERA
# the camera for the game
# will follow the player if it goes out of the camera bounds (if enabled to)
@export var follow_player : bool = true # default is true
@export var player : NodePath # player goes here