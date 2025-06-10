extends Button

@export var hover_scale: Vector2 = Vector2(7.5, 7.5)
	
func _on_pressed() -> void:
	get_tree().quit()


func _on_mouse_entered() -> void:
	create_tween().tween_property(self, "scale", hover_scale, 0.1).set_trans(Tween.TRANS_SINE)


func _on_mouse_exited() -> void:
	create_tween().tween_property(self, "scale", Vector2(6.5, 6.5), 0.1).set_trans(Tween.TRANS_SINE)
