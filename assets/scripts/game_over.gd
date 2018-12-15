extends Control

func _ready():
	pass


func _on_timer_over_timeout():
	get_tree().change_scene("res://assets/scenes/stages/main_stage.tscn")
	pass 
