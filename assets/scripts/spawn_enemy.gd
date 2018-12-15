extends Node

const scn_enemy = preload("res://assets/scenes/enemy_space_ship.tscn")

func _ready():
	spawn()
	pass

func spawn():
	#condição que vai sempre estar em loop
	while true:
		#função que ativa a randomização
		randomize()
		var enemy = scn_enemy.instance()
		var pos = Vector2()
		#posição randomizada em parte predeterminada
		pos.x = rand_range(0+30, utils.view_size.width-30) #usa o script util pra incurta a chamada
		pos.y = 0-30
		enemy.set_pos(pos)
		#adiciona os objetos em node pra renderizar na tela
		get_node("container").add_child(enemy)
		#cria um timer a partir do util e randomiza o tempo de criaçao dos inimigo
		yield(utils.create_timer(rand_range(0.5, 1.25)), "timeout") 
	
	pass