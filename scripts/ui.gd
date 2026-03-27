extends Node2D

func _ready():
	$menu.visible = true
	$inGame.visible = false
	$gameOver.visible = false

@warning_ignore("unused_parameter")
func _process(delta):
	if Global.STORE_OPENED == "":
		$store.visible = false
	elif Global.STORE_OPENED != "":
		$store.visible = true
	
	if Global.GAME_OVER == true:
		$gameOver.visible = true


func _on_button_play_pressed():
	Global.GAME_ON = true
	$menu.visible = false
	$inGame.visible = true


func _on_button_menu_pressed():
	Global.reset_game_value()
	get_tree().reload_current_scene()
