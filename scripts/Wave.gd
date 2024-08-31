extends Node2D


signal wave_end


var mob_spawn_cooldown: float = 0.2
var wave_timeout_sec: float = 5
var speed: float = 400
var x_delta_min: float = -5
var x_delta_max: float = 5
var y_delta_min: float = -5
var y_delta_max: float = 5


var enemy_max_count: int = 25
var enemy_spawned: int = 0
var enemy_killed: int = 0


export (PackedScene) var Mob


func _spawn_mob():
	var position = $MobSpawnPath/PathFollow2D.position
	var mob = Mob.instance()
	mob.velocity = Vector2(0, 1).normalized()
	mob.speed = 10
	var delta = Vector2(
		rand_range(x_delta_min, x_delta_max), 
		rand_range(y_delta_min, y_delta_max)
	)
	mob.position = position + delta
	add_child(mob)


func _ready() -> void:
	$MobSpawnPath/PathFollow2D.unit_offset = randf()
	$WaveTimeoutTimer.wait_time = wave_timeout_sec
	$MobSpawnTimer.wait_time = mob_spawn_cooldown
	$MobSpawnTimer.start()
	$WaveTimeoutTimer.start()
	
	
func _process(delta: float) -> void:
	$MobSpawnPath/PathFollow2D.offset += rand_range(0, speed) * delta
	
	
func _on_MobSpawnTimer_timeout() -> void:
	if enemy_spawned < enemy_max_count:
		enemy_spawned += 1
		_spawn_mob()


func _on_WaveTimeoutTimer_timeout() -> void:
	$MobSpawnTimer.stop()
	emit_signal("wave_end")


func _on_Wave_wave_end() -> void:
	get_tree().call_group("mob", "emit_die")
