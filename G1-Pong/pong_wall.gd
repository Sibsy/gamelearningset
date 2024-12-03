extends Area2D


signal hit;

@export var _bounce_directionY := 1
@export var _bounce_directionX := 0

func _on_area_entered(area: Area2D) -> void:
	if area.name == "BALLY":
		var originaly = area.direction.y  if _bounce_directionY == 0 else (0- area.direction.y);
		var originalx = area.direction.x  if _bounce_directionX == 0 else (0- area.direction.x);
		area.direction = Vector2(originalx, originaly).normalized();
		print("Speed After Bounce", area._speed)
	pass # Replace with function body.
