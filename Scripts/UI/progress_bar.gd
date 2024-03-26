extends Node
# PROGRESS BAR NODES
# this script is for the progress bar that goes from full to half to hide
# it can be set for hunger, thirst, loading, ect. by just selecting
@export_enum("Hunger", "Thirst") var bar_type : String = "Hunger" # selectable dropdown of loading/progress bar types
@export var bar_position : int = 0 # the position on the loading bar of this chunk
var bar # sets the parameter to check


func _ready():
    bar = bar_type # record the parameter to check

func _process(_delta):
    progress_bar() # progress bar function


func progress_bar():
    pass