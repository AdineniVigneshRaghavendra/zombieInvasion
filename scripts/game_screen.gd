extends Node2D

@onready var health_bar = $healthBar
@onready var ammo_label = $ammoText/LabelAmmo
@onready var money_text = $LabelMoney

func _process(delta):
	if Global.GAME_OVER == true:
		return
	update_gun_name()
	update_reloading_text()
	
	var current_clip_value: int = Global.current_items[Global.current_slot][2]
	var current_ammo_value: int = Global.current_items[Global.current_slot][3]
	var current_clip = str("%02d" % current_clip_value)
	var current_ammo = str("%03d" % current_ammo_value)
	
	ammo_label.text = current_clip + "/" + current_ammo
	money_text.text = "$" + str("%06d" % Global.MONEY)
	
	if Global.PLAYER_HEALTH < 90:
		Global.PLAYER_HEALTH += 3 * delta
		Global.PLAYER_HEALTH = min(Global.PLAYER_HEALTH, 90.0)
		
	if Global.PLAYER_HEALTH <= 0:
		Global.GAME_OVER = true
	
	health_bar.value = Global.PLAYER_HEALTH
	$LabelWaves.text = "Wave " + str(Global.wave)
	
func update_gun_name():
	if Global.current_items[Global.current_slot][0] == "pistol":
		$gunName/LabelPistol.visible = true
		$gunName/LabelSilencer.visible = false
		$gunName/LabelMachine.visible = false
	elif Global.current_items[Global.current_slot][0] == "silencer":
		$gunName/LabelPistol.visible = false
		$gunName/LabelSilencer.visible = true
		$gunName/LabelMachine.visible = false
	if Global.current_items[Global.current_slot][0] == "machine":
		$gunName/LabelPistol.visible = false
		$gunName/LabelSilencer.visible = false
		$gunName/LabelMachine.visible = true

func update_reloading_text():
	if Global.RELOADING == true:
		$ammoText/LabelReloading.visible = true
		$ammoText/LabelAmmo.visible = false
	else:
		$ammoText/LabelReloading.visible = false
		$ammoText/LabelAmmo.visible = true
