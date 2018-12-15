extends Sprite

func _ready():
	randomize()
	#seta a rotação do sprite,no parametro funçao que Converte graus para radianos.
	#randomiza num determinado arranjo de numeros
	set_rot(deg2rad(rand_range(0,360)))
	#ativa a aemiçao das particulas
	get_node("smoke").set_emitting(true)
	get_node("flare").set_emitting(true)
	#ativa a animação de fade out
	get_node("anim").play("fade_out")
	sounds.play("explosion")
	yield(get_node("anim"), "finished")
	queue_free()
	
	pass