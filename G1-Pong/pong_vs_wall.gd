extends Node

@export var PongBall: PackedScene

var ball;
var bellVelocity;
var score
var bgplayer = BgMusicPlayer;
var viewport_size;
var BallDirection = Vector2(1.0,0.0);
var BALL_SPEED = 400;

	
func _ready():
	viewport_size = get_viewport().get_visible_rect().size;
	var levelMusic = load("res://Common/Assets/Audio/Dark Piano Solo Loop.ogg");
	bgplayer.crossfade_music_to(levelMusic);
	$PlayerSpawn.position = Vector2((viewport_size.x /111)*3 ,viewport_size.y/2);
	new_game();
	pass # Replace with function body.
	
func new_game():
	ball = null;
	score = 0;
	$PongPlayer.start($PlayerSpawn.position);
	$StartTimer.start();
	
func game_over():
	if(ball != null):
		remove_child(ball);
	pass;

func _on_start_timer_timeout() -> void:
	ball = PongBall.instantiate();
	ball.position = Vector2(viewport_size.x/2, viewport_size.y/2); #Always Spawn In Middle
	ball.name = "BALLY"
	add_child(ball);
	print("Ball Added")
	pass # Replace with function body.


func _on_pong_player_hit() -> void:
	score +=1;
	ball._speed += 100
	print("score is: ", score);
	print("Speed is increased by 100")
	print("New Speed: ", ball._speed)
	pass # Replace with function body.


func _on_out_of_bounds_area_entered(area: Area2D) -> void:
	game_over();
	new_game();
	pass # Replace with function body.
