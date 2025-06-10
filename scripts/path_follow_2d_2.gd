extends PathFollow2D

var time: float = 0.0
var speed: float = .7

func _process(delta: float) -> void:
	time += delta * speed
	progress_ratio = (sin(time) * 0.5) + 0.5
