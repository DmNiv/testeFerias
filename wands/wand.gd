extends Node2D

var spell
@onready var world = find_parent("worldTest")

func _ready():
	Signals.connect("cast", cast)

func cast():
	spell = load("res://spells/spellArrows/spellScript.gd").new()
	spell.cast(world)
	spell = null
	
	
