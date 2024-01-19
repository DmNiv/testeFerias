extends RigidBody2D

var velocity = Vector2(0, 1)
const speed = 90

var magic = preload("res://magics/magicArrows/magic_arrows.tscn")

func cast(world):
	for i in range(3):
		var newMagic = magic.instantiate()
		world.add_child(newMagic)

func _process(delta):
	move_and_collide(velocity.normalized() * delta * speed)
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


