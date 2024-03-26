extends Node
# PROGRESS BAR NODES
# this script is for the progress bar that goes from full to half to hide
# it can be set for hunger, thirst, loading, ect. by just selecting
@export_enum("hunger", "thirst") var bar_type : String = "hunger" # selectable dropdown of loading/progress bar types
@export var bar_max : int = 0 # the position on the loading bar of this chunk
var bar # sets the parameter to check


func _ready():
    bar = Globals.player[bar_type] # record the parameter to check
    print(str(bar_max))

func _process(_delta):
    progress_bar() # progress bar function


func progress_bar():
	# check the position and then check if it's below the display 'threshold' 
	# then hide the icon
    if bar_max != 0:
        # check the set range and set the frame/visibility accordingly
        if bar >= bar_max:
            self.frame = 0 # full frame
        elif bar < (bar_max - 5) and bar > (bar_max - 10):
            self.visible = true # show incase the bar increases
            self.frame = 1 # half full
        elif bar < (bar_max - 10):
            self.visible = false # hide this bar section
    else:
        print(str("ERROR: ", self, " range is not set!"))
        get_tree().quit() # quit the game after issuing warning