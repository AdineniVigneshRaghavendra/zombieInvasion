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
var zombie_health = 0
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

func reset
