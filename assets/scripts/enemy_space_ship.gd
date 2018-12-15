#faz a herança de tudo que tem no script enemy
extends "res://assets/scripts/enemy.gd"


const scn_laser = preload("res://assets/scenes/laser_enemy.tscn")

func _ready():
	
	set_process(true)
	#funcao do script q faz a escolha de direita ou esquerda
	velocity.x = utils.choose([velocity.x, -velocity.x])
	#apos fazer as direçoes cria um timer pra começar a disparar
	#yield(utils.create_timer(1), "timeout")
	shoot()
	pass
	
	
func _process(delta):
	#para fazer o inimigo ir para um lado e pra outro
	if get_pos().x <= 0 +16:
		#função abs pela o numero o arredonda
		velocity.x = abs(velocity.x)
	if get_pos().x >= utils.view_size.width - 16:
		velocity.x = -abs(velocity.x)
	
	pass

func shoot():
	#dispara os tiros continuos
	while true:
		var laser = scn_laser.instance()
		laser.set_pos(get_node("cannon").get_global_pos())
		utils.main_node.add_child(laser)
		sounds.play("laser_enemy")
		#cria um timer de intervalo entre os tiros
		yield(utils.create_timer(1.5), "timeout")

	pass

func create_laser(pos):
	
	var laser = scn_laser.instance()
	laser.set_pos(pos)
	utils.main_node.add_child(laser)
	pass