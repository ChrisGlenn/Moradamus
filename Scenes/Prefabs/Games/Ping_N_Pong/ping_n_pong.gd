extends Node2D
# PING N' PONG
# A pong clone for the Gemini Terminal Systems
# onready title screen
# onready paddle-a
# onready paddle-b
const paddle_speed : int = 100 # paddle movement speed
var game_score : Array = [0,0] # [player, cpu]