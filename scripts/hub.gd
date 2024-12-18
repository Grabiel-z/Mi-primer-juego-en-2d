extends CanvasLayer

signal start_game
func _ready() -> void:
	$ButtonStart.grab_focus()
func _on_button_start_pressed() -> void:
	$ButtonStart.hide()
	start_game.emit()
func update_score(score: int):
	$LabelScore.text= str(score)
	
func show_message(text: String):
	$LabelTitle.text = text
	$LabelTitle.show()
	$TimerStart.start()
func show_game_over():
	show_message("PERDISTE PAPU D:")
	await $TimerStart.timeout
	$LabelTitle.text= "esquiva los bichos D:"
	$LabelTitle.show()
	await get_tree().create_timer(1.0).timeout
	$ButtonStart.show()
	$ButtonStart.grab_focus()
func _on_timer_timeout() -> void:
	$LabelTitle.hide()
