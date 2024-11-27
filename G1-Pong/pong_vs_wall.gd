extends Node

@export var ball_scene: PackedScene
var score
var bgplayer = BgMusicPlayer;
	
func _ready():
	var viewport_size = get_viewport().get_visible_rect().size;
	var levelMusic = load("res://Common/Assets/Audio/Dark Piano Solo Loop.ogg");
	bgplayer.crossfade_music_to(levelMusic);
	$PlayerSpawn.position = Vector2((viewport_size.x /111)*3 ,viewport_size.y/2);
	$BallSpawn.position = Vector2(viewport_size.x/2, viewport_size.y/2);
	new_game();
	pass # Replace with function body.
	
func new_game():
	score = 0;
	$PongPlayer.start($PlayerSpawn.position);
	$StartTimer.start();
	
	print($BallSpawn.position.x)
	print($BallSpawn.position.y)
	
	
func game_over():
	pass;
	

func _on_ball_timer_timeout() -> void:
	pass # Replace with function body.


func _on_start_timer_timeout() -> void:
	print("addingBall")
	var ball = ball_scene.instantiate();
	var ball_spawn_location = $BallSpawn.position
	ball.position = $BallSpawn.position;
	ball.rotation =  randf_range(-PI,PI);
	var  velocity = Vector2(randf_range(150.0,250.0),0.0)
	ball.linear_velocity = velocity.rotated(randf_range((-PI/8)-15,(PI/8)+15));
	add_child(ball);
	print("Ball Added")
	pass # Replace with function body.


func _on_pong_player_hit() -> void:
	score +=1;
	pass # Replace with function body.
