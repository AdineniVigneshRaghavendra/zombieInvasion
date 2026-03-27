extends Node2D

@export var left_of_door = ""
@export var right_of_door = ""
@onready var nav_spot = preload("res://components/nav_tile.tscn")


func _on_area_2dr_area_entered(area):
	if area.is_in_group("player"):
		$CanvasLayerR.visible = true


func _on_area_2dr_area_exited(area):
	if area.is_in_group("player"):
		$CanvasLayerR.visible = false


func _on_area_2dl_area_entered(area):
	if area.is_in_group("player"):
		$CanvasLayerL.visible = true


func _on_area_2dl_area_exited(area):
	if area.is_in_group("player"):
		$CanvasLayerL.visible = false


func _on_button_buy_r_pressed():
	if Global.MONEY >= 1000:
		Global.MONEY -= 1000
		for area in Global.unlocked_area:
			if area == left_of_door:
				add_nav_spot()
				queue_free()
		Global.unlocked_area.append(left_of_door)
		add_nav_spot()
		queue_free()


func _on_button_buy_l_pressed():
	if Global.MONEY >= 1000:
		Global.MONEY -= 1000
		for area in Global.unlocked_area:
			if area == right_of_door:
				add_nav_spot()
				queue_free()
		Global.unlocked_area.append(right_of_door)
		add_nav_spot()
		queue_free()
func add_nav_spot():
	var new_nav = nav_spot.instantiate()
	add_sibling(new_nav)
	new_nav.global_position = global_position
