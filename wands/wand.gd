extends Node2D

@onready var magic = preload("res://magics/magicArrows/magic_arrows.tscn").instantiate()
@onready var world = find_parent("worldTest")

func _ready():
	Signals.connect("cast", cast)

func cast():
	magic.cast(world)
	
	
