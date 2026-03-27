extends Node2D

var game_ended = false


func _process(delta):
	if Global.GAME_OVER == true and game_ended == false:
		game_ended = true
		$AnimationPlayer.play("gameOver")
		
