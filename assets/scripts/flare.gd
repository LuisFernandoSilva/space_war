extends Sprite
#vai ser executado todas as vezes que for acionado
func _ready():
	#pega o node, da play na animação
	get_node("anim").play("fade_out")
	#função que para a execuçao assim que tiver um sinal, o retornando ao seu estado
	yield(get_node("anim"), "finished")
	#função que libera a memoria o que foi executado antes dela
	queue_free() 
	pass
