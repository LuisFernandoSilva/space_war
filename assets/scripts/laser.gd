extends Area2D

#velocidade do disparo
export var velocity = Vector2()
#constante da scena flare(clarão), faz o preload do recurso enquanto esse script estiver ativo
const scn_flare = preload("res://assets/scenes/flare.tscn") 
const scn_explosion = preload("res://assets/scenes/explosion.tscn")


func _ready():
	# chamada de uma função nativa que ativa a função de processamento
	set_process(true)
	#função que cria um flare na scene
	create_flare()
	#aciona o notifier pra verificar o posicionamento, e emite o sinal de saida como retorno
	yield(get_node("notifier"), "exit_screen")
	#libera da memoria o node
	queue_free()
	pass

func _process(delta):
	#função que faz a transformação do calculo para os valores do vector2
	# a cada frame ele multiplica os valores 
	translate(velocity * delta)
	pass
#função que vai renderizar o laser na tela
func create_flare():
	#variavel que carrega o objeto flare
	var flare = scn_flare.instance()
	#a posiçao do clarao e a mesma do laser
	flare.set_pos(get_pos()) 
	#add como seu filho na scene laser o flare
	#chama a função do script utils que se extende por toda as scenes.
	#podendo ser chamado apenas pelo seu nome sem precisar ser instanciado 
	utils.main_node.add_child(flare) 
	pass

func create_explosion():
	
	var explosion = scn_explosion.instance()
	explosion.set_pos(get_pos())
	utils.main_node.add_child(explosion)
	
	pass
	
#sinal que detecta tudo que entrar na area especifica passado o objeto como parametro
func _on_laser_hero_area_enter( other ):
	#se o objeto for do grupo
	if other.is_in_group("enemys"):
		other.queue_free()
		#função que procura um node pelo seu nome especifico na arvore de nodes
		utils.find_node("score_label").score+=5
		#cria um clarao quando o inimigo e destroido
		create_flare()
		create_explosion()
	pass # replace with function body
