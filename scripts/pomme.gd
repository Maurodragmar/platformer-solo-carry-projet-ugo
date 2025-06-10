extends Area2D


func _ready() -> void:
	$AnimatedSprite2D.play("default")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$AnimatedSprite2D.play("collected")


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "collected":
		queue_free()
