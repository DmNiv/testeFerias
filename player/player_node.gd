extends CharacterBody2D

@onready var animations = $Sprite2D/AnimationPlayer

@export var speed = 300.0
@export var jumpVelocity = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var caindo = false


func animate():
	if get_global_mouse_position() > global_position:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
	if velocity.length() == 0:
		animations.play("idle")
	elif velocity.length() != 0 and is_on_floor():
		animations.play("idle")
		animations.stop()
	if velocity.y > 0 and !caindo:
		animations.play("down")
		caindo = true
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		animations.play("up")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_floor():
		caindo = false
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jumpVelocity

	var direction = Input.get_axis("ui_a", "ui_d")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	$Node2D.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("mouse_left_button"):
		Signals.emit_signal("cast")

	animate()
	move_and_slide()
