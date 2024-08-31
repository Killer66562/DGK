extends Node2D


signal stage_clear
export (Array, PackedScene) var Waves: Array
var current_wave = null
onready var idx: int = 0


func _ready() -> void:
	randomize()
	_on_current_wave_end()
	
	
func _on_current_wave_end():
	if idx < Waves.size():
		current_wave = Waves[idx].instance()
		current_wave.connect("wave_end", self, "_on_current_wave_end")
		add_child(current_wave)
		idx += 1
	else:
		emit_signal("stage_clear")
		get_tree().quit(0)
