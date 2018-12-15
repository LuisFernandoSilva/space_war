extends Label
#cria uma variavel score vazia e a aponta como um atalho para uma função
var score = 0 setget set_score
onready var score_label = get_node("label")

func _ready():
	pass

func set_score(value):
	#adiciona o valor passado para a variavel score
	score = value
	#seta na tela o label de score função str converte um numero em string
	score_label.set_text(str(score))
	
	if score > data.data_score:
		data.data_score = score
	pass