extends Node2D

var next_scene_after_draft = "" # Variable to store the next scene after draft

func _on_back_pressed():
	get_tree().change_scene_to_file("res://mainmenuscene.tscn")

func _on_hangout_pressed():
	next_scene_after_draft = "res://hangout.tscn"
	get_tree().change_scene_to_file("res://draftscene.tscn")

func _on_help_pressed():
	next_scene_after_draft = "res://helpscene.tscn"
	get_tree().change_scene_to_file("res://draftscene.tscn")

func _on_hunt_pressed():
	next_scene_after_draft = "res://huntscene.tscn"
	get_tree().change_scene_to_file("res://draftscene.tscn")

# This function is called when leaving the draft scene (to be called when leaving the draft scene)
func transition_to_next_scene_after_draft():
	if next_scene_after_draft != "":
		get_tree().change_scene_to_file(next_scene_after_draft)
	else:
		print("No scene set to transition after draft.")
