extends Node


@export var enemy_scene: PackedScene

#empezar juego
func _ready() -> void:
	new_game()
#generar una scena cada 2 segundo con timer nodos.
#me encanta
func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.position = Vector2(100,100)
	#darle movimiento al enemy
	enemy.linear_velocity = Vector2(100,50)
	add_child(enemy)
	
#configuracion de la posicion inicial
func new_game():
	$Player.position = $Marker2D.position
