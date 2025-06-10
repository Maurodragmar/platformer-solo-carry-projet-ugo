extends Button

@export var hover_scale: Vector2 = Vector2(7, 7)
	
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")


func _on_mouse_entered() -> void:
	create_tween().tween_property(self, "scale", hover_scale, 0.1).set_trans(Tween.TRANS_SINE)


func _on_mouse_exited() -> void:
	create_tween().tween_property(self, "scale", Vector2(6, 6), 0.1).set_trans(Tween.TRANS_SINE)
