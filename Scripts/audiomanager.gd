extends Node

#Onready variables for the nodes.
@onready var bgm: AudioStreamPlayer = $BGM

# In any scene, call on AudioManager.play_music(name) to start playing the music with the name parameter.
func play_music(audio : String) -> void:
	if not bgm.playing:
		bgm.play()
	bgm.get_stream_playback().switch_to_clip_by_name(audio)

# In any scene, call on AudioManager.play_sound(name) to play a sound effect with the name parameter.
func play_sound(audio : String) -> void:
	get_node("SFX/" + audio).play()

# In any scene, call on AudioManager.stop_sound(name) to stop a sound effect with the name parameter.
func stop_sound(audio : String) -> void:
	get_node("SFX/" + audio).stop()

# In any scene, call on AudioManager.play_ambience(name) to play a sound effect with the name parameter.
func play_ambience(audio : String) -> void:
	get_node("AMB/" + audio).play()

# In any scene, call on AudioManager.stop_ambience(name) to stop a sound effect with the name parameter.
func stop_ambience(audio : String) -> void:
	get_node("AMB/" + audio).stop()
