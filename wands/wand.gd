extends Node2D

var spell
@onready var world = find_parent("worldTest")

func _ready():
	Signals.connect("cast", cast)

func cast():
	spell = preload("res://spells/spellArrows/spell_script.tscn").instantiate()
	spell.cast(world)
	spell = null
	
	
