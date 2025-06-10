extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

var double_jump = true
var is_hit = false

@onready var animation = $AnimatedSprite2D

func hit():
	is_hit = true
	animation.play("hit")

func _physics_process(delta: float) -> void:
	if is_hit:
		return
		
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
				
		elif double_jump:
			velocity.y = JUMP_VELOCITY
			animation.play("double jump")
			double_jump = false

	if is_on_floor():
		double_jump = true

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction > 0:
		animation.flip_h = false
	elif direction < 0:
		animation.flip_h = true

	if is_on_floor():
		if direction == 0:
			animation.play("idle")
		else:
			animation.play("run")


	if not is_on_floor() and double_jump:
		animation.play("jump")
	elif not is_on_floor() and !double_jump:
		animation.play("double jump")

	if not is_on_floor() and velocity.y > 0:
		animation.play("fall")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	if animation.animation == "hit":
		get_tree().reload_current_scene()
