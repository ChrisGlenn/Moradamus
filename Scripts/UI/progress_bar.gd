extends Node
# PROGRESS BAR NODES
# this script is for the progress bar that goes from full to half to hide
# it can be set for hunger, thirst, loading, ect. by just selecting
@export_enum("hunger", "thirst") var bar_type : String = "hunger" # selectable dropdown of loading/progress bar types
@export var bar_max : float = 0 # the position on the loading bar of this chunk
var bar # sets the parameter to check
var bar_half # the half loading position
var bar_min # the minimum position


func _ready():
    bar = Globals.player[bar_type] # record the parameter to check
    bar_half = bar_max - 5 # set bar_half
    bar_min = bar_max - 10 # set bar mini

func _process(_delta):
    progress_bar() # progress bar function


func progress_bar():
	# check the position and then check if it's below the display 'threshold' 
	# then hide the icon
    bar = Globals.player[bar_type] # update the parameter to check
    if bar_max != 0:
        # check the set range and set the frame/visibility accordingly
        if bar > bar_half:
            self.frame = 0 # full frame
        elif (bar < bar_half and bar > bar_min):
            self.visible = true # show incase the bar increases
            self.frame = 1 # half full
        elif bar < bar_min:
            self.visible = false # hide this bar section
    else:
        print(str("ERROR: ", self, " range is not set!"))
        get_tree().quit() # quit the game after issuing warning