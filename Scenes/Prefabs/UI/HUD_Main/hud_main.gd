extends Node2D
# HUD MAIN
# the main hud in the game that displays the base information for
@onready var CHAR_NAME = $Name_Label
@onready var LOC_NAME = $Location_Label
@onready var DATE_NAME = $Date_Weather_Label
@onready var REP_NAME = $Reputation_Label
@onready var CREDIT_NAME = $Credits_Label
@onready var STATUS_NAME = $Status_Label


func _ready():
    # set the HUD elements from Globals
    CHAR_NAME.text = Globals.player["name"]
    LOC_NAME.text = Globals.location
    DATE_NAME.text = str(Globals.hour, ":") + str(Globals.minutes).pad_zeros(2) + str(" ", Globals.day, " ", Globals.months_trade[Globals.month], " ", Globals.year)
    CREDIT_NAME.text = str("Credits: ", Globals.player["credits"])
    STATUS_NAME.text = str("Status: ", Globals.player["status"])

func _process(_delta):
    # keep updates
    DATE_NAME.text = str(Globals.hour, ":") + str(Globals.minutes).pad_zeros(2) + str(" ", Globals.day, " ", Globals.months_trade[Globals.month], " ", Globals.year)