extends Area2D

const DEFAULT_SPEED := 400.0

@export var _speed = DEFAULT_SPEED
var screen_size;
var comparison;

@export var direction := Vector2.LEFT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size;
	comparison = screen_size.y / 120;
	scale = Vector2(comparison,comparison);
	pass # Replace with function body.

func _process(delta: float) -> void:
	position += _speed * delta * direction
	
	
