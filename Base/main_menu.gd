extends Node2D
var bgplayer = BgMusicPlayer;
	
func Button_on_button_pressed() -> void:
	var levelMusic = load("res://Common/Assets/Audio/Dark Piano Solo Loop.ogg");
	bgplayer.crossfade_music_to(levelMusic);
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	var levelMusic = load("res://Common/Assets/Audio/Labyrinth Loop.ogg");
	bgplayer.crossfade_music_to(levelMusic);
	pass # Replace with function body.
