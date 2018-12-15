extends Area2D

#velocidade da nave
var velocity = Vector2()

var screensize

#constante da scene do laser do hero, faz o preload do recurso enquanto esse script estiver ativo
const scn_lasers = preload("res://assets/scenes/laser_hero.tscn")
const scn_explosion= preload("res://assets/scenes/explosion.tscn")

func _ready():
	set_process(true)
	screensize = Vector2(800,600)
	#cria um timer que quando acaba o tempo ativa o tiro
	yield(utils.create_timer(0.5),"timeout")
	shot()
	pass
func _process(delta):
	velocity = Vector2()
	# pega a posiçao do mouse no x menos a posiçao atual mult pelo valor frame
	var motion = (utils.mouse_pos.x - get_pos().x) * 0.2
	translate(Vector2(motion, 0))
	
	var pos = get_pos()
	pos += velocity*delta
	#prende dos valores em um intervalo
	pos.x   = clamp(pos.x,0, utils.view_size.width)
	set_pos(pos)
	pass

func shot():
	while true:
		var cannon = get_node("cannon/laser").get_global_pos()
		create_laser(cannon)
		#cria os laser nessa quantidade de tempo
		yield(utils.create_timer(0.25), "timeout")
	pass

#tiros de varias posicoes
func create_laser(pos):
	
	var laser = scn_lasers.instance()
	laser.velocity.y = -500
	laser.set_pos(pos)
	utils.main_node.add_child(laser)
	sounds.play("laser_ship")
	pass

func _on_hero_space_ship_area_enter( other ):
	if other.is_in_group("enemys") or other.is_in_group("enemy_laser"):
		utils.find_node("bar_life").bar_life = 0.3
		other.queue_free()
		sounds.play("hit_ship")
		
	
	pass 
func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.set_pos(get_pos())
	utils.main_node.add_child(explosion)
	pass

func _on_bar_life_lose():
	utils.find_node("timer_over").start()
	utils.find_node("game_over").show()
	utils.find_node("spawn_enemy").queue_free()
	create_explosion()
	queue_free()
	pass
