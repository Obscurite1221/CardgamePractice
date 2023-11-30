extends Control





func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://Table.tscn")
	
	


	
	


func _on_quit_pressed():
	get_tree().quit()
	
var music_bus = AudioServer.get_bus_index("Music")
func _on_mute_music_2_pressed():
	AudioServer.set_bus_mute(music_bus,not AudioServer.is_bus_mute(music_bus))

