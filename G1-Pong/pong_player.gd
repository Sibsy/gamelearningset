extends Area2D

signal hit;

@export var speed = 400;
var screen_size;
var comparison;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size;
	comparison = screen_size.y / 79;
	scale = Vector2(comparison,comparison);
	hide();
	
	pass # Replace with function body.

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled= false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO;
	if Input.is_action_pressed("G1-Pong-P1-Up"):
		velocity.y -= 1;
	if Input.is_action_pressed("G1-Pong-P1-Down"):
		velocity.y += 1;
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed;
		
	position += velocity * delta;
	
	var height = (comparison*9)/2
	
	position.y = clamp(position.y, height, screen_size.y-height);
	pass


func _on_body_entered(body: Node2D) -> void:
	print("Hit");
	hit.emit();
	pass # Replace with function body.
