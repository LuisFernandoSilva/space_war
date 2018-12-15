extends Node

func _ready():
	get_node("hi_score/label").set_text(str(data.data_score))
	
	pass

func _on_button_play_pressed():
	get_tree().change_scene("res://assets/scenes/stages/game_stage.tscn")
	pass 


