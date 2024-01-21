extends Node2D


func cast(world):
	world.add_child(self)
	var spellPath = preload("res://spells/spellArrows/spell_arrows.tscn")
	for i in range(3):
		var spell = spellPath.instantiate()
		world.add_child(spell)
		spell.global_position = world.get_node("playerNode/Node2D/Marker2D").global_position
		spell.velocity = world.get_global_mouse_position() - spell.global_position
		$cadence.start()
		await $cadence.timeout
	queue_free()



