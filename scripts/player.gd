extends Area2D
@export var speed = 400
var screen_size
signal hit


func _ready() -> void:
	screen_size = get_viewport_rect().size
	hide()
	#recibe la posicion del player.
func start(pos):
	position=pos
	show()
	$CollisionShape2D.disabled=false

func _process(delta: float) -> void:
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if direction:
		position += direction * speed * delta
		if direction.x:
			$AnimatedSprite2D.play("walk")
			$AnimatedSprite2D.flip_v=false
			$AnimatedSprite2D.flip_h = direction.x < 0 #esto es si el jugador va a la ezquierda se activa esta condicion que voltea el sprite.
		elif direction.y:
			$AnimatedSprite2D.play("up")
			$AnimatedSprite2D.flip_v = direction.y > 0
			
#flip_h (flip horizontal):
#Es útil para personajes que miran en una dirección horizontal (por ejemplo, de izquierda a derecha).
#flip_v (flip vertical):
#Puede no ser necesario en la mayoría de los casos, ya que los personajes generalmente no necesitan ser volteados verticalmente.
# Sin embargo, si tu sprite tiene una animación donde mirar hacia arriba/abajo cambia visualmente, puede ser útil.
	position = position.clamp(Vector2.ZERO, screen_size)

func _on_body_entered(body: Node2D) -> void:
	hit.emit()
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
