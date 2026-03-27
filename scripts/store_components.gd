extends Node2D

func _process(delta):
	if Global.STORE_OPENED == "pistol":
		$pistolStore.visible = true
		$silencerStore.visible = false
		$machineStore.visible = false
	elif Global.STORE_OPENED == "silencer":
		$pistolStore.visible = false
		$silencerStore.visible = true
		$machineStore.visible = false
	elif Global.STORE_OPENED == "machine":
		$pistolStore.visible = false
		$silencerStore.visible = true
		$machineStore.visible = false
	elif Global.STORE_OPENED == "":
		$pistolStore.visible = false
		$silencerStore.visible = false
		$machineStore.visible = false

func close_store():
	Global.STORE_OPENED == ""

func _on_button_buy_gun_pressed():
	if Global.MONEY < 1500:
		return
	if Global.current_items[1][0] == "":
		if Global.STORE_OPENED == "pistol":
			Global.current_items[1] = ["pistol", 12, 12, 120, 120]
		elif Global.STORE_OPENED == "silencer":
			Global.current_items[1] = ["silencer", 20, 20, 140, 140]
		elif Global.STORE_OPENED == "machine":
			Global.current_items[1] = ["machine", 40, 40, 200, 200]
	else:
		if Global.STORE_OPENED == "pistol":
			Global.current_items[Global.current_slot] = ["pistol", 12, 12, 120, 120]
		elif Global.STORE_OPENED == "silencer":
			Global.current_items[Global.current_slot] = ["silencer", 20, 20, 140, 140]
		elif Global.STORE_OPENED == "machine":
			Global.current_items[Global.current_slot] = ["machine", 40, 40, 200, 200]
	Global.MONEY -= 1500
	close_store()

func _on_button_buy_ammo_pressed():
	if Global.current_items[0][0] == Global.STORE_OPENED:
		if Global.MONEY >= 1000:
			Global.current_items[Global.current_slot][3] = Global.current_items[Global.current_slot][4]
			Global.MONEY -= 1000
			close_store()
	elif Global.current_items[1][0] == Global.STORE_OPENED:
		if Global.MONEY >= 1000:
			Global.current_items[Global.current_slot][3] = Global.current_items[Global.current_slot][4]
			Global.MONEY -= 1000
			close_store()
