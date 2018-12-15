extends Node

func _ready():
	pass
#passa o parametro que sera o nome do som a ser executado conforme add no samplePlayer
func play(sampleplay):
	get_node("sample_player").play(sampleplay)
	pass