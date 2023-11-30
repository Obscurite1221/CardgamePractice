extends CheckBox

var music_bus = AudioServer.get_bus_index("Music")
func _on_sound_toggle_toggled():
	AudioServer.set_bus_mute(music_bus,not AudioServer.is_bus_mute(music_bus))
	
