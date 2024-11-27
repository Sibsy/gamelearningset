extends RigidBody2D

var screen_size;
var comparison;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size;
	comparison = screen_size.y / 79;
	scale = Vector2(comparison,comparison);
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
