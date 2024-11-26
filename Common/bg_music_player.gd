extends Node

@onready var BGMPlayer1 = $BGMPlayer1;
@onready var BGMPlayer2 = $BGMPlayer2;

const mute_db := -80.0 # To mute the audio player
const default_music_db := 0.0 # This is for normal volume
const fade_time := 2.0 # The time it takes to fade in/out in seconds

var current_music_player : AudioStreamPlayer # the current player
var previous_music_player: AudioStreamPlayer # the previous used player

func _ready():
	print("BGM Audio Stream is ready.")
	print("Setting BUS to BGM")
	BGMPlayer1.bus = "BGM";
	BGMPlayer2.bus = "BGM";
	print("Loading Initial Audio");
	var levelMusic = load("res://Common/Assets/Audio/Dark Piano Solo Loop.ogg");
	print("Setting current player to BGMPlayer1");
	current_music_player = BGMPlayer1;
	print("Fade In Audio")
	fade_music_in(levelMusic);
	
	
func fade_music_in(track: AudioStream) -> void:
	current_music_player.stream = track # Specify the song
	current_music_player.volume_db = mute_db # Mute the player
	current_music_player.play() # Start playing
	# Use tweens for transition:
	var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(current_music_player, "volume_db", default_music_db, fade_time)
	print("Fade Music in on");
	print(current_music_player);
	print("Playing Music track")
	print(current_music_player.stream.resource_path);
	
func fade_music_out() -> void:
	print("Fade Music out on");
	print(previous_music_player);
	var tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_SINE)
	tween.tween_property(current_music_player, "volume_db", mute_db, fade_time)
	tween.connect("finished", stop_old_player);
	
func stop_old_player() -> void:
	previous_music_player.stop();	
	
func crossfade_music_to(track: AudioStream) -> void:
	previous_music_player = current_music_player;  #Set previous player
	fade_music_out() # Fade out first player
	# Switch current Player:
	current_music_player = BGMPlayer1 if current_music_player == BGMPlayer2 else BGMPlayer2
	fade_music_in(track) # Fade in second player
	
