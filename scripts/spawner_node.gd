extends Node2D

enum WaveState {
	START,
	CLEANUP,
	SPAWNING_WAVE
}

const BASE_ZOMBIES = 20
const WAVE_INCREMENT = 5

const BASE_SPAWN_RATE = 2.0
const SPAWN_RATE_DECREMENT = 0.1

var current_wave_state: WaveState= WaveState.START
var current_wave = Global.wave
var zombies_to_spawn: int = 0
var zombies_in_current_wave: int = 0
var zombies_points: Array[Node] = [] as Array[Node]

var added_right_points = false
var added_left_points  = false
var added_top_points = false
var last_updated_areas: Array = []

@onready var basicZombie = preload("res://components/zombie.tscn")
@onready var spawn_timer: Timer = $TimerSpawn

func _ready():
	if current_wave == 0:
		current_wave = 1
		Global.dead_zoms = 0
	zombies_in_current_wave = 0
	update_current_zom_points()
	
func _process(delta):
	if last_updated_areas != Global.unlocked_area:
		update_current_zom_points()
	if Global.GAME_ON and current_wave_state == WaveState.START:
		start_wave_sequence()
	
	match current_wave_state:
		WaveState.CLEANUP:
			if not Global.GAME_ON:
				return
			if Global.dead_zoms >= zombies_in_current_wave:
				Global.dead_zoms = 0
				start_wave_sequence()
