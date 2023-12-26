extends Control

func _on_start_pressed():
	# Function body for Start button pressed
	get_tree().change_scene_to_file("res://firststop.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://settingsscene.tscn")

func _on_stop_pressed():
	# Function body for Stop button pressed
	get_tree().quit()
