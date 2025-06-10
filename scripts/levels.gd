extends Node2D

@export() var level_number = 1

func _process(delta: float) -> void:
	if not get_tree().get_nodes_in_group("pommes"):
		var next_number = level_number + 1
		var next_level_path = "res://scenes/levels/level_%d.tscn" % next_number
		if ResourceLoader.exists(next_level_path):
			get_tree().change_scene_to_file(next_level_path)
		else:
			get_tree().change_scene_to_file("res://scenes/menu.tscn")
