extends Node2D

@export var weapon_type = "pistol"

@warning_ignore("unused_parameter")
func _process(delta):
	if weapon_type == "pistol":
		$images/pistol.visible = true
		$images/silencer.visible = false
		$images/machine.visible = false
	elif weapon_type == "silencer":
		$images/pistol.visible = false
		$images/silencer.visible = true
		$images/machine.visible = false
	elif weapon_type == "machine":
		$images/pistol.visible = false
		$images/silencer.visible = false
		$images/machine.visible = true


func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		if weapon_type == "pistol":
			Global.STORE_OPENED = "pistol"
		elif weapon_type == "silencer":
			Global.STORE_OPENED = "silencer"
		elif weapon_type == "machine":
			Global.STORE_OPENED = "machine"


func _on_area_2d_area_exited(area):
	if area.is_in_group("player"):
		Global.STORE_OPENED = ""
