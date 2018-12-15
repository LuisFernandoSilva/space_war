extends Sprite
#exporta essa variavel para que possa ser editada pelo game designer no proprio node sprite
export var velocity = Vector2()

#função que inicia a cada scene uma unica vez executando o bloco de instruções
#sendo que a execução desse bloco continua enquanto a scene se mantiver ativa
func _ready():
	# chamada de uma função nativa que ativa a função de processamento
	set_process(true)
	
	pass
	
#função que faz o processo do que estiver em seu bloco de instruções
# a cada frame em relação ao tempo(delta)
func _process(delta):
	#função que faz a transformação do calculo para os valores do vector2
	# a cada frame ele multiplica os valores 
	translate(velocity * delta) 
	# pega a posição do x verificando se é maior ou igual 
	#ao tamanho do tela do jogo em sua largura.
	#se for seta a posição do proprio sprite.
	#com isso fazendo o movimento do sprite em loop
	if get_pos().x >= get_viewport_rect().size.width:
		set_pos(Vector2(0,310))
	
	pass