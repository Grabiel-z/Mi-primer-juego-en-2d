extends RigidBody2D


func _ready() -> void:
		var enemy_types = $AnimatedSprite2D.sprite_frames.get_animation_names() #creacion de array de animaciones.
		var random_type_number = randi_range(0, enemy_types.size() -1 )
		$AnimatedSprite2D.play(enemy_types[random_type_number])
#El array `enemy_types` contiene los nombres de las animaciones, y como los arrays en GDScript 
#comienzan en el índice 0, el primer índice es 0, el segundo es 1, y el último índice es 2 
#para un total de 3 elementos. Por eso, si tenemos 3 animaciones, el índice máximo será `size() - 1`,
#que en este caso es 2. Esto se debe a que el rango de índices válidos es de 0 a `size() - 1`, 
#lo que nos permite generar un número aleatorio entre 0 y 2 para seleccionar una animación aleatoria.
		

#evento para que cada vez que salga de la pantalla salga algo en este caso eliminarlos.
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() #eliminar enemigo
