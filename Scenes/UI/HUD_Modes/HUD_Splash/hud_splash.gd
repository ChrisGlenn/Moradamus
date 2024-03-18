extends CanvasLayer
# HUD SPLASH SCREEN
# the splash screen shows the booting... then pauses to play a beep
# then will move on to load the rest of the text and then update the parent (HUD)
# that it has been completed and to start the MAIN MENU
@onready var BEEP = $Beep
@onready var TEXT = $Splash_Text
@export var boot_timer : int = 100 # boot timer used to start the splash then do sys_check
var stage : int = 0 # 0 is countdown, 1 is init boot, 2 is countdown, 3 is wrap up, 4 is complete
var timer_rec : int # timer record
var HUD # hud holder


func _ready():
    TEXT.visible_characters = 0 # hide all characters
    timer_rec = boot_timer # record boot timer

func _process(delta):
    boot(delta) # boot function


func boot(clock):
    # BOOT PROCESS
    if stage == 0:
        # countdown then show the booting.. text before pausing again
        if boot_timer > 0:
            boot_timer -= Globals.timer_ctrl * clock # decrement boot timer
        else:
            if TEXT.visible_characters < 12:
                TEXT.visible_characters += Globals.timer_ctrl * clock # increment visible characters
            else:
                boot_timer = timer_rec # reset timer
                stage += 1 # advance to next stage
    elif stage == 1:
        # countdown, play the beep, then continue
        if boot_timer > 0:
            boot_timer -= Globals.timer_ctrl * clock # decrement timer
        else:
            # PLAY AUDIO
            stage += 1 # advance to next stage
    elif stage == 2:
        # complete playing then delete self
        if TEXT.visible_ratio < 1:
            TEXT.visible_characters += (Globals.timer_ctrl * 2) * clock # increment visible characters
        else:
            Globals.hud_mode = "MAIN_MENU" # set to main menu
            queue_free() # delete self