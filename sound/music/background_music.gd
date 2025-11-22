extends Node

@onready var current_anim: Animation
var current_bgm: String

# plays the track specified
func play(bgm_name: String):
	current_anim = $AnimationPlayer.get_animation("fade_out")
	match bgm_name:
		"rain":
			$Rain.volume_db = 0.0
			$Rain.play()
			current_anim.track_set_path(0, "rain")
		_:  # didn't match any bgm
			print("Unable to play BGM of name", bgm_name)
			return
	current_bgm = bgm_name

# dynamically fades out the correct track
func fade_out():
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished
	get_node(current_bgm).playing = false
	
