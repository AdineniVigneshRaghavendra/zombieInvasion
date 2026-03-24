extends Node

const MAGAZINE_SIZE = 1
const BULLETS_IN_CLIP = 2
const AMMO_RESERVE = 3
var SHOT_DELAY = 0.3

var GAME_ON = false
var GAME_OVER = false
var MONEY = 500
var PLAYER_HEALTH = 90.0
var STORE_OPENED = null

var RELOADING = false

var current_items = [
	["pistol", 12, 12, 120, 120],
	["", 0, 0, 0, 0]
]

var current_slot: int = 0
var RELOAD_TIME: float = 2.0
var BULLET_SPEED: float = 1400.0

var unlocked_area = ["bottom"]
var wave = 1
var zom_health = 0
var dead_zoms = 0

func _process(delta):
	if current_items[current_slot][0] == "pistol":
		SHOT_DELAY = 0.3
		RELOAD_TIME = 1.0
	elif current_items[current_slot][0] == "silencer":
		SHOT_DELAY = 0.2
		RELOAD_TIME = 0.5
	elif current_items[current_slot][0] == "machine":
		SHOT_DELAY = 0.1
		RELOAD_TIME = 2.0

func reset_game_value():
	GAME_ON = false
	GAME_OVER = false
	MONEY = 500
	PLAYER_HEALTH = 90.0
	STORE_OPENED = null
	current_slot = 0
	RELOADING = false
	unlocked_area = ["bottom"]
	wave = 1
	zom_health = 0
	dead_zoms = 0
	current_items = [
	["pistol", 12, 12, 120, 120],
	["", 0, 0, 0, 0]
]

func get_current_weapon_stats() -> Array:
	return current_items[current_slot]
	
func get_current_bullets() -> int:
	return current_items[current_slot][BULLETS_IN_CLIP]

func get_max_clip_size() -> int:
	return current_items[current_slot][MAGAZINE_SIZE]

func get_reserve_ammo() -> int:
	return current_items[current_slot][AMMO_RESERVE]
	
